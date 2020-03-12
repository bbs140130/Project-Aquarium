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

module or_gate (a, b, y);

    input a, b;
    output y;
    assign y = a | b;


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

// Full Adder
module full_adder(a,b,cin,sum,cout);
    input [3:0]a,b;
    input cin;
    output wire [3:0]sum;
    output wire cout;
    wire [4:0]temp;
    assign temp=a+b+cin;
    assign sum=temp[3:0];
    assign cout=temp[4];
endmodule

module test_bench;

    //wire [6:0]y;
    wire y, x, w, s, c_half;
    reg a, b, c;
    reg e, f, g, h;
    
    //gates dut(.y(y), .a(a), .b(b));
    not_gate test1(.y(y), .a(a));
    
    nand_gate test2(.z(z), .b(b), .c(c));

    // AND gate
    and_gate test3(.y(w), .a(e), .b(f));

    // Half Adder
    half_adder test4(.a(g), .b(h), .s(s), .c(c_half));
    
    initial begin
    
    $display("NOT Gate");
    a = 1'b0; #50;
    $display("a=%1b, y=%1b", a, y);
    $display("=====================================");

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
    $display("=====================================");

    $display("AND Gate");
    e = 1'b0;
    f = 1'b0; #50;
    $display("e=%1b, f=%1b, w=%1b", e, f, w);
    e = 1'b0;
    f = 1'b1; #50;
    $display("e=%1b, f=%1b, w=%1b", e, f, w);
    e = 1'b1;
    f = 1'b0; #50;
    $display("e=%1b, f=%1b, w=%1b", e, f, w);
    e = 1'b1;
    f = 1'b1; #50;
    $display("e=%1b, f=%1b, w=%1b", e, f, w);
    $display("=====================================");

    $display("Half Adder");
    g = 1'b0;
    h = 1'b0; #50;
    $display("g=%1b, g=%1b, s=%1b, c_half=%1b", g, h, s, c_half);
    g = 1'b0;
    h = 1'b1; #50;
    $display("g=%1b, g=%1b, s=%1b, c_half=%1b", g, h, s, c_half);
    g = 1'b1;
    h = 1'b0; #50;
    $display("g=%1b, g=%1b, s=%1b, c_half=%1b", g, h, s, c_half);
    g = 1'b1;
    h = 1'b1; #50;
    $display("g=%1b, g=%1b, s=%1b, c_half=%1b", g, h, s, c_half);
    $display("=====================================");

    end

   /*initial begin
    $monitor("a=%1b, b=%1b, y=%1b\n", a, b, y);
    end*/

    
endmodule