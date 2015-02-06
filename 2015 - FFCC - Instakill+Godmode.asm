[Enable]
/*
AOB scan for code that decreases player HP
player HP is a big endian 2 byte value that is heart count x 2
*/

alloc(newmem, 64)
label(exit)
label(returnhere)
label(godmode)

registersymbol(takedamage)
aobscan(takedamage, 66 42 89 54 3B 1C 44 89 7D 90 89 75 F4 C5 C9)

newmem:
// Compare to the r15 register to determine if player
// (playerHP address = 0x7FFF0000 + 1C + this value)
cmp r15d, 8021F270
je godmode

// Zero out dx and si registers (instakill)
xor dx, dx
xor si, si
jmp exit

godmode:
mov dx, FFFF
mov si, FFFF

exit:
mov [rbx+r15+1C], dx
jmp returnhere

takedamage:
jmp newmem
nop
returnhere:

[Disable]
dealloc(newmem)
unregistersymbol(takedamage)
takedamage:
mov [rbx+r15+1C], dx
//Alt: db 66 42 89 54 3B 1C
