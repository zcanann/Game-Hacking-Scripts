[Enable]
alloc(newmem,2048)
label(returnhere)
label(exit)
alloc(glubgarY, 4)
alloc(hackInitiated, 4)
alloc(gemIndex, 4)
alloc(gem1, 4)
alloc(gem2, 4)
alloc(gem3, 4)
label(glubgar)
label(cont)
label(gemRet)
label(_gem1)
label(_gem2)
label(_gem3)
label(gemCompare)
label(cont2)
label(checkForNull)

newmem:
//Unrelated code
cmp [ecx+3C],ebx
je "Flash11e.ocx"+130F55

//Load address in eax
push eax
mov eax, ecx
add eax, 3C

cmp [hackInitiated], 1
je cont2
//Find glubgar (this only runs once)
cmp [eax], 00000FA0
je glubgar

cont2:
//Now check for gems
//Gem index 1
cmp [gemIndex], 0000001
je _gem1
cmp [gemIndex], 0000002
je _gem2
cmp [gemIndex], 0000003
je _gem3

gemRet:
mov [ecx+3C], ebx
cmp [hackInitiated], 1
je cont

exit:
jmp returnhere

_gem1:
inc [gemIndex] //2
mov [gem1], eax //save address
jmp checkForNull

_gem2:
inc [gemIndex] //3
mov [gem2], eax //save address
jmp checkForNull

_gem3:
mov [gemIndex], 1
mov [gem3], eax //save address
jmp checkForNull

checkForNull:
cmp [gem1], 00000000
je gemRet
cmp [gem2], 00000000
je gemRet
cmp [gem3], 00000000
je gemRet
//No nulls, safe to compare
jmp gemCompare

gemCompare:
//Test 1 & 2 equality
push ebx
mov eax, [gem1]//Get address
mov eax, [eax] //Get value
mov ebx, [gem2]//Get address
mov ebx, [ebx] //Get value
cmp eax, ebx //Compare values
pop ebx
jne gemRet
//Test 2 & 3 equality
push ebx
mov eax, [gem2] //Get address
mov eax, [eax]
mov ebx, [gem3]
mov ebx, [ebx]
cmp eax, ebx //Compare values
jne gemRet
pop ebx
//Test 1 & 3 equality
push ebx
mov eax, [gem1]
mov eax, [eax]
mov ebx, [gem3]
mov ebx, [ebx]
cmp eax, ebx //Compare values
jne gemRet
pop ebx
//3 objects MUST be gems; set their values
mov [ecx+3C], ebx
mov eax, [gem1]
mov [eax], 00002EE0 //12000
mov eax, [gem2]
mov [eax], 00002EE0 //12000
mov eax, [gem3]
mov [eax], 00002EE0 //12000
pop eax
jmp exit

cont:
mov eax, ecx
add eax, 3C
mov eax, [glubgarY]
mov [eax], 00002EE0 //12000
pop eax
jmp exit

glubgar:
mov [hackInitiated], 00000001
mov [gemIndex], 00000001
mov [glubgarY], eax //Load glubgar Y address
mov eax, [glubgarY]
mov [eax], 00002EE0 //12000
pop eax
jmp exit

"Flash11e.ocx"+130F3B:
jmp newmem
nop
nop
nop
returnhere:

[Disable]
dealloc(newmem)
dealloc(glubgarY)
dealloc(hackInitiated)
dealloc(gemIndex)
dealloc(gem1)
dealloc(gem2)
dealloc(gem3)

"Flash11e.ocx"+130F3B:
cmp [ecx+3C],ebx
je "Flash11e.ocx"+130F55
mov [ecx+3C], ebx
//Alt: db 39 59 3C 74 15