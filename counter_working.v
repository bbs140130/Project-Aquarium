module Counter8Bit(
    input clk,
    input reset,
    input reverse,
    output [7:0] count
);

endmodule

module tb_counter;

    reg clk, reset, reverse;
    wire [7:0] count;

    Counter8Bit dut(clk, reset, reverse, count);

    initial 
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);

        zeroInput();
        #1
        countTo(255);
        assertEquals8(count, 255);
        #1
        reverse <= 1;
        countTo(100);
        assertEquals8(count, 155);

        #1
        reset <= 1;
        countTo(10);
        #1
        assertEquals8(count, 0);

        #1
        $finish();
    end

    task countTo;
        input [7:0] number;
        integer i;
    begin
      for (i = 0; i < number; i=i+1) begin
            #1 clk <= 1;
            #1 clk <= 0;
        end
    end
    endtask

    task zeroInput;
    begin
        clk <= 0;
        reset <= 0;
        reverse <= 0;
    end
    endtask

    task assertEquals8;
        input [7:0] val;
        input [7:0] eq;
    begin
        if (val == eq) $display("[TEST][PASSED]"); 
        else $display("[TEST][FAILED] Got %04b ! expected %04b", val, eq);
    end
    endtask

endmodule
