/*
HOW TO USE:
1) Enable on select easy/medium/hard screen
2) Disable when you have a good score
3) Set player Y to about 3000 to kill him
*/

[Enable]
alloc(newmem,2048)
label(returnhere)
label(exit)
label(phase1)
label(phase2)
globalalloc(TurmacAdd, 4)
alloc(phase, 1)

"Flash11e.ocx"+130F40:
nop
nop
nop

newmem:
cmp [phase], 1
je phase1
cmp [phase], 2
je phase2

//First time through nothing special happens
mov [ecx+3C], ebx
inc [phase]

exit:
mov ecx,[ebp+08]
push 00
jmp returnhere

phase1:
//Find address of player Y
mov [TurmacAdd], ecx
add [TurmacAdd], 3C
inc [phase]

phase2:
push eax
mov eax, [TurmacAdd]
mov [eax], 00000005
pop eax
jmp exit

"Flash11e.ocx"+130F43:
jmp newmem
returnhere:


[Disable]
dealloc(newmem)
dealloc(phase)
"Flash11e.ocx"+130F40:
mov [ecx+3C], ebx
//Alt: db 90 90 90 8B 4D 08
"Flash11e.ocx"+130F43:
mov ecx,[ebp+08]
push 00
//Alt: db 8B 4D 08 6A 00