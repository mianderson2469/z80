;***************************************************************************
;  PROGRAM:			Z80 Monitor
;  PURPOSE:			ROM Monitor Program
;  ASSEMBLER:			TASM 3.2
;  LICENSE:			The MIT License
;  AUTHOR : MCook		Michael Anderson
; CREATE DATE : 22 APR 19
;***************************************************************************

; Assemble with TASM 3.2 with the following command lines.
; Use the format appropriate for your EPROM programmer.

; For Intel HEX format output plus list file:
; tasm -80 -g0 -la -h z80_monitor.asm z80_monitor.hex

; For binary (.bin) format output plus list file:
; tasm -80 -g3 -la -h z80_monitor.asm z80_monitor.bin

ROM_BOTTOM:	.EQU	$0000		;Bottom address of ROM
ROM_TOP:	.EQU	$07FF		;Top address of ROM
RAM_BOTTOM:	.EQU	$8000		;Bottom address of RAM
RAM_TOP:	.EQU	$FFFF		;Top address of RAM

EOS:	.EQU	$FF			;End of string

	.ORG $0000

START:
	DI			;Disable interrupts
	JP	MAIN		;Jump to the MAIN routine

	.ORG	$0038

INT_CATCH:
	JP	INT_CATCH	;INF loop to catch interrupts (not enabled)

	.ORG $0066

NMI_CATCH:
	JP	NMI_CATCH	;INF loop to catch interrupts (not enabled)

.ORG $0100
;***************************************************************************
;MAIN
;Function: Entrance to user program
;***************************************************************************
MAIN:
	LD	SP,RAM_TOP		;Load the stack pointer for stack operations.
	CALL	UART_INIT		;Initialize UART
	CALL	PRINT_MON_HDR		;Print the monitor header info
	CALL	MON_PROMPT_LOOP		;Monitor user prompt loop
	HALT

;***************************************************************************
;CLEAR_SCREEN
;Function: Clears terminal screen
;***************************************************************************
MON_CLS: .BYTE "\f",EOS  	;Escape sequence for CLS. (aka form feed)

CLEAR_SCREEN:
	LD	HL,MON_CLS
	CALL	PRINT_STRING
	RET

;***************************************************************************
;RESET_COMMAND
;Function: Software Reset to $0000
;***************************************************************************
RESET_COMMAND:
	JP START	;Simply restarts

;***************************************************************************
;PRINT_MON_HDR
;Function: Print out program header info
;***************************************************************************
MON_MSG: .BYTE "\r\nZ80 Computer\t\t2019 Michael Anderson\r\n\r\n",EOS
MON_VER: .BYTE "ROM Monitor v0.1\r\n\r\n",EOS
MON_HLP: .BYTE "\t Input ? for command list\r\n",EOS

PRINT_MON_HDR:
	CALL	CLEAR_SCREEN	;Clear the terminal screen
	LD	HL,MON_MSG	;Print some messages
	CALL	PRINT_STRING
	LD	HL,MON_VER
	CALL	PRINT_STRING
	LD	HL,MON_HLP
	CALL	PRINT_STRING
		RET

;***************************************************************************
;MON_PROMPT
;Function: Prompt user for input
;***************************************************************************
MON_PROMPT: .BYTE ">",EOS

MON_PROMPT_LOOP:
	LD	HL,MON_PROMPT	;Print monitor prompt
	CALL	PRINT_STRING
	CALL	GET_CHAR	;Get a character from user into Acc
	CALL	PRINT_CHAR
	CALL	PRINT_NEW_LINE		;Print a new line
	CALL	MON_COMMAND		;Respond to user input
	CALL	PRINT_NEW_LINE		;Print a new line
	JP	MON_PROMPT_LOOP

;***************************************************************************
;MON_COMMAND
;Function: User input in accumulator to respond to
;***************************************************************************
MON_COMMAND:
	CP	'?'
	CALL	Z,HELP_COMMAND
	CP	'D'
	CALL	Z,MEMORY_DUMP_COMMAND
	CP	'C'
	CALL	Z,CLEAR_SCREEN
	CP	'R'
	CALL	Z,RESET_COMMAND
	RET

;***************************************************************************
;  PROGRAM:			UARTDriver
;  PURPOSE:			Subroutines for a 16550 UART
;  ASSEMBLER:			TASM 3.2
;  LICENSE:			The MIT License
;  AUTHOR : MCook		Michael Anderson
;  CREATE DATE :	22APR19
;***************************************************************************

;The eight addresses that the 16550 resides in I/O space.
;Change to suit hardware.
UART0:       .EQU    $10				;Data in/out
UART1:       .EQU    $11            	;Check RX
UART2:       .EQU    $12            	;Interrupts
UART3:       .EQU    $13            	;Line control
UART4:       .EQU    $14            	;Modem control
UART5:       .EQU    $15            	;Line status
UART6:       .EQU    $16            	;Modem status
UART7:       .EQU    $17            	;Scratch register

;***************************************************************************
;UART_INIT
;Function: Initialize the UART to BAUD Rate 9600 (4.9152 MHz clock input)
;***************************************************************************
UART_INIT:
	LD	A,$80			;Mask to Set DLAB Flag
	OUT	(UART3),A
	LD 	A,32			;Divisor = 32 @ 9600bps w/ 4.9152 Mhz
	OUT	(UART0),A		;Set BAUD rate to 9600
	LD	A,00
	OUT	(UART1),A		;Set BAUD rate to 9600
	LD	A,$03
	OUT	(UART3),A		;Set 8-bit data, 1 stop bit, reset DLAB Flag
	LD	A,$01
	OUT	(UART1),A		;Enable receive data available interrupt only
	RET

;***************************************************************************
;UART_PRNT_STR:
;Function: Print out string starting at MEM location (HL) to 16550 UART
;***************************************************************************
UART_PRNT_STR:
	PUSH	AF
UART_PRNT_STR_LP:
	LD	A,(HL)
	CP	EOS			;Test for end byte
	JP	Z,UART_END_PRNT_STR	;Jump if end byte is found
	CALL	UART_TX
	INC	HL			;Increment pointer to next char
	JP	UART_PRNT_STR_LP	;Transmit loop
UART_END_PRNT_STR:
	POP	AF
	RET

;***************************************************************************
;UART_TX_READY
;Function: Check if UART is ready to transmit
;***************************************************************************
UART_TX_RDY:
	PUSH	AF
UART_TX_RDY_LP:
	IN	A,(UART5)		;Fetch the control register
	BIT	5,A			;Bit will be set if UART is ready to send
	JP	Z,UART_TX_RDY_LP
	POP	AF
	RET

;***************************************************************************
;UART_TX
;Function: Transmit character in A to UART
;***************************************************************************
UART_TX:
	CALL	UART_TX_RDY		;Make sure UART is ready to receive
	OUT	(UART0),A		;Transmit character in A to UART
	RET

;***************************************************************************
;UART_RX_READY
;Function: Check if UART is ready to receive
;***************************************************************************
UART_RX_RDY:
	PUSH	AF
UART_RX_RDY_LP:
	IN	A,(UART5)		;Fetch the control register
	BIT	0,A		;Bit will be set if UART is ready to receive
	JP	Z,UART_RX_RDY_LP
	POP	AF
	RET

;***************************************************************************
;UART_RX
;Function: Receive character in UART to A
;***************************************************************************
UART_RX:
	CALL	UART_RX_RDY		;Make sure UART is ready to receive
	IN	A,(UART0)		;Receive character in UART to A
	RET

;***************************************************************************
;  PROGRAM:			MONCommands
;  PURPOSE:			Subroutines for all monitor commands
;  ASSEMBLER:			TASM 3.2
;  LICENSE:			The MIT License
;  AUTHOR : MCook		Michael Anderson
;  CREATE DATE :	22 APR 19
;***************************************************************************

;***************************************************************************
;HELP_COMMAND
;Function: Print help dialogue box
;***************************************************************************
HELP_MSG_1:	.BYTE "ZMC80 Monitor Command List\r\n",EOS
HELP_MSG_2:	.BYTE "? - view command list\r\n",EOS
HELP_MSG_3:	.BYTE "R - monitor reset\r\n",EOS
HELP_MSG_4:	.BYTE "C - clear screen\r\n",EOS
HELP_MSG_5:	.BYTE "D - print $80 bytes from specified location\r\n",EOS

HELP_COMMAND:
	LD	HL,HELP_MSG_1	;Print some messages
	CALL	PRINT_STRING
	LD	HL,HELP_MSG_2
	CALL	PRINT_STRING
	LD	HL,HELP_MSG_3
	CALL	PRINT_STRING
	LD	HL,HELP_MSG_4
	CALL	PRINT_STRING
	LD	HL,HELP_MSG_5
	CALL	PRINT_STRING
	LD	A,$FF		;Load $FF into Acc so MON_COMMAND finishes
	RET

;***************************************************************************
;MEMORY_DUMP_COMMAND
;Function: Print $80 databytes from specified location
;***************************************************************************
MDC_1: .BYTE "Memory Dump Command\r\n",EOS
MDC_2: .BYTE "Location to start in 4 digit HEX:",EOS
MDC_3: .BYTE "     00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F\r\n",EOS

MEMORY_DUMP_COMMAND:
	LD	HL,MDC_1	;Print some messages
	CALL	PRINT_STRING
	LD	HL,MDC_2
	CALL	PRINT_STRING
	CALL	GET_HEX_WORD	;HL now points to databyte location
	PUSH	HL		;Save HL that holds databyte location on stack
	CALL	PRINT_NEW_LINE	;Print some messages
	CALL	PRINT_NEW_LINE
	LD	HL,MDC_3
	CALL	PRINT_STRING
	CALL	PRINT_NEW_LINE
	POP	HL	;Restore HL that holds databyte location on stack
	LD	C,10	;Register C holds counter of dump lines to print
MEMORY_DUMP_LINE:
	LD		B,16	;Register B holds counter of dump bytes to print
	CALL	PRINT_HEX_WORD	;Print dump line address in hex form
	LD	A,' '		;Print spacer
	CALL	PRINT_CHAR
	DEC	C	;Decrement C to keep track of number of lines printed
MEMORY_DUMP_BYTES:
	LD	A,(HL)		;Load Acc with databyte HL points to
	CALL	PRINT_HEX_BYTE	;Print databyte in HEX form
	LD	A,' '		;Print spacer
	CALL	PRINT_CHAR
	INC	HL		;Increase HL to next address pointer
	DJNZ	MEMORY_DUMP_BYTES	;Print 16 bytes out since B holds 16
	LD	B,C		;Load B with C to keep track of number of lines printed
	CALL	PRINT_NEW_LINE		;Get ready for next dump line
	DJNZ	MEMORY_DUMP_LINE	;Print 10 line out since C holds 10 and we load B with C
	LD	A,$FF	;Load $FF into Acc so MON_COMMAND finishes
	RET

;***************************************************************************
;  PROGRAM:			CONIO
;  PURPOSE:			Subroutines for console I/O
;  ASSEMBLER:			TASM 3.2
;  LICENSE:			The MIT License
;  AUTHOR : MCook		Michael Anderson
;  CREATE DATE :	22 APR 19
;***************************************************************************

;***************************************************************************
;PRINT_STRING
;Function: Prints string to terminal program
;***************************************************************************
PRINT_STRING:
	CALL	UART_PRNT_STR
	RET

;***************************************************************************
;GET_CHAR
;Function: Get upper case ASCII character from user into Accumulator
;***************************************************************************
GET_CHAR:
	CALL	UART_RX		;Get char into Acc
	CALL	TO_UPPER	;Character has to be upper case
	RET

;***************************************************************************
;PRINT_CHAR
;Function: Get upper case ASCII character from Accumulator to UART
;***************************************************************************
PRINT_CHAR:
	CALL	UART_TX		;Echo character to terminal
	RET

;***************************************************************************
;TO_UPPER
;Function: Convert character in Accumulator to upper case
;***************************************************************************
TO_UPPER:
	CP	'a'	; Nothing to do if not lower case
	RET	C
	CP	'z' + 1		; > 'z'?
	RET	NC		; Nothing to do, either
	AND	$5F		; Convert to upper case
	RET

;***************************************************************************
;PRINT_NEW_LINE
;Function: Prints carriage return and line feed
;***************************************************************************
NEW_LINE_STRING: 	.BYTE "\r\n",EOS

PRINT_NEW_LINE:
	PUSH	HL
	LD	HL,NEW_LINE_STRING
	CALL	PRINT_STRING
	POP	HL
	RET

;***************************************************************************
;CHAR_ISHEX
;Function: Checks if value in A is a hexadecimal digit, C flag set if true
;***************************************************************************
CHAR_ISHEX:
			;Checks if Acc between '0' and 'F'
	CP	'F' + 1			;(Acc) > 'F'?
	RET	NC			;Yes - Return / No - Continue
	CP	'0'			;(Acc) < '0'?
	JP	NC,CHAR_ISHEX_1		;Yes - Jump / No - Continue
	CCF
	RET

CHAR_ISHEX_1:
		;Checks if Acc below '9' and above 'A'
	CP	'9' + 1			;(Acc) < '9' + 1?
	RET	C		;Yes - Return / No - Continue (meaning Acc between '0' and '9')
	CP	'A'			;(Acc) > 'A'?
	JP	NC,CHAR_ISHEX_2 	;Yes - Jump / No - Continue
	CCF
	RET

CHAR_ISHEX_2:
	;Only gets here if Acc between 'A' and 'F'
	SCF	;Set carry flag to indicate the char is a hex digit
	RET

;***************************************************************************
;GET_HEX_NIBBLE
;Function: Translates char to HEX nibble in bottom 4 bits of A
;***************************************************************************
GET_HEX_NIB:
	CALL	GET_CHAR
	CALL	CHAR_ISHEX		;Is it a hex digit?
	JP	NC,GET_HEX_NIB		;Yes - Jump / No - Continue
	CALL	PRINT_CHAR
	CP	'9' + 1			;Is it a digit less or equal '9' + 1?
	JP	C,GET_HEX_NIB_1		;Yes - Jump / No - Continue
	SUB	$07			;Adjust for A-F digits
GET_HEX_NIB_1:
	SUB	'0'		;Subtract to get nib between 0->15
	AND	$0F		;Only return lower 4 bits
	RET

;***************************************************************************
;GET_HEX_BYTE
;Function: Gets HEX byte into A
;***************************************************************************
GET_HEX_BYTE:
	CALL	GET_HEX_NIB	;Get high nibble
	RLC	A		;Rotate nibble into high nibble
	RLC	A
	RLC	A
	RLC	A
	LD	B,A		;Save upper four bits
	CALL	GET_HEX_NIB	;Get lower nibble
	OR	B		;Combine both nibbles
	RET

;***************************************************************************
;GET_HEX_WORD
;Function: Gets two HEX bytes into HL
;***************************************************************************
GET_HEX_WORD:
	PUSH	AF
	CALL	GET_HEX_BYTE		;Get high byte
	LD	H,A
	CALL	GET_HEX_BYTE		;Get low byte
	LD	L,A
	POP	AF
	RET

;***************************************************************************
;PRINT_HEX_NIB
;Function: Prints a low nibble in hex notation from Acc to the serial line.
;***************************************************************************
PRINT_HEX_NIB:
	PUSH 	AF
	AND	$0F			;Only low nibble in byte
	ADD	A,'0'			;Adjust for char offset
	CP	'9' + 1			;Is the hex digit > 9?
	JP	C,PRINT_HEX_NIB_1	;Yes - Jump / No - Continue
	ADD	A,'A' - '0' - $0A	;Adjust for A-F
PRINT_HEX_NIB_1:
	CALL	PRINT_CHAR	;Print the nibble
	POP	AF
	RET

;***************************************************************************
;PRINT_HEX_BYTE
;Function: Prints a byte in hex notation from Acc to the serial line.
;***************************************************************************
PRINT_HEX_BYTE:
	PUSH	AF	;Save registers
	PUSH	BC
	LD	B,A	;Save for low nibble
	RRCA		;Rotate high nibble into low nibble
	RRCA
	RRCA
	RRCA
	CALL	PRINT_HEX_NIB		;Print high nibble
	LD	A,B			;Restore for low nibble
	CALL	PRINT_HEX_NIB		;Print low nibble
	POP	BC			;Restore registers
	POP	AF
	RET

;***************************************************************************
;PRINT_HEX_WORD
;Function: Prints the four hex digits of a word to the serial line from HL
;***************************************************************************
PRINT_HEX_WORD:
	PUSH	HL
	PUSH	AF
	LD	A,H
	CALL	PRINT_HEX_BYTE		;Print high byte
	LD	A,L
	CALL	PRINT_HEX_BYTE		;Print low byte
	POP	AF
	POP	HL
	RET
.END
