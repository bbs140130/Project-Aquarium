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


module test_bench;

    // Decoder 4x16 variables and test function
    wire [15:0] d_out;
    reg [3:0] d_in;
    
    dec_4x16 test1 (.d_out(d_out), .d_in(d_in)); 

    initial begin


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