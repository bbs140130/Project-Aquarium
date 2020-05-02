module reg8 (reset, CLK, D, Q);
	input reset;
	input CLK;
	input [7:0] D;
	output [7:0] Q;
	
	reg [7:0] Q;

always @(posedge CLK or posedge reset) begin
	if (reset) begin
		Q <= 8'b0;
	end else begin
		Q <= D;
	end
end

endmodule



module test_bench;
    reg reset;
    reg CLK;
    reg [7:0] D;

    wire [7:0] Q;

    reg8 test1(.reset(reset), .CLK(CLK), .D(D), .Q(Q));

    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("8 bit Register");
    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D = 8'b11111111;
    display;
    
    reset = 0; 
    CLK = 0; 
    D = 8'b11111111;
    display;
    
    CLK = 1; 
    D = 8'b11111111;
    display;
    
    CLK = 0; 
    D = 8'b0;
    display;
    
    reset = 1; 
    D = 8'b0;
    display;

    end

    task display;
        #1 $display(" %0h | %0h | %8b | %8b",
        reset, CLK, D, Q);
    endtask

endmodule
