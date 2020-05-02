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


//--------------------------------------------------------------------------------
module test_bench;
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


    initial begin

        $display("8 bit Register");
        $display("Register 1: Tank Cleanliness");

        $display("RST|CLK|    D     |     Q");
        reset = 1; 
        CLK = 0; 
        D_tank_cleanliness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  

        reset = 0; 
        CLK = 0; 
        D_tank_cleanliness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        
        CLK = 1; 
        D_tank_cleanliness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        
        CLK = 0; 
        D_tank_cleanliness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  
        
        reset = 1; 
        D_tank_cleanliness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_cleanliness, Q_tank_cleanliness);  

    $display("========================================");
  $display("Register 2: Tank Temperature");

    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D_tank_temperature = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
    
    reset = 0; 
    CLK = 0; 
    D_tank_temperature = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
    
    CLK = 1; 
    D_tank_temperature = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
    
    CLK = 0; 
    D_tank_temperature = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);  
    
    reset = 1; 
    D_tank_temperature = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_temperature, Q_tank_temperature);

        $display("========================================");
  $display("Register 3: Food Shortage");

    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D_tank_food_storage = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
    
    reset = 0; 
    CLK = 0; 
    D_tank_food_storage = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
    
    CLK = 1; 
    D_tank_food_storage = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
    
    CLK = 0; 
    D_tank_food_storage = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage);  
    
    reset = 1; 
    D_tank_food_storage = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_food_storage, Q_tank_food_storage); 

        $display("========================================");
  $display("Register 4: Tank Saltiness");

    $display("RST|CLK|    D     |     Q");
    reset = 1; 
    CLK = 0; 
    D_tank_saltiness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
    
    reset = 0; 
    CLK = 0; 
    D_tank_saltiness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
    
    CLK = 1; 
    D_tank_saltiness = 8'b11111111;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
    
    CLK = 0; 
    D_tank_saltiness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness);  
    
    reset = 1; 
    D_tank_saltiness = 8'b0;#50;
        $display(" %0h | %0h | %8b | %8b",reset, CLK, D_tank_saltiness, Q_tank_saltiness); 

    end

endmodule
