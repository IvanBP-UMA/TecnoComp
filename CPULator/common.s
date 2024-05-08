.data
cadena: .asciz "aa bbb cccc aaaa"
res: .ascii ""

.text
	push {lr}
	ldr r0, =cadena // en r0 (parametro1) cargamos direccion de la cadena
	bl common // llamamos a la funcion
	ldr r1, =res
	strb r0, [r1] // almacenamos en res el valor devuelto por la funcion(r0) (un byte strB)
	pop {lr}
	bx lr

common:	
	push {lr}
	push {r4}
	
	ldrb r1, [r0]
	push {r0}
	push {r1}
	bl chcount
	mov r3, r0
	pop {r1}
	mov r4, r1
	pop {r0}
	
	ldrb r1, [r0, #1]!
	
	loop: 
		cmp r1, #0
		beq exitCommon
		push {r0}
		push {r1}
		push {r3}
		
		bl chcount
		mov r2, r0
		pop {r3}
		cmp r2, r3
		movgt r3, r2
		pop {r1}
		movgt r4, r1
		pop {r0}
		
		ldrb r1, [r0, #1]!
		b loop
		
	exitCommon:
		mov r0, r4
		pop {r4}
		pop {lr}
		bx lr

chcount: 
	ldrb r2, [r0], #1
	mov r3, #0
	for: 
		cmp r2, #0
		beq exitChcount
		cmp r2, r1
		addeq r3, #1
		ldrb r2, [r0], #1
		b for
		
	exitChcount:
		mov r0, r3
		mov pc, lr
 	