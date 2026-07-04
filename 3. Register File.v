3. Register File

module reg_file(
input clk,
input rst,
input [4:0] rs1,
input [4:0] rs2,
input [4:0] rd,
input [31:0] write_data,
input reg_write,
output  [31:0] read_data1,
output  [31:0] read_data2

);

reg [31:0] regx [0:31];
integer i;

assign read_data1= regx[rs1];
assign read_data2= regx[rs2];

always@(posedge clk or posedge rst)
begin

if(rst) begin
	for(i=0;i<32;i=i+1)
	regx[i]<=0;
	end
else 
	//regx[rs1]<= 5;
	//regx[rs2]<= 7;
	//rs1<= 5'd1;
	//rs2<= 5'd2;
	//rd<= 5'd3;
	if(reg_write && rd!=0) begin
	regx[rd]<= write_data;
	regx[0] <= 0;
	end
end

endmodule