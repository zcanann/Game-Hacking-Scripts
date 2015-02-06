[Enable]
//////////
//X VAC3// LEFT
//////////

stealthedit(xVac3, "Client.exe"+1F3229, 6)
registersymbol(xHolder3)
label(xHolder3)
alloc(newmem2,256)

newmem2:
fld qword ptr [Client.exe+B4A2B4] //load static 0
fstp qword ptr [eax+10]

jmp xHolder3+6

xVac3:
xHolder3:
jmp newmem2
nop

//////////
//X VAC2// RIGHT
//////////
stealthedit(xVac2, "Client.exe"+1F3082, 6)
registersymbol(xHolder2)
label(xHolder2)
alloc(newmem,256)

newmem:
fld qword ptr [Client.exe+B4A2B4] //load static 0
fstp qword ptr [ecx+10]
jmp xHolder2+6

xVac2:
xHolder2:
jmp newmem
nop

//////////
//X VAC/// BASE
//////////
stealthedit(xVac, "Client.exe"+1F3079, 6)
registersymbol(xHolder1)
label(xHolder1)

xVac:
xHolder1:
db 90 90 90 90 90 90

[Disable]
//XVAC3
dealloc(newmem2)
xHolder3:
fld qword ptr [ebp-20]
fstp qword ptr [eax+10]
//Alt: db DD 45 E0 DD 58 10
//XVAC2
dealloc(newmem)
xHolder2:
fld qword ptr [ebp-20]
fstp qword ptr [ecx+10]
//Alt: db DD 45 E0 DD 59 10
//XVAC1
xHolder1:
jne Client.exe+1F31EB

unregistersymbol(xHolder3)
unregistersymbol(xHolder2)
unregistersymbol(xHolder1)