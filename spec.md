# Specification

## Bytecode

Each instruction is made up of 5 bytes

k | r | 2 | Opcode
- | - | - | ------
0 | 0 | 0 | 00000

`k` means the instruction doesn't consume items on the stack
`r` means the instruction operates on the return stack
`2` means it operates on a short instead of a byte

### Instructions

0. `MODE [mode]`
    **Modes**<br>
    0. console
    1. file
    2. self
1. `LIT [immediate]`
2. `EVAL [operator]`
3. `EVALI [operator] [immediate]`
4. `TJMP [address]`
5. `FJMP [address]`
