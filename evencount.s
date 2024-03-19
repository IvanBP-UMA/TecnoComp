 .data
 tam:        .word 8
 vect:       .word 64,25,9,23,56,77,87,100
 res:        .word 0

 .text
 .global main
 main:       push {lr}
             ldr r0, =vect          @ Cargamos direccion del vector en r0
             ldr r1, =tam          
             ldr r1, [r1]           @ Cargamos longitud del vector en r1
             ldr r4, =res           @ Cargamos la direccion de res en r4
             bl evencount           @ Invocamos funcion
             str r0, [r4]           @ Guardamos el resultado en res
               pop {lr}
             bx lr                  @ Finalizamos el programa
            
 iseven:     @Codigo de la funcion que indica si un numero es par o no.
             @(Hay que llamarla desde evencount y no se puede modificar)
             mov r1, r0
             mov r2, #1
             and r3, r2, r1
             eor r0, r3, #1
             bx lr
  
 evencount: 
 	push {lr}
 	mov r2, r1
	mov r1, r0
	mov r3, #0
	
	for: cmp r2, #0
		beq exit
		ldr r0, [r1], #4
		push {r1-r3}
		bl iseven
		pop {r1-r3}
		cmp r0, #1
		addeq r3, #1
		sub r2, #1
		b for
	
	exit: mov r0, r3
		pop {lr}
		bx lr
 	