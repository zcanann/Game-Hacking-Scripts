/*
HOW TO USE:
1) type 'superextrahypergravitymode' to enable
gravity mode
2) Select 'Stop n go' mode
3) Click 'Play Game' and stay on startup menu
4) Enable hack
5) Disable when satisfied with score
*/
[Enable]
alloc(newmem2,2048)
label(returnhere2)
label(exit2)
alloc(newmem,2048)
label(returnhere)
label(exit)
label(setPlayer)
label(setNegg)
label(setPositions)
label(back)

alloc(MeercaAdd, 4)
alloc(NeggAdd, 4)
alloc(phase, 4)

newmem2:
//Sets object X to 0
mov esi, 00000FA0
//Finds player address & sets X to 4000
cmp [phase], 00000000
je setPlayer
//Finds neggs address & sets X to 4000
cmp [phase], 00000001
je setNegg

mov [ecx+38],esi
cmp [phase], 00000002
je setPositions

back:
jmp "Flash11e.ocx"+130F43

exit2:
jmp returnhere2

setPositions:
push eax
mov eax, [MeercaAdd] //Get address
mov [eax], 00001388
mov eax, [NeggAdd] //Get address
mov [eax], 00001388
pop eax
jmp back

setPlayer:
inc [phase]
mov [MeercaAdd], ecx
add [MeercaAdd], 38
mov esi, 00001388
jmp back

setNegg:
inc [phase]
mov [NeggAdd], ecx
add [NeggAdd], 38
mov esi, 00001388
jmp back

"Flash11e.ocx"+130F36:
jmp newmem2
returnhere2:

newmem:
//Unrelated code
cmp [ecx+3C],ebx
je "Flash11e.ocx"+130F55

mov ebx, 00000FA0
mov [ecx+3C], ebx

exit:
jmp returnhere

"Flash11e.ocx"+130F3B:
jmp newmem
nop
nop
nop
returnhere:



[Disable]
dealloc(newmem2)
dealloc(MeercaAdd)
dealloc(NeggAdd)
dealloc(phase)
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