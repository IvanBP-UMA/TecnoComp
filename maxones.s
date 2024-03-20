.data
tam: .word 8
vect: .word 64,25,9,23,56,77,87,100
res: .word 0

.text
.global main
main:    push {lr}
         ldr r0, =vect          @ Cargamos direccion del vector en r0
         ldr r1, =tam          
         ldr r1, [r1]           @ Cargamos longitud del vector en r1
         ldr r4, =res           @ Cargamos la direccion de res en r4
         bl maxones             @ Invocamos funcion
         str r0, [r4]           @ Guardamos el resultado en res
         pop {pc}               @ Finalizamos el programa
        
ones:    @Codigo de la funcion que devuelve el numero de 1s en la
         @representación binaria de un valor de entrada.
         @(Hay que llamarla desde maxones y no se puede modificar)
               mov r2, #0
         onesloop:
               and r3, r0, #1
               add r2, r2, r3
               lsrs r0, #1
               bne onesloop
               mov r0, r2
               bx lr
 
maxones:
	push {lr}
	push {r4}
	ldr r2, [r0], #4
	mov r4, r2
	push {r0-r1}
	mov r0, r2
	bl ones
	mov r3, r0
	pop {r0-r1}
	sub r1, #1
	
	loop:
		cmp r1, #0
		beq exitMaxones
		ldr r2, [r0], #4
		push {r0-r1}
		push {r2}
		push {r3}
		mov r0, r2
		bl ones
		pop {r3}
		pop {r2}
		cmp r0, r3
		movgt r3, r0
		movgt r4, r2
		pop {r0-r1}
		sub r1, #1
		b loop
		
	exitMaxones:
		mov r0, r4
		pop {r4}
		pop {lr}
		bx lr
		
	
	