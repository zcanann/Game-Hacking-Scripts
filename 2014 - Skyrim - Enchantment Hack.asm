/*
Does the following
- Infinite HP
- Infinite mana
- Infinite stamina
- Infinite Item enchantment
  Note: if charge is empty, requip item to
  gain full charge back while hack enabled
- Infinite carry capacity
*/

[Enable]
alloc(newmem,256)
label(returnhere)
label(exit)
label(enchantment)
label(attribute)

newmem:
add eax, 04
//load pointer into ebx
push ebx
mov ebx, ["TESV.exe"+010BC564]
add ebx, 78
mov ebx, [ebx]

//Add offset, compare, jump, subtract, repeat

add ebx, 11C
cmp eax, ebx
je enchantment
sub ebx, 11C

/*
add ebx, 2C
cmp eax, ebx
je attribute //stamina
sub ebx, 2C

add ebx, 1C
cmp eax, ebx
je attribute //health
sub ebx, 1C

add ebx, 24
cmp eax, ebx
je attribute //mana
sub ebx, 24
*/

exit:
sub eax, 04
pop ebx
fld dword ptr [eax+04]
mov esp,ebp
jmp returnhere

enchantment:
mov [eax], 453B8000
jmp exit

attribute:
//Load current value of attribute
//mov ebx, [ebx]
//load that into what is being pushed
//mov [eax], ebx
mov [eax], 453B8000
jmp exit

"TESV.exe"+1C8A1A:
jmp newmem
returnhere:

[Disable]
dealloc(newmem)
"TESV.exe"+1C8A1A:
fld dword ptr [eax+04]
mov esp,ebp
//Alt: db D9 40 04 8B E5