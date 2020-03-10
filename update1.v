/*module gates(input a, b, output [6:0]y);
    assign y[6]= a & b; // AND gate
    assign y[5]= a | b; // OR gate
    assign y[4]= ~a; // NOT gate
    assign y[3]= ~(a & b); // NAND gate
    assign y[2]= ~(a | b); // NOR gate
    assign y[1]= a ^ b; // XOR gate
    assign y[0]= ~(a ^ b); // XNOR gate
endmodule*/

// NOT gate
module not_gate(input a, output y);
    
    assign y = ~a;

endmodule

// NAND gate
module nand_gate(input b, input c, output z);
    
    assign z= ~(b & c);

endmodule

// AND gate
module and_gate (a, b, y);
input a, b;
output y;

assign y = a & b;

endmodule

// Half Adder
module half_adder ( a,b,s,c );
output s ;
output c ;
input a ;
input b ;
assign s=a ^ b;
assign c= a & b;
endmodule


module test_bench;

    //wire [6:0]y;
    wire y, x;
    reg a, b, c;
    
    //gates dut(.y(y), .a(a), .b(b));
    not_gate test1(.y(y), .a(a));
    
    nand_gate test2(.z(z), .b(b), .c(c));
    
    initial begin
    
    $display("NOT Gate");
    a = 1'b0; #50;
    $display("a=%1b, y=%1b\n", a, y);
    
    $display("NAND Gate");
    b = 1'b0;
    c = 1'b0; #50;
    $display("b=%1b, c=%1b, y=%1b", b, c, z);
    b = 1'b0;
    c = 1'b1; #50;
    $display("b=%1b, c=%1b, y=%1b", b, c, z);
    b = 1'b1;
    c = 1'b0; #50;
    $display("b=%1b, c=%1b, y=%1b", b, c, z);
    b = 1'b1;
    c = 1'b1; #50;
    $display("b=%1b, c=%1b, y=%1b", b, c, z);
    
    end
    
    
    /*initial begin
    $monitor("a=%1b, b=%1b, y=%1b\n", a, b, y);
    end*/
    
endmodule