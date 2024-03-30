.data
leds1: .word 0x155
leds2: .word 0x2aa

.text
main:
  push {lr}
  ldr r1, =leds1
  ldr r0, [r1]
  bl setLEDsStatus

loop:
  mov r0, #3
  bl isButtonPressed
  cmp r0, #1
  bne loop

  ldr r1, =leds2
  ldr r0, [r1]
  bl setLEDsStatus

  pop {lr}
  bx lr
	
	