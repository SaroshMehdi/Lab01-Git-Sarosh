.text
.globl main
main:
    li x10, 0x200       
    li x22, 0           
    li t0, 10           
loop1:
    bge x22, t0, end_loop1
    slli t1, x22, 2     
    add t2, x10, t1     
    sw x22, 0(t2)       
    addi x22, x22, 1    
    beq x0, x0, loop1
end_loop1:
    li x22, 0           
    li x23, 0          
loop2:
    bge x22, t0, Exit
    slli t1, x22, 2     
    add t2, x10, t1     
    lw t3, 0(t2)        
    add x23, x23, t3    
    addi x22, x22, 1    
    beq x0, x0, loop2

Exit:

end:
    j end