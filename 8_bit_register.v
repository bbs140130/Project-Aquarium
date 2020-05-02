module reg8 (reset, CLK, D, Q);
	input reset;
	input CLK;
	input  [7:0]  D;
	output [7:0]  Q;
	reg[7:0] Q;

always @(posedge CLK)
	if (reset)
		Q = 0;
	else
		Q = D;
endmodule



module test_bench;
    reg reset;
    reg CLK;
    reg [7:0] D;

    wire [7:0] Q;

    reg8 test1 (.reset(reset), .CLK(CLK), .D(D), .Q(Q)); 

    initial begin
    $display("8 bit Register");
    $display("Reset | Clock| D| Q");
    reset = 0; #50
    CLK = 0; #50
    D = 8'b00000000; #50
    $display("%1b | %1b | %8b | %8b", reset, CLK, D, Q);

    end


endmodule