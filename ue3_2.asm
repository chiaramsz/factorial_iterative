# Ü 3.2 Chiara Szolderits, Schönfelder Sebastian

#Implementieren Sie die Funktion f(n) = n! (Fakultät1 einer ganzen Zahl n ≥ 0) als (nicht rekursive) MIPS-Assembler-Funktion, 
#und schreiben Sie ein MIPS-Programm, das die Funktionswerte für n = 0, 1, ..., 10 am Bildschirm ausgibt! (Jeder Wert soll in einer 
#neuen Zeile erscheinen.)
#Geben Sie zudem (nur für die Präsentation, nicht für die Abgabe) die Werte aller im Hauptprogramm verwendeten Register vor und nach 
#dem Funktionsaufruf an!

.data
n: .word 10
enter: .asciiz "\n"


.text 	
main: 
  	la $t0, n			#load address of array in $t
  	lw $t0, ($t0)
  	li $t1, 0

#iteriert von 0 bis ende vom word
while_loop:	
	bgt $t1, $t0, end		#0 >= n
	move $a0, $t1			#$a0 = 0
	jal fac
	move $t2, $v0			#t2 = return wert

print:
	li $v0, 1			#v0 = 1
	move $a0, $t2			#a0 = return wert
	syscall
	
	li $v0, 4			#ausgabe des ergebnisses (return wert)
	la $a0, enter
	syscall 
	
	addi $t1, $t1, 1 		#increment n+1
	j while_loop			#jump to while loop
	
fac:
	move $t3,$a0			#t3 = 0
	li $v0,1 			#Rückgabewert


#while loop für berechnung von der fakultät
while1:
	blt $t3,$zero,rück		#t3 <0 --> jump to rück
	beqz $t3,null			#t3 == 0 --> jump to null
	mult $v0,$t3			#v0 * t3
	mflo $v0			#move from lo to v0
	subi $t3,$t3,1
	j while1
	
	
null: 	li $t4,1			#t4 = 1
	mult $v0,$t4			#v0 * 1
	mflo $v0			#move from lo to $v0	
	subi $t3,$t3,1			#t3 = t3 -1
	j while1

		
rück: jr $ra
	

end: 	li $v0,10
	syscall
	
	
