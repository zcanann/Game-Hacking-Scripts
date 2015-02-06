[Enable]
/*
HOW TO USE:
1) Enable ingame on "Level: 1" screen
2) Let rocks to accumulate (NOT on bonus round)
for high score
3) Finish game. Disabling isn't required at a
specific point in time.
*/
alloc(newmem2,2048)
label(returnhere2)
label(exit2)

newmem2:
mov [ecx+38],00001B58
jmp "Flash11e.ocx"+130F43

exit2:
jmp returnhere2

"Flash11e.ocx"+130F36:
jmp newmem2
returnhere2:

alloc(newmem,2048)
label(returnhere)
label(exit)
label(ignore)
"Flash11e.ocx"+130F40:
nop
nop
nop

newmem:
push eax
mov eax, [ecx+3C]
cmp eax, 00001518
je ignore
cmp eax, FFFFDBAC
je ignore
cmp eax, 00000FA0
je ignore
cmp eax, 00002008
je ignore
cmp eax, FFFFF830
je ignore
mov [ecx+3C], 00000FA0 //4000
ignore:
pop eax
mov ecx,[ebp+08]
push 00

exit:
jmp returnhere

"Flash11e.ocx"+130F43:
jmp newmem
returnhere:


[Disable]
dealloc(newmem2)
"Flash11e.ocx"+130F36:
mov [ecx+38],esi
jmp "Flash11e.ocx"+130F43
//Alt: db 89 71 38 EB 08
"Flash11e.ocx"+130F40:
mov [ecx+3C], ebx
//Alt: db 90 90 90 8B 4D 08
dealloc(newmem)
"Flash11e.ocx"+130F43:
mov ecx,[ebp+08]
push 00
//Alt: db 8B 4D 08 6A 00