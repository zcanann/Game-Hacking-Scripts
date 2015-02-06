[Enable]
//DISABLE COST
"Torchlight.exe"+B02DE:
mov eax, 00000000
nop
nop
nop

//Disable chance of fail (not de, but fail)
"Torchlight.exe"+1D9EE:
nop
nop

//COMPUTATION CHANGES
"Torchlight.exe"+175F87:
fld dword ptr [Torchlight.exe+7E800C]
mov eax,[esp+14] //Vestige
fild dword ptr [Torchlight.exe+7E800C]

"Torchlight.exe"+175F78:
fld dword ptr [Torchlight.exe+7E800C]

//GUARENTEE ENCHANT
"Torchlight.exe"+176351:
nop
nop
nop
nop
nop
nop

//VISUAL ONLY; NO INGAME EFFECT
"Torchlight.exe"+174201:
fld dword ptr [Torchlight.exe+7E800C]
fild dword ptr [Torchlight.exe+7E800C]

"Torchlight.exe"+1741EE:
fld dword ptr [Torchlight.exe+7E800C]


[Disable]
//DISABLE COST
"Torchlight.exe"+B02DE:
jnge Torchlight.exe+B02E2
mov eax,esi
mov ecx,[esp+2C]
//Alt: db 7C 02 8B C6 8B 4C 24 2C

//Disable chance of fail (not DE)
"Torchlight.exe"+1D9EE:
fldz

//COMPUTATION CHANGES
"Torchlight.exe"+175F87:
fld dword ptr [eax+98]
mov eax,[esp+14] //Vestige
fild dword ptr [esp+14]

"Torchlight.exe"+175F78:
fld dword ptr [eax+7C]

"Torchlight.exe"+176351:
jne Torchlight.exe+1764D7

//VISUAL ONLY; NO INGAME EFFECT
"Torchlight.exe"+174201:
fld dword ptr [eax+7C]
fild dword ptr [esp+24]
//Alt: db D9 40 7C DB 44 24 24

"Torchlight.exe"+1741EE:
fld dword ptr [eax+00000098]
//Alt: db D9 80 98 00 00 00