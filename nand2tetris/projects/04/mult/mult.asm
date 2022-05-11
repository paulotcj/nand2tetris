// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//Implementation by: Paulo Costa 2020/12

@R2	
M=0	

@R0
D=M
@END
D;JEQ //jump to end if multiplier or multiplicand is zero

@R1
D=M
@END
D;JEQ //jump to end if multiplier or multiplicand is zero



(LOOP)
@R1	//select R1
D=M	//copy the value from memory register (M) to data register (D)

@R2	//select R2
M=D+M //R2 receives the value of R2 + R1

@R0	//selects R0 - in this model R0 is being used as a loop counter
M=M-1 //decrement R0

D=M
@LOOP
D;JGT //while R0 is greater than zero, repeat this loop


(END)
@END
0;JMP