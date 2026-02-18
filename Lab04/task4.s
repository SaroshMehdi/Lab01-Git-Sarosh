.text 
.globl main 
 
main: 
    addi    sp, sp, -800        # Create stack space for ~200 integers
    addi    x10, x0, 10         # n = 6 (generate first 6 Fibonacci numbers) 
    jal     ra, fibonacci_series # Use ra (x1) conventionally      
    addi    sp, sp, 800         
    beq     x0, x0, exit         
 
fibonacci_series: 
    addi    x5, x0, 0           # x5 = F(0) = 0 
    addi    x6, x0, 1           # x6 = F(1) = 1 
    addi    x7, x0, 0           # x7 = counter (i = 0) 
    addi    x11, sp, 0          # x11 = pointer to start of stack for storage 
    
    # Store first term F(0) 
    sw      x5, 0(x11)          # Store 0 on stack
    addi    x11, x11, 4         # Move pointer to next word
    addi    x7, x7, 1           # counter++ 
    
    # Check if n == 1 (if user only wanted one number)
    addi    x12, x0, 1 
    beq     x10, x12, done 
    
    # Store second term F(1) 
    sw      x6, 0(x11)          # Store 1 on stack
    addi    x11, x11, 4         # Move pointer
    addi    x7, x7, 1           # counter++
    
loop: 
    beq     x7, x10, done       # If counter == n, we are finished
    
    # Calculate next Fibonacci number:
    add     x8, x5, x6          # x8 (next) = x5 (prev) + x6 (curr) 

    # Store result on stack 
    sw      x8, 0(x11)           
    addi    x11, x11, 4         # Move pointer to next position 
    
    # Update registers for next iteration 
    addi    x5, x6, 0           # prev = curr 
    addi    x6, x8, 0           # curr = next 
    
    addi    x7, x7, 1           # counter++
    j       loop                # Repeat

done: 
    addi    x10, x7, 0          # Return number of terms generated in x10
    ret                         

exit: 
    addi    a7, x0, 10          # Environment call for exit
    ecall