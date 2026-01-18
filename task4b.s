.text
.globl main
main:
    # Load base addresses
    li x5, 0x100        # x5 = address of a
    li x6, 0x200        # x6 = address of b
    li x7, 0x300        # x7 = address of c
    
    li x28, 5
    sb x28, 0(x5)       # a[0] = 5
    sb x28, 1(x5)       # a[1] = 5
    sb x28, 2(x5)       # a[2] = 5
    sb x28, 3(x5)       # a[3] = 5
    
    li x29, 6
    sh x29, 0(x6)       # b[0] = 6
    sh x29, 2(x6)       # b[1] = 6
    sh x29, 4(x6)       # b[2] = 6
    sh x29, 6(x6)       # b[3] = 6

    
    lb x28, 0(x5)       # Load a[0]
    lh x29, 0(x6)       # Load b[0] 
    add x30, x28, x29   # x30 = a[0] + b[0]
    sw x30, 0(x7)       # Store to c[0] 
    
    lb x28, 1(x5)       # Load a[1]
    lh x29, 2(x6)       # Load b[1]
    add x30, x28, x29   # x30 = a[1] + b[1]
    sw x30, 4(x7)       # Store to c[1]
    
    lb x28, 2(x5)       # Load a[2]
    lh x29, 4(x6)       # Load b[2]
    add x30, x28, x29   # x30 = a[2] + b[2]
    sw x30, 8(x7)       # Store to c[2]
    
    lb x28, 3(x5)       # Load a[3]
    lh x29, 6(x6)       # Load b[3]
    add x30, x28, x29   # x30 = a[3] + b[3]
    sw x30, 12(x7)      # Store to c[3]

end:
    j end