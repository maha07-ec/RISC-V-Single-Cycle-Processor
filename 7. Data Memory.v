//7. Data Memory

module data_memory(
    input clk,
    input mem_read,
    input mem_write,

    input [31:0] sum,
    input [31:0] write_data,

    output reg [31:0] read_data

);

reg [31:0] data_mem [0:255];


//lw
always@(*)
begin
	if(mem_read && !mem_write)
	begin
		read_data = data_mem[sum>>2];
	end
	else 	read_data = 32'd0;
end

//sw
always@(posedge clk)
begin
	if(!mem_read && mem_write)
	begin
		data_mem[sum>>2]<= write_data;
	end
	
end 
endmodule