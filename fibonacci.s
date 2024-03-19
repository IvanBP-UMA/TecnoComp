.data
 	minumr:     .word 1
	res:        .word 0

.text
.global main
main: ldr r1, =minumr                      
     ldr r0, [r1]          
     ldr r4, =res
     push {lr}
     bl fib
     pop {lr}
     str r0, [r4]          
     bx lr                  
            
fib: mov r1, #0
	mov r2, #1
	sub r0, #2
	mov r3, #0
while: cmp r0, #0
	ble exit
	add r3, r1, r2
	mov r1, r2
	mov r2, r3
	sub r0, #1
	b while

exit:
	movlt r3, #1
	mov r0, r3
	mov pc, lr
	