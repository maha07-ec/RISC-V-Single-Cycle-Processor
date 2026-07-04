module RISC(
input clk,
input rst,
output  [31:0] final_write_data

);

wire [31:0] pc;
wire [31:0] next_pc;
wire [31:0] instruction;

wire [31:0] read_data1;
wire [31:0] read_data2;

wire [31:0] immOut;

wire [31:0] write_data;
wire [31:0] read_data;

wire [31:0] sum;


wire reg_write;
wire alu_regri;
wire mem_read;
wire mem_write;
wire mem_to_reg;
wire branch;

wire [4:0] alu_op;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;



prog_c PC(
.clk(clk), 
.rst(rst),
.next_pc(next_pc),
.pc(pc)
);

instr_mem IM(
.pc(pc),
.instruction(instruction));

assign final_write_data = mem_to_reg ? read_data : write_data;

reg_file RF(
.clk(clk),
.rst(rst),
.rs1(rs1),
.rs2(rs2),
.rd(rd),
.write_data(final_write_data),
.reg_write(reg_write),
.read_data1(read_data1),
.read_data2(read_data2)
);

cntrl_unit CU(

.instruction(instruction),
.immOut(immOut),
.reg_write(reg_write),
.alu_regri(alu_regri), 
.mem_read(mem_read), 
.mem_write(mem_write),
.mem_to_reg(mem_to_reg),
.branch(branch),
.alu_op(alu_op),
.rs1(rs1),
.rs2(rs2),
.rd(rd)
);


ALU Alu_unit (
.read_data1(read_data1),
.read_data2(read_data2),
.alu_op(alu_op),
.immOut(immOut),
.pc(pc),
.alu_regri(alu_regri),
.next_pc(next_pc),
.write_data(write_data),
.sum(sum)
);


data_memory DM(
.clk(clk),
.mem_read(mem_read),
.mem_write(mem_write),
.sum(sum),
.write_data(write_data),
.read_data(read_data)
);

endmodule

