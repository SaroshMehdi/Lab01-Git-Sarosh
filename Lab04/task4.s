.text 
.globl main 
 
main: 
    addi    sp, sp, -800        #Create stack 
    addi    x10, x0, 6  
    jal     x1, fibonacci_series       
    beq     x0, x0, exit         
 
fibonacci_series: 
    addi    x5, x0, 0           #F(0) 
    addi    x6, x0, 1           #F(1) 
    addi    x7, x0, 0           #i = 0 
    addi    x11, sp, 0          #x11 is the stack pointer for storing 
    #Store first term F(0) = 0 
    sw      x5, 0(x11)          # Store 0 
    addi    x11, x11, 4         # Move to next position 
    addi    x7, x7, 1           # counter++ 
    #Check if n == 1 (only want F(0)) 
    addi    x12, x0, 1 
    beq     x10, x12, done 
    #Store second term F(1) = 1 
    sw      x6, 0(x11)          # Store 1 
    addi    x11, x11, 4         # Move to next position 
    addi    x7, x7, 1           
    
loop: 
    beq     x7, x10, done       
    #Calculate next Fibonacci: 
    add     x8, x5, x6          # x8 = fib_prev + fib_curr 
    #Store on stack 
    sw      x8, 0(x11)           
    addi    x11, x11, 4         # Move to next position 
    #Update for next iteration 
    addi    x5, x6, 0           # fib_prev = fib_curr 
    addi    x6, x8, 0           # fib_curr = fib_next
    addi    x7, x7, 1           
    j loop

done:
    addi x10, x8, 0  # returns the nth fib number
    jalr x0, 0(x1)

exit:

