`timescale 1ns/1ps

module tb_master;

    // DUT signals
    reg  clk;
    reg  rstn;
    reg  out_en;
    wire sclk;
    wire DL0;
    wire DL1;
    wire CS;

    // Instantiate DUT
    master dut (
        .clk   (clk),
        .rstn  (rstn),
        .out_en(out_en),
        .sclk  (sclk),
        .DL0   (DL0),
        .DL1   (DL1),
        .CS    (CS)
    );

    // -------------------------------------------------
    // Clock generation: 100 MHz (10 ns period)
    // -------------------------------------------------
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // -------------------------------------------------
    // Stimulus
    // -------------------------------------------------
    initial begin
        // Init
        rstn   = 1'b0;
        out_en = 1'b0;

        // Hold reset
        #30;
        rstn = 1'b1;
        #40;

        out_en = 1'b1;
        #20;
        out_en = 1'b0;
        #500;

        

        // // Wait few clocks
        // #40;

        // // Trigger transmission
        // out_en = 1'b1;
        // #10;
        // out_en = 1'b0;

        // // Let transaction complete
        // #500;

        // // Trigger again
        // out_en = 1'b1;
        // #10;
        // out_en = 1'b0;

        // #500;
        $finish;
    end

    // -------------------------------------------------
    // Optional monitor (console)
    // -------------------------------------------------
    initial begin
        $display("Time\tCS\tSCLK\tDL0\tDL1\tSTATE");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%0d",
                 $time, CS, sclk, DL0, DL1, dut.state);
    end

    // -------------------------------------------------
    // Dump waves (for GTKWave / Vivado)
    // -------------------------------------------------
    initial begin
        $dumpfile("master_tb.vcd");
        $dumpvars(0, tb_master);
    end

endmodule
