.text
.globl main

main:


    li x22, 5
    li x23, 6
    li x20, 4 #x

    li t0, 1
    beq x20, t0, C1
    li t0, 2
    beq x20, t0, C2
    li t0, 3
    beq x20, t0, C3
    li t0, 4
    beq x20, t0, C4
    beq x0, x0, Exit
    

    C1:
        add x21, x22, x23
        beq x0, x0, Exit

    C2:
        sub x21, x22, x23
        beq x0, x0, Exit

    C3:
        slli x21, x22, 1
        beq x0, x0, Exit
    C4:
        srai x21, x22, 1
        beq x0, x0, Exit

    default:
        li x21, 0
        beq x0, x0, Exit
    
    Exit:

end:
j end 