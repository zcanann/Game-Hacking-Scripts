[Enable]
/*
Speed carrying object: 1.25
Speed not carrying object: 2
Speed not carrying object with this hack: {user defined}

Two instructions constantly write to the speed of the player.
The 2nd instruction that constantly writes to speed while not carrying
the chalice or any item. Since is the last instruction to execute, it is
responsible for the observed game behavior.

Note that if the player is carrying something, this hack will not be in effect.
*/

alloc(newmem, 64)
label(returnhere)

globalalloc(speed, 4)

registersymbol(updateSpeed)

// Search for the static instruction bytes that indicate where the speed is applied
// These were found through memory scanning and debugging.
aobscan(updateSpeed, 89 84 13 A0010000 66 0F29 75 60 8B 7D 84 44 8B 6C 3B 24 41 0FCD)

newmem:
mov eax, [speed] // read in value from user defined speed address
mov [rbx+rdx+000001A0], eax
jmp returnhere

updateSpeed:
jmp newmem
db 90 90
returnhere:

[Disable]
dealloc(newmem)
unregistersymbol(updateSpeed)
updateSpeed:
mov [rbx+rdx+000001A0],eax

