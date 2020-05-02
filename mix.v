module mux(out, select, input0, input1, input2, input3, input4, input5, input6);
  input[7:0] input0, input1, input2, input3, input4, input5, input6;
  input [4:0] select;
  output [7:0] out;

  reg [7:0] out;

  always @ (input0 or input1 or input2 or input3 or input4 or input5 or input6 or select) 

  begin
    case(select)
      5'b00000 : out = input0; 

      5'b00001 : out = input1; 

      5'b00010 : out = input2; 

      5'b00100 : out = input3; 

      5'b01000 : out = input4; 

      5'b10000 : out = input5; 

      5'b11111 : out = input6; //this is error mode

      default : out = 8'bx;

    endcase
  end
endmodule



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

module Counter8Bit (clk, reset, reverse, count);

    input clk;
    input reset;
    input reverse;
    output [7:0] count;
    reg [7:0] counter;

always @(posedge clk or posedge reset)
begin
if(reset)
 counter <= 8'h0;
else if(~reverse)
 counter <= count + 8'd1;
else
 counter <= count - 8'd1;
end 
assign count = counter;
endmodule    


module test_bench;

    // Decoder 4x16 variables and test function-------------------
    wire [15:0] d_out;
    reg [3:0] d_in;
    reg [4:0] mux_input_0;
    reg [4:0] mux_input_1;
    reg [4:0] mux_input_2;
    reg [4:0] mux_input_3;
    reg [4:0] mux_input_4;
    reg [4:0] mux_input_5;

   
dec_4x16 test1 (.d_out(d_out), .d_in(d_in)); 
   // Mux vatiables and test function
     reg [4:0] select;

  reg [7:0] input0;

  reg [7:0] input1;

  reg [7:0] input2;

  reg [7:0] input3;

  reg [7:0] input4;

  reg [7:0] input5;

  reg [7:0] input6;

  wire[7:0] out;

    reg clk;
    reg reset;
    reg reverse;
    wire [7:0] count;
    reg [7:0] counter;

  Counter8Bit dut(.clk(clk), .reset(reset), .reverse(reverse), .count(count));

   mux test2(
  .out(out), 
  .select(select), 
  .input0(input0), 
  .input1(count), 
  .input2(input2), 
  .input3(input3), 
  .input4(input4), 
  .input5(input5), 
  .input6(input6));

    initial begin

    clk = 0;
    #5 clk = ~clk;

      // 4x16 Decoder TEST
    d_in = 4'b1111;#50;
      mux_input_0 = d_out;
      $display("mux_input_0: %4b", mux_input_0);

      reset = 1;
      reverse = 0;
    d_in = 4'b0000; #50;
      mux_input_1 = count;
      $display("mux_input_1: %4b", mux_input_1);

    d_in = 4'b0001; #50;
        mux_input_2 = d_out;
      $display("mux_input_2: %4b", mux_input_2);

    d_in = 4'b0010; #50;
        mux_input_3 = d_out;
      $display("mux_input_3: %4b", mux_input_3);

    d_in = 4'b0011; #50;
        mux_input_4 = d_out;
      $display("mux_input_4: %4b", mux_input_4);

    d_in = 4'b0100; #50;
        mux_input_5 = d_out;
      $display("mux_input_5: %4b", mux_input_5);

    $display("=====================================");


   #100
    input0 = 8'b00000001;
    input1 = 8'b00000010;
    input2 = 8'b00000100;
    input3 = 8'b00001000;
    input4 = 8'b00010000;
    input5 = 8'b00100000;
    input6 = 8'b01000000;

    $display("=====================================");
    select = mux_input_0; 
    #50;
    $display("test with mux_input_0: %8b",out);   
    select = mux_input_1; 
    #50;
    $display("test with mux_input_1: %8b",out);
    select = mux_input_2; 
    #50;
    $display("test with mux_input_2: %8b",out);
    select = mux_input_3; 
    #50;
    $display("test with mux_input_3: %8b",out);
    select = mux_input_4; 
    #50;
    $display("test with mux_input_4: %8b",out);
    select = mux_input_5; 
    #50;
    $display("test with mux_input_5: %8b",out);

    end
    
endmodule