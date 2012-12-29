@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@											  @@@
@@ berechnung der wundersamen Zahlen (ARM)  @@@@@
@@ http://de.wikipedia.org/wiki/Collatz-Problem @
@@	argument: eine positive natuerliche zahl    @
@@	return: anzahl der durchläufe              @@
@@											   @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	.section .text
	.global hailstone

hailstone:	
		str r4,[r13,#-4]! @Arbeitsregister retten
		str r5,[r13,#-4]!
		str r6,[r13,#-4]!
		str r7,[r13,#-4]!
		str r8,[r13,#-4]!
		str r9,[r13,#-4]!
		str r10,[r13,#-4]!
 		str lr,[r13,#-4]! @ Linkregister retten

        mov  r1, #0         @ anzahl der durchgaenge
again:  add  r1, r1, #1     @ inkrementieren
        ands r7, r0, #1     @ ueberpruefen ob r0 ungerade ist
        beq  even		
        add  r0, r0, r0, lsl #1 @  r0 = r0 + (R0 * 2) [r0*3] 
        add  r0, r0, #1     @ r0 = r0 + 1
        b    again
even:   mov  r0, r0, asr #1 @ r0 = r0 / 2
        subs r7, r0, #1     @ abbruch bei r0 = 1
        bne  again		
		mov r0, r1 @ anzahl an durchgaengen zurückgeben

		ldr lr,[r13],#4 @Linkregister restaurieren
		ldr r10,[r13],#4 @Arbeitsregister restaurieren
		ldr r9,[r13],#4 
		ldr r8,[r13],#4 
		ldr r7,[r13],#4 
		ldr r6,[r13],#4 
		ldr r5,[r13],#4 
		ldr r4,[r13],#4 

		bx lr @ Zurueck ins Hauptprogramm
	