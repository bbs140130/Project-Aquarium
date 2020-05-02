module counter (reset, CLK, D, Q, inc, add_or_sub);
	input reset;
	input CLK;
	input inc;
	input add_or_sub;
	input [7:0] D;
	output [7:0] Q;
	
	reg [7:0] Q;

always @(posedge CLK or posedge reset) begin
	if (reset) begin
		Q <= 8'b0;
	end else begin
	    if (add_or_sub) begin
	        if(inc) begin
	            Q <= Q + 8'd1;
	        end
	    end else begin
		Q <= D;
		end
	end
end

endmodule



module test_bench;
    reg reset;
    reg CLK;
    reg inc;
    reg add_or_sub;
    reg [7:0] D;

    wire [7:0] Q;

    counter count1(.reset(reset), .CLK(CLK), .D(D), .Q(Q),
    .inc(inc), .add_or_sub(add_or_sub));

    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("8 bit Register");
    $display("INC|RST|CLK|    D     |     Q");
    add_or_sub = 0;
    reset = 1;
    inc = 0;
    CLK = 0; 
    D = 8'b11011010;
    display;
    
    add_or_sub = 1;
    reset = 0; 
    CLK = 1;
    inc = 1;
    display;
    
    CLK = 0;
    inc = 0;
    display;
    
    CLK = 1;
    inc = 1;
    display;
    
    CLK = 0;
    inc = 0;
    display;
    
    CLK = 1;
    inc = 1;
    display;
    
    add_or_sub = 0;
    display;
    
    CLK = 0; 
    D = 8'b0;
    display;
    
    reset = 1; 
    D = 8'b0;
    display;

    end

    task display;
        #1 $display("%0h  | %0h | %0h | %8b | %8b", 
        inc, reset, CLK, D, Q);
    endtask

endmodule