//6.ALU 

module ALU(
      
        input [31:0]read_data1,
        input [31:0]read_data2,
        input [4:0] alu_op,
        input [31:0]immOut,
	input [31:0] pc,
	
        input alu_regri,

	output reg [31:0] next_pc,
        output reg [31:0] write_data,
	output reg [31:0] sum
);

wire [31:0] operand2;

 reg [31:0] branch_addr;



assign operand2 = alu_regri? immOut: read_data2;


always@(*)
begin
write_data  = 32'd0;
sum         = 32'd0;
next_pc     = pc + 4;
branch_addr = 32'd0;

case(alu_op)



5'd0, 
5'd6: write_data = read_data1 + operand2;

5'd1: write_data = read_data1 - operand2;

5'd2,
5'd7: write_data = read_data1 & operand2;

5'd3,
5'd8: write_data = read_data1 | operand2;

5'd4: write_data = read_data1 ^ operand2;

5'd5: write_data = (read_data1 < operand2)? 32'd1: 32'd0;



5'd9:  begin //load 
	sum= read_data1 + immOut;

	end
5'd10: begin //store
	sum= read_data1 + immOut;
	
	end
5'd11:  begin
	branch_addr= (read_data1==read_data2)? immOut: 32'd4;
	next_pc= pc+ branch_addr;
	end
5'd12: begin
	branch_addr= (read_data1!=read_data2) ? immOut: 32'd4;
	next_pc= pc+ branch_addr;
	end
5'd13: begin
	branch_addr= (read_data1< read_data2) ? immOut: 32'd4;
	next_pc= pc+ branch_addr;
	end
5'd14: begin
	branch_addr= (read_data1>= read_data2) ? immOut: 32'd4;
	next_pc= pc+ branch_addr;
	end
default: write_data = 32'b0;
endcase

end
endmodule



