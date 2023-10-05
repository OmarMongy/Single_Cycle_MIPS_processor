# Single-Cycle MIPS Processor

## Introduction

Welcome to my Single-Cycle MIPS Processor repository. This project presents a complete design and implementation of a single-cycle MIPS processor, adhering to the MIPS instruction set architecture (ISA). The primary objective is to create a processor that can execute each instruction within a single clock cycle, providing an efficient and straightforward design approach.

## Features

- **Single-Cycle Execution**: The processor is designed to execute each instruction in a single clock cycle, resulting in a simplified control logic and efficient processing.
- **MIPS ISA Compatibility**: The processor strictly adheres to the MIPS instruction set architecture, ensuring compatibility with existing MIPS programs, compilers, and development tools.
- **Arithmetic and Logic Operations**: The processor supports a range of arithmetic and logic operations, including addition, subtraction, logical AND, logical OR, and more, providing essential computation capabilities.

## Architecture
![complete single-cycle mips processor](https://i.ibb.co/mzJfCTf/Complete-single-cycle-MIPS-processor.png)


### The architecture of the Single-Cycle MIPS Processor is based on the MIPS ISA and comprises the following key components:

- **Instruction Memory (IMem)**: This component stores the program instructions that need to be executed by the processor.
- **Data Memory (DMem)**: The data memory is used for data storage and facilitates load and store operations within the processor.
- **Control Unit**: The control unit governs the overall operation of the processor, ensuring correct instruction execution and proper handling of control signals.
- **Data Path Components** : The data path is constructed by integrating the Arithmetic Logic Unit (ALU), which handles arithmetic and logic operations according to the executing instruction. Additionally, the Register File holds the data being processed by the ALU and other processor components, along with the Program Counter for managing the program's execution flow.
- For a detailed and in-depth understanding of the architecture and its components, please refer to the source files and accompanying documentation within this repository.

  
### Top Module View :
![Top Module View ](https://i.ibb.co/rspBmVn/Screenshot-2023-10-05-101814.png)

## Supported MIPS Instructions

The MIPS architecture provides a variety of instructions, and this single-cycle processor implementation supports the following instructions:

1. **Load Word (lw)**
   - Syntax: `lw rt, imm(rs)`
   - Description: Loads a 32-bit word from memory into a register.

2. **Store Word (sw)**
   - Syntax: `sw rt, imm(rs)`
   - Description: Stores a 32-bit word from a register into memory.

3. **Add Immediate (addi)**
   - Syntax: `addi rt, rs, imm`
   - Description: Adds a 16-bit immediate value to the value in a register.

4. **Branch Equal (beq)**
   - Syntax: `beq rs, rt, offset`
   - Description: Branches to a target address if the values in two registers are equal.

5. **Jump and Jump Register (jal, j)**
   - Syntax: `jal target` (for jump and link)
   - Syntax: `j target` (for jump)
   - Description: Jumps to a target address, either with or without saving the return address in a register.

6. **R-type instructions: Arithmetic and Logical Operations**
   - Supported instructions: `add`, `sub`, `slt`, `mul`
   - Description: Performs arithmetic and logical operations on register operands.

## Implementation

The implementation of the Single-Cycle MIPS Processor is primarily done using Verilog HDL. The design involves defining the components and interconnections, ensuring their proper functionality, and strictly adhering to the specifications of the MIPS ISA.



## Contributing

Contributions to this project are highly appreciated. If you encounter any issues, have suggestions for improvements, or wish to contribute new features, please adhere to the standard GitHub contribution process. Feel free to open an issue to discuss problems or create a pull request to propose changes.

## License

This project is licensed under the [MIT License](LICENSE), which grants permissions for both personal and commercial use. You are allowed to modify, distribute, sublicense, and use the software. Refer to the LICENSE file for the complete details of the license agreement.
