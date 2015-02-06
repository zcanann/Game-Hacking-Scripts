/*
HOW TO USE:
1) Enable on 'Game Start!' screen
2) Hold up arrow key to collect dubloons
3) Disable hack when satisfied
4) Run into a mine
*/

[Enable]
//Variables, labels, etc
alloc(newmem,2048)
label(returnhere)
label(exit)
label(phase0)
label(phase1)
label(phase2)
label(phase3)
label(cont)
label(dubloon)
label(player)
label(enemy)
alloc(KrawkAdd, 4)
alloc(DubloonAdd, 4)
alloc(phase, 4)
alloc(subphase, 4)
alloc(newmem2,2048)
label(returnhere2)
label(exit2)

//Sets X position of all objects
newmem2:
mov [ecx+38],1338
jmp "Flash11e.ocx"+130F43

exit2:
jmp returnhere2

"Flash11e.ocx"+130F36:
jmp newmem2
returnhere2:

//No words can explain

"Flash11e.ocx"+130F40:
nop
nop
nop

newmem:
//Set dubloon adr
cmp [phase], 0
je phase2
//Set player adr
cmp [phase], 1
je phase0
//Set player pos
cmp [phase], 2
je phase1
//And now the main hack cycle
jmp phase3

//Set up player address
phase0:
mov [DubloonAdd], ecx
add [DubloonAdd], 3C
//Set player value
phase1:
mov [ecx+3C], 1388
inc [phase]

//Exits hack subroutine
exit:
//Unrelated code
mov ecx,[ebp+08]
push 00
jmp returnhere

phase2:
//Set up initial dubloon address
mov [KrawkAdd], ecx
add [KrawkAdd], 3C
mov [ecx+3C], 1388
inc [phase]
jmp exit

//Last phase; finds dubloon/enemy adr
phase3:
//load current adr
push eax
mov eax, ecx
add eax, 3C

//Check if player
cmp eax, [KrawkAdd]
je player
cmp eax, [DubloonAdd]
je dubloon

cmp [subphase], 1
je enemy
cmp [subphase], 0
je dubloon //Must be a new dubloon adr

//Initial derp
mov [subphase], 0
pop eax
jmp exit

//Set new dubloon address
dubloon:
mov [subphase], 0
mov [DubloonAdd], eax
jmp cont

enemy:
mov [subphase], 1
//Set enemy value to 0
//mov [eax], 00000000
pop eax
jmp exit

player:
mov [eax], 00001338
pop eax
jmp exit

cont:
//Set Krawk Y and Dubloon Y
mov eax, [KrawkAdd]
mov [eax], 00000000
mov eax, [DubloonAdd]
mov [eax], 1388
pop eax
jmp exit

"Flash11e.ocx"+130F43:
jmp newmem
returnhere:


[Disable]
dealloc(KrawkAdd, 4)
dealloc(DubloonAdd, 4)
dealloc(phase, 4)
dealloc(subphase, 4)
dealloc(newmem2)
dealloc(newmem)

"Flash11e.ocx"+130F36:
mov [ecx+38],esi
jmp "Flash11e.ocx"+130F43
//Alt: db 89 71 38 EB 08
"Flash11e.ocx"+130F40:
mov [ecx+3C], ebx
//Alt: db 90 90 90 8B 4D 08
"Flash11e.ocx"+130F43:
mov ecx,[ebp+08]
push 00
//Alt: db 8B 4D 08 6A 00