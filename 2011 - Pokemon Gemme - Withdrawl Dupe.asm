//While this is enabled you can't release from your group

[Enable]
alloc(newmem,64)
label(exit)

newmem:
//EAX is only 4 on a widthdrawl (where dupe takes place)
cmp eax, 000000004
je exit //If its 4, skip code & cause a duplication
mov [edx+edi*4],eax

exit:
//Irrelevant code
pop edi
pop ebx
//Return back to code
jmp "RGSS100J.dll"+1A32D

"RGSS100J.dll"+1A328:
jmp newmem

[Disable]
dealloc(newmem)
"RGSS100J.dll"+1A328:
mov [edx+edi*4],eax
pop edi
pop ebx
//Alt: db 89 04 BA 5F 5B