[Enable]
alloc(newmem,2048)
alloc(playerX, 4)
alloc(phase, 4)
label(findPlayerX)
label(getPlayerX)
label(back)

newmem:
//Try to find player's X
cmp [playerX], 00000000
je findPlayerX

back:
push eax
mov eax, ecx
add eax, 38
cmp eax, [playerX] //Check if player address
pop eax
//Exit if not player address
jne "Flash11e.ocx"+130F43
//Update player's address
mov [ecx+38],esi
jmp "Flash11e.ocx"+130F43

findPlayerX:
inc [phase]
cmp [phase], 5
je getPlayerX
mov [ecx+38],esi
jmp back

getPlayerX:
mov [playerX], ecx
add [playerX], 38
jmp back


"Flash11e.ocx"+130F36:
jmp newmem

[Disable]
dealloc(newmem)
dealloc(playerX)
dealloc(phase)
"Flash11e.ocx"+130F36:
mov [ecx+38],esi
jmp "Flash11e.ocx"+130F43
//Alt: db 89 71 38 EB 08