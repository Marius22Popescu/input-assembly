.data
prompt1:
	.asciz "Enter a number:"
prompt2:
	.asciz "%d times 3 is %d.\n"
format:
	.asciz "%d"
number:
	.word 0
return:
	.word 0
return2:
	.word 0

.text
multiplyBy3:
	ldr r1, address_of_return2
	str lr, [r1]
	add r0, r0, r0, LSL #1
	ldr r1, address_of_return2
	ldr lr, [r1]
	bx lr
address_of_return2:.word return2
.global main
main:
	ldr r1, address_of_return
	str lr, [r1]

	ldr r0, address_of_p1
	bl printf

	ldr r0, address_of_format
	ldr r1, address_of_number
	bl scanf

	ldr r0, address_of_number
	ldr r0, [r0]
	bl multiplyBy3
	mov r2, r0

	ldr r0, address_of_p2
	ldr r1, address_of_number
	ldr r1, [r1]
	bl printf

	ldr r1, address_of_return
	ldr lr, [r1]
	bx lr
address_of_p1:.word prompt1
address_of_p2:.word prompt2
address_of_format:.word format
address_of_number:.word number
address_of_return:.word return
.global printf
.global scanf

