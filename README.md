# RISC-V-Single-Cycle-Processor
Designed and Verified a RISC-V Single Cycle Processor using Verilog HDL. The processor supports the RV32I instruction set and was successfully simulated, synthesized, implemented, and validated on an FPGA using Xilinx Vivado.

## Features
- Program Counter
- Instruction memory
- Register File
- ALU
- Control Unit
- Data Memory
- Top Module
- Testbench
  
## Supported Instrutions
- Arithmetic: ADD, SUB
- Logical: AND, OR, XOR
- Immediate Instructions: ADDI
- Memory Instructions: LW, SW
- Branch Instructions: BEQ

## FPGA Implementation
- Successfully synthesized using Xilinx Vivado
- Implemented on FPGA hardware
- Verified correct processor operation on FPGA
- Timing analysis completed successfully

## Verification
- Developed Verilog testbench
- Simulated instruction execution
- Waveforms analyzed using Vivado Simulator
  
## Tools Used
- Verilog HDL
- Xilinx Vivado
- Vivado Simulator
- FPGA Basys3 Board

## Project Structure
RTL/
Testbench/
Constraints/
Documentation/
Images/
README.md

## Results
- Functional simulation passed
- Successful FPGA implementation
- Correct execution of supported RISC-V instructions
- No synthesis or implementation errors

## Future Improvements
- Five-stage pipelined processor
- Hazard Detection Unit
- Forwarding Unit
- Instruction Cache
- Data Cache
- Interrupt Handling

## Author
Sita Mahalakshmi Sangisetti
