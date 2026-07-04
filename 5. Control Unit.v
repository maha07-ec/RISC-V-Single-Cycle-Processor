//5. Control Unit  

module cntrl_unit(

input [31:0] instruction,

output reg [31:0] immOut,
output reg reg_write,
output reg alu_regri, 
output reg mem_read, 
output reg mem_write,
output reg mem_to_reg,
output reg branch,
output reg [4:0] alu_op,
output reg [4:0] rs1,
output reg [4:0] rs2,
output reg [4:0] rd
);

wire [6:0] funct7 = instruction[31:25];
wire [2:0] funct3 = instruction[14:12];
wire [6:0] opcode;

assign opcode= instruction[6:0];

always@(*)
begin
immOut = 32'b0;
reg_write = 0;
alu_regri = 0;
mem_read = 0;
mem_write = 0;
mem_to_reg = 0;
branch = 0;
alu_op = 5'd15;
rs1 = 5'd0;
rs2 = 5'd0;
rd  = 5'd0;

case(opcode)

7'b0110011://R type
	begin
	
	immOut = 32'b0;
	reg_write=1;
	alu_regri=0;
	mem_read=0;
	mem_write=0;
	mem_to_reg=0;
	branch=0;
        
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
	rd = instruction[11:7];
	case(funct7)
	
		7'd0:
			case(funct3)
			
			3'b000:
				alu_op=5'd0;
			3'b111:
				alu_op=5'd2;
			3'b110:
				alu_op=5'd3;
			3'b100:
				alu_op=5'd4;
			3'b010:
				alu_op=5'd5;
			
			endcase
		7'd32:
			case(funct3)
				
				3'b000: 
					alu_op=5'd1;
				
			endcase
	
	endcase
	end

7'b0010011://I type
	begin
	immOut={{20{instruction[31]}},{instruction[31:20]}};
	reg_write=1;
	alu_regri=1;
	mem_read=0;
	mem_write=0;
	mem_to_reg=0;
	branch=0;

       rs1 = instruction[19:15];
       
	rd = instruction[11:7];


	
		case(funct3)
		
			3'b000:
				alu_op=5'd6;
			3'b111:
				alu_op=5'd7;
			3'b110:
				alu_op=5'd8;
	
		endcase

	end
7'b0000011://Load
	begin
	immOut={{20{instruction[31]}}, {instruction[31:20]}};
	reg_write=1;
	alu_regri=1;
	mem_read=1;
	mem_write=0;
	mem_to_reg=1;
	branch=0;
	
	rs1 = instruction[19:15];
       
	rd = instruction[11:7];


	alu_op=5'd9;

	end
7'b0100011://Store
	begin
	immOut={{20{instruction[31]}},{instruction[31:25]},{instruction[11:7]}};
	reg_write=0;
	alu_regri=1;
	mem_read=0;
	mem_write=1;
	mem_to_reg=0;
	branch=0;

	rs2 = instruction[24:20];
        rs1 = instruction[19:15];

	
	alu_op=5'd10;
	end

7'b1100011://B type
	begin
	immOut={{19{instruction[31]}},{instruction[31]},{instruction[7]},{instruction[30:25]},{instruction[11:8]},1'b0};
	reg_write=0;
	alu_regri=0;
	mem_read=0;
	mem_write=0;
	mem_to_reg=0;
	branch=1;

        rs2 = instruction[24:20];
        rs1 = instruction[19:15];


	
	case(funct3)
		

		3'b000:
			alu_op=5'd11;
		3'b001:
			alu_op=5'd12;
		3'b100:
			alu_op=5'd13;
		3'b101:
			alu_op=5'd14;
		
	endcase
	end

default: ;
endcase 
end
endmodule