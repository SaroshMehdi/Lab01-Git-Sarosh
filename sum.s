.text
.globl main
main:
    li x20, 5 # a
    li x21, 0 # b
    li x5, 32 # temp var
    add x20, x21, x5 # a = b + 32
    add x22, x20, x21 # d = a + b
    addi x22, x22, -5 # d = a + b - 5
    sub x6, x20, x22 # a - d
    sub x7, x21, x20 # b - a
    add x8, x6, x7 # (a-d) + (b-a)
    add x23, x8, x22 # e = ((a-d) + (b-a)) + d
    add x9, x20, x21 # a + b
    add x9, x9, x22 # a + b + d
    add x23, x23, x9 # e = a + b + d + e
end:
    j end
