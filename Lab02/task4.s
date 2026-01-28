.text
.globl main

main:
    li x5, 2           # a = 3
    li x6, 3           # b = 3
    li x7, 0           # i = 0
    li x10, 0x100      # base address of arr D is at 0x100
    li x29, 0          # j = 0
outloop:
    bge x7, x5, Exit       # if i >= a, exit
    li x29, 0              # j = 0
inloop:
    bge x29, x6, increase_i    # if j >= b, increase i and reset j
    slli x28, x29, 2           # x28 = j * 4
    slli x27, x28, 2           # x27 = (j * 4) * 4 = j * 16 
    add x26, x10, x27          # x26 = address of D[4*j]
    add x25, x7, x29           # x25 = i + j
    sw x25, 0(x26)             # D[4*j] = i + j
    addi x29, x29, 1           # j++
    beq x0, x0, inloop         # jump back to inner loop
increase_i:
    addi x7, x7, 1             # i++
    beq x0, x0, outloop        # jump back to outer loop
Exit:

end:
    j end