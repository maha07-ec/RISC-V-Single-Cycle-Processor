module RISC_TB;

reg clk;
reg rst;
wire [31:0] final_write_data;

RISC DUT(
.clk(clk),
.rst(rst),
.final_write_data(final_write_data)
);

initial 
begin 
clk=0;
forever #5 clk=~clk;
end

initial 
begin
rst=1;
#10 rst=0;
$monitor("Time= %0t, final_write_data=%d", $time, final_write_data);

#300 $finish;

end

endmodule

