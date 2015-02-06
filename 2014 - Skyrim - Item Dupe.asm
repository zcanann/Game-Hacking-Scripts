/*
Prevents items from leaving the inventory.
This includes NPCs. Allows the user to drop
items, while keeping them in their bag,
duplicating them.

The item that remains in the inventory will no longer be marked stolen.

Some stacked items are exempt from this
occasionally, in which case the complete
stack is not duplicated, and instead only
a portion is.
*/

[Enable]
alloc(newmem5,64)
label(returnhere5)
label(exit5)

newmem5:
mov ecx,[ebp-38]
exit5:
jmp returnhere5

"TESV.exe"+AD857:
jmp newmem5
nop
returnhere5:

alloc(newmem3,64)
label(returnhere3)
label(exit3)

newmem3:
mov ecx,[ebp-38]

exit3:
jmp returnhere3

"TESV.exe"+AF31C:
jmp newmem3
nop
returnhere3:

alloc(newmem2,64)
label(returnhere2)
label(exit2)

newmem2:
mov eax,[ebp+14]

exit2:
jmp returnhere2

"TESV.exe"+AE7CC:
jmp newmem2
nop
returnhere2:

alloc(newmem,64)
label(returnhere)
label(exit)

newmem:
mov ecx,[ebp-000000C0]

exit:
jmp returnhere

"TESV.exe"+AF17D:
jmp newmem
nop
nop
nop
nop
returnhere:


[Disable]
dealloc(newmem5)
"TESV.exe"+AD857:
mov [edx+08],ecx
mov ecx,[ebp-38]
//Alt: db 89 4A 08 8B 4D C8
dealloc(newmem3)
"TESV.exe"+AF31C:
mov [ecx+08],eax
mov ecx,[ebp-38]
//Alt: db 89 41 08 8B 4D C8
dealloc(newmem2)
"TESV.exe"+AE7CC:
mov [edx+08],ecx
mov eax,[ebp+14]
//Alt: db 89 4A 08 8B 45 14
dealloc(newmem)
"TESV.exe"+AF17D:
mov [eax+08],edx
mov ecx,[ebp-000000C0]
//Alt: db 89 50 08 8B 8D 40 FF FF FF