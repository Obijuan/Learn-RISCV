\ Riscv assembler!

\ -- addi x1,x0,0xaa --> 0aa00093
\ -- addi x2,x0,0xbb --> 0bb00113

\ -- 0x Palabra para introducir numero en hexadecimal
\ -- Tomada del fichero cross.fs del proyecto Swapforce j1a
\ -- Colo funciona en COMPILACION
: h#
    base @ >r 16 base !
    0. bl parse >number throw 2drop postpone literal
    r> base ! ; immediate

\ -- 0x Palabra para introducir numero en hexadecimal
\ -- SOLO FUNCIONA EN INTERPRETACION
: 0x HEX WORD NUMBER 0<> IF ." Error" CR THEN DECIMAL ;

\ -- Constantes
20 CONSTANT IMM_POS
15 CONSTANT RS1_POS 
7  CONSTANT RD_POS

\ -- Registros
: x0 0 ;
: x1 1 ;
: x2 2 ;

\ -- Opcodes
: addi_op  h# 13 ;

\ -- Instrucciones
: addi, ( u u u --- u)  \ -- rd rs1 imm
  \ -- | imm (12-bits) | rs1 (5) | func3 | rd (5) | opcode (7) |
  IMM_POS lshift   ( rd rs1 temp )  \ -- Campo del valor inmediato
  -rot             ( imm<< rd rs1 )
   RS1_POS lshift  ( imm<< rd rs1<< )
   -rot            ( rs1<< imm<< rd)
   RD_POS lshift   ( rs1<< imm<< rd<<)
   addi_op         ( rs1<< imm<< rd<< opcode)
   or or or        ( cm )
;

: test 
  cr
  x1 x0 h# aa addi, . cr
  x2 x0 h# bb addi, . cr
;


hex
test


