// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//Implementation by: Paulo Costa 2020/12

(START)
@SCREEN // typically at address 16.384
D=A
@R0
M=D


@KBD
D=M
@BLACK
D;JGT //if any key is pressed go to black
@WHITE
0;JEQ //else go to white


(BLACK)
@R1
M=-1 //by setting this register to -1, the binary signed 2's complement is 11111111111111
@RENDERSCREEN
0;JMP

(WHITE)
@R1
M=0	//by setting this register to 0, its binary representation is 0000000000000000
@RENDERSCREEN
0;JMP

//------------------------------------------------------
(RENDERSCREEN)
@R1	
D=M	//content of what to render on screen, black or white

@R0 
A=M	//R0 references to the (current) memory address of the screen
M=D	//render 16 pixels of black or white, D register was loaded from register R1

@R0
D=M+1 //D register receives the address to the next word (16 pixels)
M=D

@KBD //@kbd is the last register on RAM - its addres is supposed to be 24.576
D=A-D // d = 24.576 - (next_set_of_16_pixels) -> 24576 - 16384 = 8192
      // the purpose of this is to work as a counter, when it reaches zero then the loop ends


@RENDERSCREEN
D;JGT //loop if D register is not zero - meaning there's still pixels to be drawn
//------------------------------------------------------

@START
0;JMP



