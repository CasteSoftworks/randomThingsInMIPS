.data
bufferImmagine: .space 4096 #64x64
.text
	la $t0 bufferImmagine 
	li $t1 4096
	li $t2 0x00FFFF00 #giallo
	
loopSfondo:
	sw $t2, 0($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, -1 
	bnez $t1, loopSfondo 

spazioVuoto:
	la $t0 bufferImmagine
	addi $t0 $t0 5120 #20 righe vuote (64*10*8)
	addi $t0 $t0 60 #15 colonne dal bordo
	

inizializzazioneRettangolo:
	li $t1 30 #10x3
	li $t2 0x00000000 #nero
	
rettangolo:
	li $t4 3
rettangoloRiga:	
	sw $t2 0($t0)
	addi $t0 $t0 4
	addi $t4 $t4 -1
	addi $t1 $t1 -1
	bnez $t4 rettangoloRiga
cambioColonna:
	addi $t0 $t0 244
	bnez $t1 rettangolo

spazioOcchio2:
	la $t0 bufferImmagine
	li $t1 30
	addi $t0 $t0 5120 #20 righe vuote (64*10*8)
	addi $t0 $t0 184 #46 colonne dal bordo

rettangolo2:
	li $t4 3
rettangoloRiga2:	
	sw $t2 0($t0)
	addi $t0 $t0 4
	addi $t4 $t4 -1
	addi $t1 $t1 -1
	bnez $t4 rettangoloRiga2
cambioColonna2:
	addi $t0 $t0 244
	bnez $t1 rettangolo2	
	
inizizalizzazioneBocca:
	la $t0 bufferImmagine
	addi $t0 $t0 12800 #50 righe sotto
	addi $t0 $t0 60 #15 colonne dal bordo
	li $t1 9
	
angoloBoccaIni:
	li $t4 3
angoloBocca:
	sw $t2 0($t0)
	addi $t0 $t0 4
	addi $t1 $t1 -1
	addi $t4 $t4 -1
	bnez $t4 angoloBocca
cambioColonnaBocca:
	addi $t0 $t0 244
	bnez $t1 angoloBoccaIni
	
spazioAngoli:
	beq $s0 1 lineaBoccaIni
	la $t0 bufferImmagine
	addi $t0 $t0 12800 #50 righe sotto
	addi $t0 $t0 184 #46 colonne dal bordo
	li $t1 9
	li $s0 1
	j angoloBoccaIni
	
lineaBoccaIni:
	la $t0 bufferImmagine
	addi $t0 $t0 13568 #53 righe sotto
	addi $t0 $t0 72 #18 colonne dal bordo
	li $t1 84	
	
lineaBocca:
	li $t4 28
disegna:
	sw $t2 0($t0)
	addi $t0 $t0 4
	addi $t1 $t1 -1
	addi $t4 $t4 -1
	bnez $t4 disegna
aCapo:
	addi $t0 $t0 144
	bnez $t1 lineaBocca
	
	
fine:
	li $v0 10
	syscall
