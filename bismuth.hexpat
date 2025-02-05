#pragma author Nuclear Pasta
#pragma description Bismuth Virtual Machine ROM

import std.mem;
import std.core;
import std.io;

std::core::set_endian(std::mem::Endian::Big); // Bismuth bytecode uses big endian for all of it's numbers

enum OpcodeMode : u8 {
    NONE = 0,
    KEEP = 0b10000000,
    RETURN = 0b01000000,
    SHORT = 0b00100000,
};

enum Opcode : u8 {
    MODE = 0,
    LIT,
    EVAL,
    EVALI,
    TJMP,
    FJMP,
    MEMR,
    MEMW
};

union FullOpcode {
    Opcode op;
};

enum ModeArg : u8 {
    CONSOLE = 0,
    SYSTEM,
    SELF,
    FILE
};

struct Instruction {
    FullOpcode opcode [[color("FF0000")]];
    if (this.opcode.op == Opcode::MODE) {
        ModeArg arg [[color("D856D8")]];
        u24 unused [[color("000000")]];
    } else if (this.opcode.op == Opcode::LIT) {
        u16 arg [[color("D856D8")]];
        u16 unused [[color("000000")]];
    } else if (this.opcode.op == Opcode::TJMP || this.opcode.op == Opcode::TJMP) {
        u16 argA [[color("D856D8")]];
        u16 argB [[color("56D856")]];
    } else {
        u32 unused [[color("000000")]];
    }
};

struct Program {
    Instruction instructions[while(!std::mem::eof())];
};

Program program @ 0;