#!/usr/bin/python

inFile = open("testPrograms.txt", 'r');
outFile = open("output.txt", 'w');

PC = 0
number_instruction = -4
for line in inFile:
    number_instruction = number_instruction + 4
    a = ""
    b = ""
    c = ""
    vals = line.split()
    if (vals):
	inst = vals[0]
    	if len(vals) == 2:
	    a = vals[1]
            if a[0] == '$':
		a = a[2:]
	    binary = bin(int(a))
    	    binary1 = binary[2:]
	    binary1 = "0"*(5-len(binary1)) + binary1
    	if len(vals) == 3:
	    a = vals[1][:-1]
 	    b = vals[2]
            if a[0] == '$':
		a = a[2:]
            if b[0] == '$':
		b = b[2:]
	    binary = bin(int(a))
    	    binary1 = binary[2:]
	    binary1 = "0"*(5-len(binary1)) + binary1
	    binary = bin(int(b))
    	    binary2 = binary[2:]
	    binary2 = "0"*(5-len(binary2)) + binary2
    	if len(vals)== 4:
	    a = vals[1][:-1]
	    b = vals[2][:-1]
	    c = vals[3]
            if a[0] == '$':
		a = a[2:]
            if b[0] == '$':
		b = b[2:]
            if c[0] == '$':
		c = c[2:]
	    binary = bin(int(a))
    	    binary1 = binary[2:]
	    binary1 = "0"*(5-len(binary1)) + binary1
	    binary = bin(int(b))
    	    binary2 = binary[2:]
	    binary2 = "0"*(5-len(binary2)) + binary2
	    binary = bin(int(c))
    	    binary3 = binary[2:]
	    binary3 = "0"*(5-len(binary3)) + binary3
    op = "000000"
    shamt = "00000"
    #funct = ""
    hexNum = hex(number_instruction)
    hexN = hexNum[2:]
    addr = '0x'+"0"*(8-len(hexN)) + hexN
    if inst == "add":
	binToHex = op + binary1 + binary2 + binary3 + shamt + "100000"
    
    if inst == "addu":
    	binToHex = op + binary1 + binary2 + binary3 + shamt + "100001" 

    if inst == "addi":
	op = "001000"
	immediate = "0"*(16-len(binary3)) + binary3
	binToHex = op + binary1 + binary2 + immediate

    if inst == "addui":
	op = "001001"
	immediate = "0"*(16-len(binary3)) + binary3
	binToHex = op + binary1 + binary2 + immediate

    if inst == "beq":
	op = "000100"
	# NOT DONE
	binToHex = op + binary1 + binarry2 + immediate
	
    #if inst == "halt":
    
    if inst == "j":
	op = "000010"
	address = "0"*(26-len(binary1)) + binary1
	binToHex = op + address

    if inst == "jal":
	op = "000011"
	# NOT DONE
	address = "0"*(26-len(binary1)) + binary1
	binToHex = op + address

    if inst == "jr":
	binToHex = op + binary1 + binary2 + binary3 + shamt + "001000"

    if inst == "lw":
	op = "100011"
	# DON'T THINK THIS IS DONE
	immediate = "0"*(16-len(binary3)) + binary3
	binToHex = op + binary1 + binary2 + immediate

    if inst == "nor":
	binToHex = op + binary1 + binary2 + binary3 + shamt + "100111"

    if inst == "sll":
	# ASK ABOUT SHAMT
	binToHex = op + binary1 + binary2 + binary3 + binary3 + "000000"

    if inst == "srl":
	# STILL ASK ABOUT SHAMT
	binToHex = op + binary1 + binary2 + binary3 + binary3 + "000010"

    if inst == "slt":
	binToHex = op + binary1 + binary2 + binary3 + shamt + "101010"

    if inst == "sub":
	binToHex = op + binary1 + binary2 + binary3 + shamt + "100010"

    if inst == "sw":
	op = "101011"
	# DON'T THINK THIS IS DONE
	immediate = "0"*(16-len(binary3)) + binary3
	binToHex = op + binary1 + binary2 + immediate

    if inst == "ori":
	op = "001101"
	immediate = "0"*(16-len(binary3)) + binary3
	binToHex = op + binary1 + binary2 + immediate

    if inst == "xor":
    	binToHex = op + binary1 + binary2 + binary3 + shamt + "100110"



    binToHex = hex(int(binToHex,2))
    binToHex = binToHex[2:]
    h="0"*(8-len(binToHex)) + binToHex
    print addr,h













