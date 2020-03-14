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

// OR gate
module or_gate (a, b, y);

    input a, b;
    output y;
    assign y = a | b;


endmodule

// NOR gate
module nor_gate (a, b, y);
   
    input a, b;
    output y;
    assign y = ~(a | b);
        
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
module fulladder
(
 input x,
 input y,
 input cin,
 
 output A, 
 output cout
 );
 
assign {cout,A} =  cin + y + x;
endmodule

//Subtractor 16-bit

module subtract_16_bit(
input [15:0] a,
input [15:0] b,
output [15:0] sub
);

assign sub = a-b;
endmodule

// 3x8 Decoder
module dec_3x8(a0, a1, a2, d0, d1, d2, d3, d4, d5, d6, d7);
    input a0, a1, a2;
    output d0, d1, d2, d3, d4, d5, d6, d7;
    assign d0=(~a0 & ~a1 & ~a2),
            d1=(~a0 & ~a1 & a2),
            d2=(~a0 & a1 & ~a2),
            d3=(~a0 & a1 & a2),
            d4=(a0 & ~a1 & ~a2),
            d5=(a0 & ~a1 & a2),
            d6=(a0 & a1 & ~a2),
            d7=(a0 & a1 & a2);
endmodule

// 4x16 Decoder
module dec_4x16 (d_out, d_in);

   output [15:0] d_out;
   input [3:0]   d_in;
   parameter tmp = 16'b0000_0000_0000_0001;

assign d_out = (d_in == 4'b0000) ? tmp   :
               (d_in == 4'b0001) ? tmp<<1:
               (d_in == 4'b0010) ? tmp<<2:
               (d_in == 4'b0011) ? tmp<<3:
               (d_in == 4'b0100) ? tmp<<4:
               (d_in == 4'b0101) ? tmp<<5:
               (d_in == 4'b0110) ? tmp<<6:
               (d_in == 4'b0111) ? tmp<<7:
               (d_in == 4'b1000) ? tmp<<8:
               (d_in == 4'b1001) ? tmp<<9:
               (d_in == 4'b1010) ? tmp<<10:
               (d_in == 4'b1011) ? tmp<<11:
               (d_in == 4'b1100) ? tmp<<12:
               (d_in == 4'b1101) ? tmp<<13:
               (d_in == 4'b1110) ? tmp<<14:
               (d_in == 4'b1111) ? tmp<<15: 
               16'bxxxx_xxxx_xxxx_xxxx;

endmodule

// Test Bench
module test_bench;

    wire y, x, w, s, c_half, i, cout, sum;
    reg a, b, c, n, o, t;
    reg e, f, g, h, j, k, cin, l, m;

    reg input1;
    reg input2;
    reg carryin;
 
    wire out;
    wire carryout;
    
    // NOT gate
    not_gate test1(.y(y), .a(a));
    
    // NAND gate
    nand_gate test2(.z(z), .b(b), .c(c));

    // AND gate
    and_gate test3(.y(w), .a(e), .b(f));

    //OR gate
    or_gate test7(.y(i), .a(j), .b(k));
    
    //NOR gate
    nor_gate test8(.y(t), .a(a), .b(b));

    // Half Adder
    half_adder test4(.a(g), .b(h), .s(s), .c(c_half));
    
    //Full Adder
    fulladder uut (.x(input1),.y(input2),.cin(carryin),.A(out),.cout(carryout));
    
    //Subtractor 16-bit
    //subtract_16_bit test9(.a(p), .b(r), .sub(t));

    // Decoder 3x8 variables and test function
    wire d0, d1, d2, d3, d4, d5, d6, d7;
    reg a0, a1, a2;
    
    dec_3x8 test5 (
        .a0(a0), .a1(a1), .a2(a2), .d0(d0), .d1(d1), .d2(d2), 
        .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7)
    );
    
    // Decoder 4x16 variables and test function
    wire [15:0] d_out;
    reg [3:0] d_in;
    
    dec_4x16 test6 (.d_out(d_out), .d_in(d_in));
    
    initial begin
    
    // NOT gate TEST
    $display("NOT Gate");
    a = 1'b0; #50;
    $display("a=%1b, y=%1b", a, y);
    $display("=====================================");
    
    // NAND gate TEST
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

    // AND gate TEST
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
    
    //OR gate TEST
    $display("OR Gate");
    j = 1'b0;
    k = 1'b0; #50;
    $display("j=%1b, k=%1b, i=%1b", j, k, i);
    j = 1'b0;
    k = 1'b1; #50;
    $display("j=%1b, k=%1b, i=%1b", j, k, i);
    j = 1'b1;
    k = 1'b0; #50;
    $display("j=%1b, k=%1b, i=%1b", j, k, i);
    j = 1'b1;
    k = 1'b1; #50;
    $display("j=%1b, k=%1b, i=%1b", j, k, i);
    $display("=====================================");  
    
    //NOR gate TEST
    $display("NOR Gate");
    n = 1'b0;
    o = 1'b0; #50;
        $display("j=%1b, k=%1b, i=%1b", n, o, t);
    n = 1'b0;
    o = 1'b1; #50;
        $display("j=%1b, k=%1b, i=%1b", n, o, t);
    n = 1'b1;
    o = 1'b0; #50;
        $display("j=%1b, k=%1b, i=%1b", n, o, t);
    n = 1'b1;
    o = 1'b1; #50;
        $display("j=%1b, k=%1b, i=%1b", n, o, t);
    $display("=====================================");       


    // Half Adder TEST
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
    
    //Full Adder TEST
    $display("Full Adder");
    input1 = 1'b0;
    input2 = 1'b0; 
    carryin = 1'b0;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);
    input1 = 1'b0;
    input2 = 1'b1; 
    carryin = 1'b0;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);
    input1 = 1'b1;
    input2 = 1'b0; 
    carryin = 1'b0;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);
    input1 = 1'b1;
    input2 = 1'b1; 
    carryin = 1'b0;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);
    input1 = 1'b0;
    input2 = 1'b0; 
    carryin = 1'b1;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);    
    input1 = 1'b0;
    input2 = 1'b1; 
    carryin = 1'b1;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);   
    input1 = 1'b1;
    input2 = 1'b0; 
    carryin = 1'b1;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);   
    input1 = 1'b1;
    input2 = 1'b1; 
    carryin = 1'b1;#50;
    $display("input1=%1b, input2=%1b, carry_in=%1b,sum=%1b, carryout=%1b", input1, input2, carryin, out, carryout);   
    $display("=====================================");
    
    /*//Substractor TEST
    $display("Substractor 16-bit");
    p = 1'b0;
    r = 1'b0; #50;
    $display("l=%1b, m=%1b, carry_in=%1b,sum=%1b, carry=%1b", p, r, sub);
    p = 1'b0;
    r = 1'b1; #50;
    $display("l=%1b, m=%1b, carry_in=%1b,sum=%1b, carry=%1b", p, r, sub);
    p = 1'b1;
    r = 1'b0; #50;
    $display("l=%1b, m=%1b, carry_in=%1b,sum=%1b, carry=%1b", p, r, sub);
    p = 1'b1;
    r = 1'b1; #50;
    $display("l=%1b, m=%1b, carry_in=%1b,sum=%1b, carry=%1b", p, r, sub);
    $display("=====================================");*/
        

    // 3x8 Decoder TEST
    $display("Decoder 3x8");
    $display("a2| a1| a0| d7| d6| d5| d4| d3| d2| d1|d0");
    a0 = 1'b0; 
    a1 = 1'b0;
    a2 = 1'b0; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b0; 
    a1 = 1'b0;
    a2 = 1'b1; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b0; 
    a1 = 1'b1;
    a2 = 1'b0; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b0; 
    a1 = 1'b1;
    a2 = 1'b1; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b1; 
    a1 = 1'b0;
    a2 = 1'b0; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b1; 
    a1 = 1'b0;
    a2 = 1'b1; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b1; 
    a1 = 1'b1;
    a2 = 1'b0; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    a0 = 1'b1; 
    a1 = 1'b1;
    a2 = 1'b1; #50;
    $display("%1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b | %1b",
    a0, a1, a2, d7, d6, d5, d4, d3, d2, d1, d0);
    $display("=====================================");
    
    // 4x16 Decoder TEST
    $display("Decoder 4x16");
    $display("d_in | d_out");
    d_in = 4'b0000; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0001; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0010; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0011; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0100; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0101; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0110; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b0111; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1000; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1001; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1010; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1011; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1100; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1101; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1110; #50;
    $display("%4b | %16b", d_in, d_out);
    d_in = 4'b1111; #50;
    $display("%4b | %16b", d_in, d_out);
    $display("=====================================");
    
    
    end
    
endmodule
