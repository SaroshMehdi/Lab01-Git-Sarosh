.text
.globl main

main:
li x11, 5
li x20, 0 #0
li x12, 1 #output

blt x11, x20, negative # if n<0 then error
li x13, 1 # i = 1

fact:
bgt x13, x11, done # if i>n then exit loop
mul x12, x12, x13 # result*=i
addi x13, x13, 1 #i++
j fact

done:
mv x10, x12 # move result to return register
j exit

negative:
li x10, -1 # return -1

exit: