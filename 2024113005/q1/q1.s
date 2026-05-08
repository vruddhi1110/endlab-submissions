.data 
input_fmt:  .string "%lld"
true_msg:   .string "TRUE\n"
false_msg:  .string "FALSE\n"

.text
.globl main 

main:
addi sp , sp , -80
sd ra , 0(sp)

# input n
la a0 , input_fmt
addi a1 , sp , 8
call scanf

ld s0 , 8(sp) #s0 = n 

li t0 , 0 #i = 0
addi s1 , sp , 16 #array base address

input_array:
beq t0 , s0 , initialization

la a0 , input_fmt
slli t1 , t0 , 3
add a1 , s1 , t1
call scanf
addi t0 , t0 , 1
j input_array

initialization:
li t0 , 0 #i = 0
li t6 , 2

logic:
addi t1 , s0 , -1
beq t0 , t1 , yes

slli t2 , t0 , 3
add t3 , s1 , t2
ld t4 , 0(t3) #arr[i]

addi t2 , t2 , 8
add t3 , s1 , t2
ld t5 , 0(t3) #arr[i+1]

rem t2 , t4 , t6 #parity of arr[i]
rem t3 , t5 , t6 #parity of arr[i+1]

beq t2 , t3 , no

addi t0 , t0 , 1
j logic

no:
la a0 , false_msg
call printf
j exit

yes:
la a0 , true_msg
call printf

exit:
ld ra , 0(sp)
addi sp , sp , 80
li a0 , 0
ret