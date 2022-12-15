// Content stolen here: https://student.cs.uwaterloo.ca/~isg/res/mips/opcodes
//
// Instruction encodings
//
// Each MIPS instruction is encoded in exactly one word (32 bits). There are
// three encoding formats.
//
// Register Encoding
// =================
//
// This encoding is used for instructions which do not require any immediate
// data. These instructions receive all their operands in registers.
// Additionally, certain of the bit shift instructions use this encoding;
// their operands are two registers and a 5-bit shift amount.
//
// 31    24 23    16 15     8 7      0
// ooooooss sssttttt dddddaaa aaffffff
//
// Field | Width | Description
// ---------------------------------------------------------------------------
//     o |     6 | Instruction opcode. This is 000000 for instructions using
//       |       | this encoding.
//     s |     5 | First source register, in the range 0-31.
//     t |     5 | Second source register, in the range 0-31.
//     d |     5 | Destination register, in the range 0-31.
//     a |     5 | Shift amount, for shift instructions.
//     f |     6 | Function. Determines which operation is to be performed.
//       |       | Values for this field are documented in the tables at the
//       |       | bottom of this page.
//
//
// Immediate Encoding
// ==================
//
// This encoding is used for instructions which require a 16-bit immediate
// operand. These instructions typically receive one operand in a register,
// another as an immediate value coded into the instruction itself, and place
// their results in a register. This encoding is also used for load, store,
// branch, and other instructions so the use of the fields is different in
// some cases.
//
// Note that the "first" and "second" registers are not always in this order
// in the assembly language; see "Instruction Syntax" for details.
//
// 31    24 23    16 15     8 7      0
// ooooooss sssttttt iiiiiiii iiiiiiii
//
// Field | Width | Description
// ---------------------------------------------------------------------------
//     o |     6 | Instruction opcode. Determines which operation is to be
//       |       | performed.
//     s |     5 | First register, in the range 0-31.
//     t |     5 | Second register, in the range 0-31.
//     i |    16 | Immediate data.
//
//
// Jump Encoding
// =============
//
// This encoding is used for jump instructions, which require a 26-bit
// immediate offset. It is also used for the trap instruction.
//
// 31    24 23    16 15     8 7      0
// ooooooii iiiiiiii iiiiiiii iiiiiiii
//
// Field | Width | Description
// ---------------------------------------------------------------------------
//     o |     6 | Instruction opcode. Determines which operation is to be
//       |       | performed.
//     i |    26 | Immediate data.
//


// "MEM [a]:n" means the n bytes of memory starting with address a.
// The address must always be aligned; that is, a must be divisible by n,
// which must be a power of 2.
//
//"LB (x)" means the least significant 8 bits of the 32-bit location x.
//"LH (x)" means the least significant 16 bits of the 32-bit location x.
//"HH (x)" means the most significant 16 bits of the 32-bit location x.
//
//"SE (x)" means the 32-bit quantity obtained by extending the value x on the
// left with its most significant bit.
//"ZE (x)" means the 32-bit quantity obtained by extending the value x on the
// left with 0 bits.

// Arithmetic and Logical Instructions
`define OPCODE_REG   6'b000000
`define FUNC_ADD     6'b100000 // ArithmLog, $d = $s + $t
`define FUNC_ADDU    6'b100001 // ArithmLog, $d = $s + $t
`define OPCODE_ADDI  6'b001000 // ArithLogI, $t = $s + SE(i)
`define OPCODE_ADDIU 6'b001001 // ArithLogI, $t = $s + SE(i)
`define FUNC_AND     6'b100100 // ArithmLog, $d = $s & $t
`define OPCODE_ANDI  6'b001100 // ArithLogI, $t = $s & ZE(i)
`define FUNC_DIV     6'b011010 // DivMult, lo = $s / $t; hi = $s % $t
`define FUNC_DIVU    6'b011011 // DivMult, lo = $s / $t; hi = $s % $t
`define FUNC_MULT    6'b011000 // DivMult, $d = $s * $t
`define FUNC_MULTU   6'b011001 // DivMult, $d = $s * $t
`define FUNC_NOR     6'b100111 // ArithmLog, $d = ~($s ^ $t)
`define FUNC_OR      6'b100101 // ArithmLog, $d = $s | $t
`define OPCODE_ORI   6'b001101 // ArithLogI, $t = $s | ZE(i)
`define FUNC_SLL     6'b000000 // Shift, $d = $t << a
`define FUNC_SLLV    6'b000100 // ShiftV, $d = $t << $s
`define FUNC_SRA     6'b000011 // Shift, $d = $t >> a
`define FUNC_SRAV    6'b000111 // ShiftV, $d = $t >> $s
`define FUNC_SRL     6'b000010 // Shift, $d = $t >>> a
`define FUNC_SRLV    6'b000110 // ShiftV, $d = $t >>> $s
`define FUNC_SUB     6'b100010 // ArithmLog, $d = $s - $t
`define FUNC_SUBU    6'b100011 // ArithmLog, $d = $s - $t
`define FUNC_XOR     6'b100110 // ArithmLog, $d = $s ^ $t
`define OPCODE_XORI  6'b001110 // ArithLogI, $t = $s ^ ZE(i)

// Constant-Manipulating Instructions
`define OPCODE_LHI   6'b011001 // LoadI, LH ($t) = i
`define OPCODE_LLO   6'b011000 // LoadI, HH ($t) = i

// Comparison Instructions
`define FUNC_SLT     6'b101010 // ArithmLog, $d = $s < $t
`define FUNC_SLTU    6'b101011 // ArithmLog, $d = $s < $t
`define OPCODE_SLTI  6'b001010 // ArithLogI, $t = ($s < SE(i))
`define OPCODE_SLTIU 6'b001011 // ArithLogI, $t = ($s < SE(i))

// Branch Instructions
`define OPCODE_BEQ   6'b000100 // Branch, if ($s == $t) pc += i << 2
`define OPCODE_BGTZ  6'b000111 // BranchZ, if ($s > 0) pc += i << 2
`define OPCODE_BLEZ  6'b000110 // BranchZ, if ($s <= 0) pc += i << 2
`define OPCODE_BNE   6'b000101 // Branch, if ($s != $t) pc += i << 2

// Jump Instructions
`define OPCODE_J     6'b000010 // Jump, pc += i << 2
`define OPCODE_JAL   6'b000011 // Jump, $31 = pc; pc += i << 2
`define FUNC_JALR    6'b001001 // JumpR, $31 = pc; pc = $s
`define FUNC_JR      6'b001000 // JumpR, pc = $s

// Load Instructions
`define OPCODE_LB    6'b100100 // LoadStore, $t = SE (MEM [$s + i]:1)
`define OPCODE_LBU   6'b100100 // LoadStore, $t = ZE (MEM [$s + i]:1)
`define OPCODE_LH    6'b100001 // LoadStore, $t = SE (MEM [$s + i]:2)
`define OPCODE_LHU   6'b100101 // LoadStore, $t = ZE (MEM [$s + i]:2)
`define OPCODE_LW    6'b100011 // LoadStore, $t = MEM [$s + i]:4

// Store Instructions
`define OPCODE_SB    6'b101000 // LoadStore, MEM [$s + i]:1 = LB ($t)
`define OPCODE_SH    6'b101001 // LoadStore, MEM [$s + i]:2 = LH ($t)
`define OPCODE_SW    6'b101011 // LoadStore, MEM [$s + i]:4 = $t

// Data Movement Instructions
`define FUNC_MFHI    6'b010000 // MoveFrom, $d = hi
`define FUNC_MFLO    6'b010010 // MoveFrom, $d = lo
`define FUNC_MTFI    6'b010001 // MoveTo, hi = $s
`define FUNC_MTLO    6'b010011 // MoveTo, lo = $s

// Exception and Interrupt Instructions
`define OPCODE_TRAP  6'b011010 // Trap
