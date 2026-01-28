.text
.globl main

main:

    li x19, 5          # i = 5
    li x20, 6          # j = 6
    li x21, 7
    li x22, 8
    li x23, 9

        
    bne x22, x23, Else
    add x19, x20, x21
    beq x0,x0 , Exit

    Else: sub x19, x20, x21
    Exit:

end:
j end