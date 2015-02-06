[Enable]
/*
AOB scan for code that writes to Z position of chalice.
This happens after X and Y, thus if we write to X and Y position
here then our code will have 'priority' over the real code.
Obviously we can write to the Z position too.
*/

alloc(newmem, 256)
globalalloc(chaliceoffset, 4)
label(exit)
label(returnhere)
label(vachack)

registersymbol(setchaliceposition)
aobscan(setchaliceposition, 0FC8 89 44 0B 00 E9 5A000000 C7 45 00 00000000 41 50 41 51 41 52 41 53)

newmem:
bswap eax // Original code

// Compare to the rcx register to determine if chalice
// (chaliceZ address = 0x7FFF0000 + 00 + this value)
cmp ecx, 802BCEA4
je vachack

// Not updating the chalice position, return to regular code
jmp exit

vachack:
// Apply X hack
push rax
mov rax, [1002B7E24-08]
mov [rbx+rcx-08],rax // Offset is just -08 from standard
pop rax

// Apply Y hack

push rax

// All of this is to add offset from the value being moved into eax.
mov eax, [1002B7E24-04]    // Read in the bigE Z value
bswap eax                  // Convert to littleE
mov [rbx+rcx+00], eax      // Store this value temporarily
fld [rbx+rcx+00]           // Push value onto float stack
push edx
mov edx, [chaliceoffset]   // Load offset into edx
mov [rbx+rcx+00], edx      // Store offset temporarily
pop edx
fadd [rbx+rcx+00]          // Add the offset to the value on stack
fstp [rbx+rcx+00]          // pop value on stack + off back into dest addr
mov eax, [rbx+rcx+00]      // Load the value back into eax
bswap eax                  // restore to bigE notation

// This is all that was needed if not doing the add offset thing
//mov rax, [1002B7E24-04]

mov [rbx+rcx-04],rax // Offset is just -04 from standard
pop rax

// Set eax with Z value
mov eax, [1002B7E24]

exit:
mov [rbx+rcx+00],eax
jmp returnhere

setchaliceposition:
jmp newmem
db 90
returnhere:

[Disable]
dealloc(newmem)
unregistersymbol(setchaliceposition)
setchaliceposition:
// db notation is required since the 00 will be ignored by CE
// and thus generate a 3 byte sequence instead of a 4 byte sequence
//mov [rbx+rcx+00],eax
bswap eax //db 0FC8
db 89 44 0b 00
