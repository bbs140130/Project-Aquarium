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


module reg1 (reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);
  input reset;
  input CLK;
  input [7:0] D_tank_cleanliness;
  output [7:0] Q_tank_cleanliness;
  
  reg [7:0] Q_tank_cleanliness;

always @(posedge CLK or posedge reset) begin
  if (reset) begin
    Q_tank_cleanliness <= 8'b0;
  end else begin
    Q_tank_cleanliness <= D_tank_cleanliness;
  end
end

endmodule

module reg2 (reset, CLK, D_tank_temperature, Q_tank_temperature);
    input reset;
    input CLK;
    input [7:0] D_tank_temperature;
    output [7:0] Q_tank_temperature;
    
    reg [7:0] Q_tank_temperature;

always @(posedge CLK or posedge reset) begin
    if (reset) begin
        Q_tank_temperature <= 8'b0;
    end else begin
        Q_tank_temperature <= D_tank_temperature;
    end
end

endmodule

module reg3 (reset, CLK, D_tank_food_storage, Q_tank_food_storage);
    input reset;
    input CLK;
    input [7:0] D_tank_food_storage;
    output [7:0] Q_tank_food_storage;
    
    reg [7:0] Q_tank_food_storage;

always @(posedge CLK or posedge reset) begin
    if (reset) begin
        Q_tank_food_storage <= 8'b0;
    end else begin
        Q_tank_food_storage <= D_tank_food_storage;
    end
end

endmodule

module reg4 (reset, CLK, D_tank_saltiness, Q_tank_saltiness);
    input reset;
    input CLK;
    input [7:0] D_tank_saltiness;
    output [7:0] Q_tank_saltiness;
    
    reg [7:0] Q_tank_saltiness;

always @(posedge CLK or posedge reset) begin
    if (reset) begin
        Q_tank_saltiness <= 8'b0;
    end else begin
        Q_tank_saltiness <= D_tank_saltiness;
    end
end

endmodule




//----------------------------------------------------------------------------------------------//----------------------------------------------------------------------------------------------//----------------------------------------------------------------------------------------------//----------------------------------------------------------------------------------------------//----------------------------------------------------------------------------------------------//----------------------------------------------------------------------------------------------



module test_bench;
  //DECLARING ALL VARIABLES

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

    // Mux variables and test function-------------------
     reg [4:0] select;

     reg [7:0] input0;

     reg [7:0] input1;

     reg [7:0] input2;

     reg [7:0] input3;

     reg [7:0] input4;

     reg [7:0] input5;

     reg [7:0] input6;

     reg [7:0] reg_input2_first;
     reg [7:0] reg_input2_second;
     reg [7:0] reg_input2_third;
     reg [7:0] reg_input2_fourth;
     reg [7:0] reg_input2_fifth;

     reg [7:0] reg_input3_first;
     reg [7:0] reg_input3_second;
     reg [7:0] reg_input3_third;
     reg [7:0] reg_input3_fourth;
     reg [7:0] reg_input3_fifth;

     reg [7:0] reg_input4_first;
     reg [7:0] reg_input4_second;
     reg [7:0] reg_input4_third;
     reg [7:0] reg_input4_fourth;
     reg [7:0] reg_input4_fifth;

     reg [7:0] reg_input5_first;
     reg [7:0] reg_input5_second;
     reg [7:0] reg_input5_third;
     reg [7:0] reg_input5_fourth;
     reg [7:0] reg_input5_fifth;

     wire[7:0] out;

     mux test2(.out(out), .select(select), .input0(input0), .input1(input1), .input2(input2), .input3(input3), .input4(input4), .input5(input5), .input6(input6));


    // Four Register variables and test functions-------------------
    reg reset;
    reg CLK;
    reg [7:0] D_tank_cleanliness;
    reg [7:0] D_tank_temperature;
    reg [7:0] D_tank_food_storage;
    reg [7:0] D_tank_saltiness;

    wire [7:0] Q_tank_cleanliness;
    wire [7:0] Q_tank_temperature;
    wire [7:0] Q_tank_food_storage;
    wire [7:0] Q_tank_saltiness;


    reg1 Reg_tank_cleanliness(.reset(reset), .CLK(CLK), .D_tank_cleanliness(D_tank_cleanliness), .Q_tank_cleanliness(Q_tank_cleanliness));

    reg2 Reg_tank_temperature(.reset(reset), .CLK(CLK), .D_tank_temperature(D_tank_temperature), .Q_tank_temperature(Q_tank_temperature));

    reg3 Reg_tank_food_storage(.reset(reset), .CLK(CLK), .D_tank_food_storage(D_tank_food_storage), .Q_tank_food_storage(Q_tank_food_storage));

    reg4 Reg_tank_saltiness(.reset(reset), .CLK(CLK), .D_tank_saltiness(D_tank_saltiness), .Q_tank_saltiness(Q_tank_saltiness));

    //-------------------------------------------------------------------------------------------


    initial begin
      // 4x16 Decoder TEST
      d_in = 4'b1111;#50;
        mux_input_0 = d_out;
        $display("mux_input_0: %4b", mux_input_0);


      d_in = 4'b0000; #50;
        mux_input_1 = d_out;
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

$display("8 bit Register");
        $display("Register 1: Tank Cleanliness");

        $display("RST|CLK|    D     |     Q");
        reset = 1; 
        CLK = 0; 
        D_tank_cleanliness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        reg_input2_first = Q_tank_cleanliness;

        reset = 0; 
        CLK = 0; 
        D_tank_cleanliness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        reg_input2_second = Q_tank_cleanliness;

        CLK = 1; 
        D_tank_cleanliness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        reg_input2_third = Q_tank_cleanliness;

        CLK = 0; 
        D_tank_cleanliness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        reg_input2_fourth = Q_tank_cleanliness;

        reset = 1; 
        D_tank_cleanliness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        reg_input2_fifth = Q_tank_cleanliness;




        $display("------------------------------------------------");
          $display("Register 2: Tank Temperature");

    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D_tank_temperature = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);
        reg_input3_first = Q_tank_temperature;
    
    reset = 0; 
    CLK = 0; 
    D_tank_temperature = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
        reg_input3_second = Q_tank_temperature;

    CLK = 1; 
    D_tank_temperature = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
        reg_input3_third = Q_tank_temperature;

    CLK = 0; 
    D_tank_temperature = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
        reg_input3_fourth = Q_tank_temperature;

    reset = 1; 
    D_tank_temperature = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);
      reg_input3_fifth = Q_tank_temperature;


        $display("------------------------------------------------");
          $display("Register 3: Food Shortage");

    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D_tank_food_storage = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
        reg_input4_first = Q_tank_food_storage;


    reset = 0; 
    CLK = 0; 
    D_tank_food_storage = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
        reg_input4_second = Q_tank_food_storage;
    CLK = 1; 
    D_tank_food_storage = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
        reg_input4_third = Q_tank_food_storage;


    CLK = 0; 
    D_tank_food_storage = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
        reg_input4_fourth = Q_tank_food_storage;


    reset = 1; 
    D_tank_food_storage = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage); 
        reg_input4_fifth = Q_tank_food_storage;

        $display("------------------------------------------------");
  $display("Register 4: Tank Saltiness");

    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D_tank_saltiness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness); 
        reg_input5_first = Q_tank_saltiness;



    
    reset = 0; 
    CLK = 0; 
    D_tank_saltiness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
        reg_input5_second = Q_tank_saltiness;


    CLK = 1; 
    D_tank_saltiness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
        reg_input5_third = Q_tank_saltiness;


    CLK = 0; 
    D_tank_saltiness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
        reg_input5_fourth = Q_tank_saltiness;

    reset = 1; 
    D_tank_saltiness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness); 
        reg_input5_fifth = Q_tank_saltiness;



      $display("=====================================");
      //Now we have 5 outputs for each register.
      //These 5 outputs are based on different reset and clock values

      //For example, for register 1, we have five Q values that are potential inputs for mux. These values are stored in reg_input1_fifth, reg_input1_seond, reg_input1_third, reg_input1_fourth, reg_input1_fifth

      //We need to pick the right one based on clock value and reset value. For now, I'll pick first for all registers


         #100
      input0 = 8'b00000000; //No input
      input1 = 8'b00000010; //Here's where the Counter output should go to
      input2 = reg_input1_first;
      input3 = reg_input2_first;
      input4 = reg_input3_first;
      input5 = reg_input4_first;
      input6 = 8'bxxxxxxxx;//This is the reset value for mux should go to

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
