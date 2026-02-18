.text 
.globl main 
main: 
    li x1, 1 
    sw x1, 0(x3)          # a[0] = 1 
    li x1, 3 
    sw x1, 4(x3)          # a[1] = 3 
    li x1, 2 
    sw x1, 8(x3)          # a[2] = 2 
    li x1, 4 
    sw x1, 12(x3)         # a[3] = 4 
    add x10, x3, x0       # x10 = a (base address) 
    li  x11, 4            # len = 4 
    jal ra, bubble 
    j done 
bubble: 
    beq x10, x0, done       # if (a == NULL) return 
    beq x11, x0, done       # if (len == 0) return 
    addi x5, x0, 0          # i = 0 
outer_loop: 
    bge x5, x11, done       # if i >= len, exit outer loop 
    add x6, x5, x0          # j = i 
inner_loop: 
    bge x6, x11, next_i     # if j >= len, go to next i
    slli x7, x5, 2        
    add  x7, x10, x7        # &a[i] 
    slli x8, x6, 2          
    add  x8, x10, x8        # &a[j] 
    lw x9, 0(x7)            # x9 = a[i] 
    lw x12, 0(x8)           # x12 = a[j] 
    bge x9, x12, no_swap    # if a[i] >= a[j], skip swap 
    sw x12, 0(x7)           # a[i] = a[j] 
    sw x9, 0(x8)            # a[j] = old a[i] 
no_swap: 
    addi x6, x6, 1          # j++ 
    beq x0, x0, inner_loop 
next_i: 
    addi x5, x5, 1          # i++ 
    beq x0, x0, outer_loop 
done: 
    ret