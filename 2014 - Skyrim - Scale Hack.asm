/*
 * Causes the player to look deformed by assigning large disproportional scales
 * to various body parts by overwriting the instructions that assign them values
 * Also makes the player's weapons huge.
*/

[Enable]

alloc(HackCode,512)
label(Return)
label(ScaleHack)

//Weapon labels
label(RDaggerInvalid)
label(RSwordInvalid)
label(RMaceInvalid)
label(RAxeInvalid)
label(2HSwordInvalid)
label(LeftWeaponInvalid)
label(ShieldInvalid)

//Body labels
label(ChestInvalid)
label(RightArmInvalid)
label(LeftArmInvalid)
label(WaistInvalid)

HackCode:
// LEFT WEAPON
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je LeftWeaponInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je LeftWeaponInvalid
add ebx, 138
mov ebx, [ebx]
or ebx, ebx
je LeftWeaponInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je LeftWeaponInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je LeftWeaponInvalid
add ebx, 84-30

// Test if the scale is the weapon scale
cmp ebx, edx
mov ebx, 40A00000 // scale of 5
je ScaleHack

LeftWeaponInvalid:
pop ebx

// SHIELD
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je ShieldInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je ShieldInvalid
add ebx, 138
mov ebx, [ebx]
or ebx, ebx
je ShieldInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je ShieldInvalid
add ebx, 0
mov ebx, [ebx]
or ebx, ebx
je ShieldInvalid
add ebx, 84-30

// Test if the scale is the weapon scale
cmp ebx, edx
mov ebx, 40000000 // scale of 2 //40400000 //3 //
je ScaleHack

ShieldInvalid:
pop ebx

// RIGHT DAGGER
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je RDaggerInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je RDaggerInvalid
add ebx, 458
mov ebx, [ebx]
or ebx, ebx
je RDaggerInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je RDaggerInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je RDaggerInvalid
add ebx, 84-30

// Test if the scale is the dagger scale
cmp ebx, edx
mov ebx, 40A00000 // scale of 5
je ScaleHack

RDaggerInvalid:
pop ebx

// RIGHT SWORD
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je RSwordInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je RSwordInvalid
add ebx, 438
mov ebx, [ebx]
or ebx, ebx
je RSwordInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je RSwordInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je RSwordInvalid
add ebx, 84-30

// Test if the scale is the sword scale
cmp ebx, edx
mov ebx, 40800000 // scale of 4
je ScaleHack

RSwordInvalid:
pop ebx

// RIGHT MACE
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je RMaceInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je RMaceInvalid
add ebx, 498
mov ebx, [ebx]
or ebx, ebx
je RMaceInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je RMaceInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je RMaceInvalid
add ebx, 84-30

// Test if the scale is the mace scale
cmp ebx, edx
mov ebx, 40800000 // scale of 4
je ScaleHack

RMaceInvalid:
pop ebx

// RIGHT AXE
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je RAxeInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je RAxeInvalid
add ebx, 478
mov ebx, [ebx]
or ebx, ebx
je RAxeInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je RAxeInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je RAxeInvalid
add ebx, 84-30

// Test if the scale is the axe scale
cmp ebx, edx
mov ebx, 40800000 // scale of 4
je ScaleHack

RAxeInvalid:
pop ebx

// 2H WEAPON
push ebx
mov ebx, ["TESV.exe"+010BC734]
or ebx, ebx
je 2HSwordInvalid
add ebx, 188
mov ebx, [ebx]
or ebx, ebx
je 2HSwordInvalid
add ebx, 4b8
mov ebx, [ebx]
or ebx, ebx
je 2HSwordInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je 2HSwordInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je 2HSwordInvalid
add ebx, 84-30

// Test if the scale is the 2h sword scale
cmp ebx, edx
mov ebx, 40000000 // Scale of 2
je ScaleHack

2HSwordInvalid:
pop ebx

// CHEST SCALE
push ebx
mov ebx, ["TESV.exe"+0115AEB4]
or ebx, ebx
je ChestInvalid
add ebx, 224
mov ebx, [ebx]
or ebx, ebx
je ChestInvalid
add ebx, f0
mov ebx, [ebx]
or ebx, ebx
je ChestInvalid
add ebx, 198
mov ebx, [ebx]
or ebx, ebx
je ChestInvalid
add ebx, 18
mov ebx, [ebx]
or ebx, ebx
je ChestInvalid
add ebx, 84-30

// Test if the scale is the chest scale
cmp ebx, edx
mov ebx, 3FA00000 // Scale of 1.25
je ScaleHack

ChestInvalid:
pop ebx

// RIGHT ARM SCALE
push ebx
mov ebx, ["TESV.exe"+0115AEB4]
or ebx, ebx
je RightArmInvalid
add ebx, 224
mov ebx, [ebx]
or ebx, ebx
je RightArmInvalid
add ebx, f0
mov ebx, [ebx]
or ebx, ebx
je RightArmInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je RightArmInvalid
add ebx, 4
mov ebx, [ebx]
or ebx, ebx
je RightArmInvalid
add ebx, 84-30

// Test if the scale is the arm scale
cmp ebx, edx
mov ebx, 40000000 // Scale of 2
je ScaleHack

RightArmInvalid:
pop ebx

// LEFT ARM SCALE
push ebx
mov ebx, ["TESV.exe"+0115AEB4]
or ebx, ebx
je LeftArmInvalid
add ebx, 224
mov ebx, [ebx]
or ebx, ebx
je LeftArmInvalid
add ebx, f0
mov ebx, [ebx]
or ebx, ebx
je LeftArmInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je LeftArmInvalid
add ebx, 8
mov ebx, [ebx]
or ebx, ebx
je LeftArmInvalid
add ebx, 84-30

// Test if the scale is the arm scale
cmp ebx, edx
mov ebx, 3F800000 // 1 //3F400000 // Scale of 0.75
je ScaleHack

LeftArmInvalid:
pop ebx

// WAIST SCALE
push ebx
mov ebx, ["TESV.exe"+0115AEB4]
or ebx, ebx
je WaistInvalid
add ebx, 224
mov ebx, [ebx]
or ebx, ebx
je WaistInvalid
add ebx, d0
mov ebx, [ebx]
or ebx, ebx
je WaistInvalid
add ebx, ac
mov ebx, [ebx]
or ebx, ebx
je WaistInvalid
add ebx, 0
mov ebx, [ebx]
or ebx, ebx
je WaistInvalid
add ebx, 84-30

// Test if the scale is the waist scale
cmp ebx, edx
mov ebx, 3F400000 // Scale of 0.75 3F800000 //1 //
je ScaleHack

WaistInvalid:
pop ebx

// All invalid, must not be something
// We want to change the scale of.
fstp dword ptr [edx+30]
pop edi
pop esi
jmp Return

ScaleHack:
// Apply the normal code (since it affects register)
fstp dword ptr [edx+30]
// Overwrite the value with our scale
mov [edx+30], ebx
// Cleanup our register
pop ebx
// Unrelated code
pop edi
pop esi
jmp Return

"TESV.exe"+8322CA:
jmp HackCode
Return:


[Disable]
dealloc(newmem)
"TESV.exe"+8322CA:
fstp dword ptr [edx+30]
pop edi
pop esi
//Alt: db D9 5A 30 5F 5E