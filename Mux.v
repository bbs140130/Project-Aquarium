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



module testbench;

  reg [4:0] select;

  reg [7:0] input0;

  reg [7:0] input1;

  reg [7:0] input2;

  reg [7:0] input3;

  reg [7:0] input4;

  reg [7:0] input5;

  reg [7:0] input6;

  wire[7:0] out;


  mux test1(.out(out), .select(select), .input0(input0), .input1(input1), .input2(input2), .input3(input3), .input4(input4), .input5(input5), .input6(input6))


  initial begin
    #100
    select = 5'b00000;
    input0 = 8'b00000001;
    input1 = 8'b00000010;
    input2 = 8'b00000100;
    input3 = 8'b00001000;
    input4 = 8'b00010000;
    input5 = 8'b00100000;
    input6 = 8'b01000000;

    $display("=====================================");
    #50;
    $display(out)

  end
endmodule










