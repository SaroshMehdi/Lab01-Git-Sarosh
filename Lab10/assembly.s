.text
.globl _start
_start:
li sp, 0x800
li t0, 0x100 # LED base address
sw zero, 0(t0) # LEDs = 0 (reset/init)
IDLE:
li t0, 0x100
sw zero, 0(t0) # LEDs = 0 (enforce IDLE output)
IDLE_LOOP:
li t1, 0x200 # Switch base address
lw a0, 0(t1) # Read switches
beq a0, zero, IDLE_LOOP # switch == 0 → stay in IDLE
# switch != 0 → capture value, display LEDs, go to COUNTDOWN
li t0, 0x100
sw a0, 0(t0) # Display captured value on LEDs immediately
jal ra, COUNTDOWN # Enter COUNTDOWN state
j IDLE # counter == 0 returned → back to IDLE (reset arc)
COUNTDOWN:
addi sp, sp, -16 # Allocate stack frame
sw ra, 12(sp) # Save return address
sw s0, 8(sp) # Save s0
mv s0, a0 # s0 = captured switch value (initial counter)
CD_LOOP:
li t0, 0x100
sw s0, 0(t0) # LEDs = counter_value (enable=1, displaying count)
jal ra, DELAY # Wait
addi s0, s0, -1 # counter = counter - 1
bnez s0, CD_LOOP # counter > 0 → stay in COUNTDOWN
# counter == 0 → transition back to IDLE
li t0, 0x100
sw zero, 0(t0) # LEDs = 0 (reset output on exit)
lw s0, 8(sp) # Restore s0
lw ra, 12(sp) # Restore return address
addi sp, sp, 16 # Deallocate stack frame
ret # Return to IDLE (counter == 0 arc)
DELAY:
li t0, 3333333 # Iteration count
DELAY_LOOP:
addi t0, t0, -1
bnez t0, DELAY_LOOP
ret