@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@											       @@
@@  berechnung der quersumme      (ARM ASM)        @@
@@	int quersumme(int a)				    	   @@
@@	argument: (int) eine positive natuerliche zahl @@
@@	return: (int) quersumme				           @@
@@							    				   @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


.section .text
.global quersumme

quersumme:	
		
		str r4,[r13,#-4]! @Arbeitsregister retten
		str r5,[r13,#-4]!
		str r6,[r13,#-4]!
		str r7,[r13,#-4]!
		str r8,[r13,#-4]!
		str r9,[r13,#-4]!
		str r10,[r13,#-4]!
 		str lr,[r13,#-4]! @ Linkregister retten
		
		mov r10, r0						@ r10 = arg
		mov r7, #0						@ r7 =  quersumme
		mov r8, #0x19000000				@ r8 = 2^32 / 10
        orr r8, r8, #0x00990000
        orr r8, r8, #0x00009900
        orr r8, r8, #0x00000099
        mov r3, #10						@ r3 = 10        
		  
loop:   umull r4, r5, r10, r8			@ r5 = r10 / 10 
        umull r4, r6, r5, r3			@ r4 = 10 * r5
        sub r4, r10, r4					@ r4 = r10 - r4
        add r7, r7, r4					@ r7 = r7 + r4
        movs r10, r5					@ r10 = r5
        bne loop						@ wenn nicht 0 dann wiederhohlen
		mov r0, r7 						@ quersumme zurückgeben
		
		
		
		ldr lr,[r13],#4 @Linkregister restaurieren
		ldr r10,[r13],#4 @Arbeitsregister restaurieren
		ldr r9,[r13],#4 
		ldr r8,[r13],#4 
		ldr r7,[r13],#4 
		ldr r6,[r13],#4 
		ldr r5,[r13],#4 
		bx lr;
			
		ldr r4,[r13],#4
