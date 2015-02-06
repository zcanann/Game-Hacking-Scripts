[Enable]
//X VALUES HACK
alloc(newmem2,2048)
label(returnhere2)
label(exit2)
alloc(pteraX, 4)
label(setPteraXAdd)
label(cont)
label(xBounds)
label(lower)
label(upper)

newmem2:
//Set up address
cmp [pteraX], 00000000
je setPteraXAdd

//Check if address being updated is ptera
push eax
mov eax, ecx
add eax, 38
cmp [pteraX], eax
pop eax
je xBounds //Prevent off bounds damage :)

cont:
mov [ecx+38],esi

exit2:
jmp "Flash11e.ocx"+130F43
jmp returnhere2


setPteraXAdd:
mov [pteraX], ecx
add [pteraX], 38
jmp cont

xBounds:
cmp esi, 0000040B
jle lower
cmp esi, 00002305
jge upper
jmp cont

lower:
mov esi, 0000040B
jmp cont

upper:
mov esi, 00002305
jmp cont


"Flash11e.ocx"+130F36:
jmp newmem2
returnhere2:

//Y VALUES HACK
alloc(newmem,2048)
label(returnhere)
label(exit)
label(testD)
label(testU)
label(back)
alloc(pteraY, 4)
label(setPteraYAdd)

newmem:
//Unrelated code
cmp [ecx+3C],ebx
je "Flash11e.ocx"+130F55

//Set up address
cmp [pteraY], 00000000
je setPteraYAdd

//Check if address being updated is ptera
push eax
mov eax, ecx
add eax, 3C
cmp [pteraY], eax
pop eax
je back

//Check if just created - if so ignore it
cmp ebx, 00000000
je back
cmp [ecx+3C], 00000000
je back

//test if moving up or down
// next > current
cmp [ecx+3C], ebx
jle testD
// current > next
cmp [ecx+3C], ebx
jge testU

back:
mov [ecx+3C], ebx

exit:
jmp returnhere

setPteraYAdd:
mov [pteraY], ecx
add [pteraY], 3C
jmp back

//Object moving upwards. This filters out
//Dinosaurs from bullets
testU:
push eax
mov eax, [ecx+3C] //Load current val
sub eax, ebx      //Get Speed
cmp eax, 00000100 //Test speed vs 256
pop eax
jge back          //Speed is fast; return
//Speed is slow, set offscreen
mov [ecx+3C], 00002EE0
jmp exit

//Object moving downwards. This filters out
//Slowpokes & upgrades
testD:
push eax
push ebx
mov eax, [ecx+3C] //Load current val
sub ebx, eax      //Get Speed
cmp ebx, 00000100 //Test speed vs 256
pop ebx
pop eax
jle back          //Speed is slow; return
//Speed is fast, freeze it (pteradactyl)
mov [ecx+3C], 00000200
jmp exit

"Flash11e.ocx"+130F3B:
jmp newmem
nop
nop
nop
returnhere:

[Disable]
dealloc(newmem2)
"Flash11e.ocx"+130F36:
mov [ecx+38],esi
jmp "Flash11e.ocx"+130F43
//Alt: db 89 71 38 EB 08
dealloc(newmem)
"Flash11e.ocx"+130F3B:
cmp [ecx+3C],ebx
je "Flash11e.ocx"+130F55
mov [ecx+3C], ebx
//Alt: db 39 59 3C 74 15