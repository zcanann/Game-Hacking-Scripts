/*
HOW TO USE:
1) Enable on main menu screen
2) Using the total object count, your brain,
etc, count the potatoes.
3) Disable when you know the count
4) Enter correct guess
5) Renable before next round
6) Lose when satisfied with score

Known bugs:
- # objects can get thrown off rarely
- Due to disabled rotation & scale, some objects
disapper, again -- rarely.

This game is fast-paced, so if something goes
wrong, try again, it doesn't really matter.
*/
[Enable]
//Scale reduction:
"Flash11e.ocx"+EB530:
nop
nop
nop
"Flash11e.ocx"+EB5D7:
nop
nop
nop
//Rotation freeze:
"Flash11e.ocx"+EB0E1:
fstp dword ptr [ebp+50]
"Flash11e.ocx"+EB0E4:
fstp dword ptr [ebp+0C]

//MAIN SCRIPT:
alloc(newmem2,2048)
globalalloc(Potatoes, 4)
label(returnhere2)
label(exit2)
alloc(newmem,2048)
alloc(newX, 4)
alloc(newY, 4)
label(resetX)
label(setInitY)
label(setX)
label(back)
label(cont)

//Disables overwriting of object count
"Flash11e.ocx"+48FD48:
nop
nop
nop

//Update object count
newmem2:
add [esi+18],ebx
push eax
mov eax, [esi+18]
mov [Potatoes], eax
pop eax

//Unrelated code
add [esi+1C],ebx
exit2:
jmp returnhere2

"Flash11e.ocx"+49037D:
jmp newmem2
nop
returnhere2:

//Disable Y (We'll deal with that later)
"Flash11e.ocx"+130F40:
nop
nop
nop

//X HACK
newmem:
//Check if just created
cmp [ecx+38], 00000000
je setX

back:
jmp "Flash11e.ocx"+130F43

setX:
cmp [newY], 00000000
je setInitY
cont:
add [newX], 000003E8 //add X by 1000
push eax
mov eax, [newX]   //load new X value
mov [ecx+38], eax //set new X value
mov eax, [newY]   //load new Y value
mov [ecx+3C], eax //set new Y value
pop eax

cmp [newX], 000032C8 //13000
je resetX
jmp back

resetX:
add [newY], 000003E8 //add Y by 1000
mov [newX], 00000000 //reset X
jmp back

setInitY:
add [newY], 000003E8 //add Y by 1000
jmp cont

"Flash11e.ocx"+130F36:
jmp newmem

[Disable]
dealloc(newmem2)
dealloc(newmem)
dealloc(newX)
dealloc(newY)
//SCALE STUFF
"Flash11e.ocx"+EB530:
fstp dword ptr [esi+28]
"Flash11e.ocx"+EB5D7:
fstp dword ptr [esi+34]
//Alt: db D9 5E 28 E8 88 9E F6 FF
//OBJECT COUNTING STUFF
"Flash11e.ocx"+48FD48:
mov [ebx+18],eax
mov eax,esi
//Alt: db 89 43 18 8B C6
"Flash11e.ocx"+49037D:
add [esi+18],ebx
add [esi+1C],ebx
//Alt: db 01 5E 18 01 5E 1C
//X & Y STUFF
"Flash11e.ocx"+130F40:
mov [ecx+3C], ebx
//Alt: db 39 59 3C 74 15
"Flash11e.ocx"+130F36:
mov [ecx+38],esi
jmp "Flash11e.ocx"+130F43
//Alt: db 89 71 38 EB 08