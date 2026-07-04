//2. Instruction Memory



//input pc
//output instruction

module instr_mem(
input [31:0] pc,
output [31:0] instruction
);

reg [31:0] mem [0:255];

initial begin
//mem[6] = 32'h002081B3; // add  x3,x1,x2
//mem[7] = 32'h40110233; // sub  x4,x2,x1
//mem[8] = 32'h0020F2B3; // and  x5,x1,x2
//mem[9] = 32'h0020E333; // or   x6,x1,x2
//mem[10] = 32'h0020C3B3; // xor  x7,x1,x2
//mem[11] = 32'h0020A433; // slt  x8,x1,x2

mem[0]  = 32'h00000013; // addi x0,x0,0
mem[1]  = 32'h00000093; // addi x1,x0,0
mem[2]  = 32'h00100113; // addi x2,x0,1
mem[3]  = 32'h002081B3; // add  x3,x1,x2
mem[4]  = 32'h00010093; // addi x1,x2,0
mem[5]  = 32'h00018113; // addi x2,x3,0
mem[6]  = 32'hFE000AE3; // beq  x0,x0,-12


//mem[3]  = 32'h0030F213; // andi x4,x1,3
//mem[4]  = 32'h00F0E293; // ori  x5,x1,15
//mem[5] = 32'hFFF10113; // addi x2,x2,-1

//mem[12] = 32'h00002483; // lw x9,0(x0)
//mem[13] = 32'h00402503; // lw x10,4(x0)
//mem[14] = 32'h00802583; // lw x11,8(x0)

//mem[15] = 32'h00302023; // sw x3,0(x0)
//mem[16] = 32'h00402223; // sw x4,4(x0)
//mem[17] = 32'h00502423; // sw x5,8(x0)

//mem[18] = 32'h00208463; // beq x1,x2,+8
//mem[19] = 32'h00209463; // bne x1,x2,+8
//mem[20] = 32'h0020C463; // blt x1,x2,+8
//mem[21] = 32'h0020D463; // bge x1,x2,+8

//mem[22] = 32'h0000006F; // jal x0,0   (infinite loop safe)
//mem[23] = 32'h00C000EF; // jal x1,12

//mem[24] = 32'h00008067; // ret (jalr x0,0(x1))

//mem[25] = 32'h000012B7; // lui x5,0x1
//mem[26] = 32'h00005297; // auipc x5,0x5

end 
assign instruction = mem[pc >> 2];
endmodule