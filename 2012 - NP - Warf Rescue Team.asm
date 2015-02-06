[Enable]
globalalloc(Enabled, 1)
globalalloc(WarfPower, 4)
alloc(newmem,2048)
label(returnhere)
label(powerhack)
label(apply)
label(exit)

newmem:
//Load adress being pushed
push eax
mov eax, esi
add eax, 60
//Check if hack is enabled
cmp [Enabled], 1
je powerhack
//Hack not enabled; enable it & set address
mov [Enabled], 1
mov [WarfPower], eax
jmp powerhack

exit:
pop eax
jmp returnhere

//Hack
powerhack:
//Check if address being changed is power
cmp [WarfPower], eax
je apply
//Not correct address, go through as normal
fld qword ptr [ebp+0C]
fstp qword ptr [eax]
jmp exit

//Applies hack
apply:
fld qword ptr [ebp+0C]
mov eax, [WarfPower]
//fstp qword ptr [esi+60]
fstp qword ptr [eax]
jmp exit

"Flash11e.ocx"+EB0C7:
jmp newmem
nop
returnhere:


[Disable]
dealloc(newmem)
dealloc(Enabled)
dealloc(WarfPower)
"Flash11e.ocx"+EB0C7:
fld qword ptr [ebp+0C]
fstp qword ptr [esi+60]
//Alt: db DD 45 0C DD 5E 60