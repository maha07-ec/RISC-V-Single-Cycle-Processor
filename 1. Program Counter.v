//1. Program Counter

//Stores address of current instruction
//For every clk PC<= next_PC


module prog_c(
input clk, 
input rst,
input [31:0] next_pc,
output reg [31:0] pc
);

always@(posedge clk or posedge rst)
begin

if(rst)
	pc<= 32'd0;
else
	pc<=next_pc;

end
endmodule