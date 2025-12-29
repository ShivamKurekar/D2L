`timescale 1ns/1ps

module tb_master;

    // DUT signals
    reg  clk;
    reg  rstn;
    reg  out_en;
    reg [70:0] data;
    wire sclk;
    wire DataLine0;
    wire DataLine1;
    wire CS;

    // Instantiate DUT
    master dut (
        .clk   (clk),
        .rstn  (rstn),
        .out_en(out_en),
        .data(data),
        .sclk  (sclk),
        .DataLine0   (DataLine0),
        .DataLine1   (DataLine1),
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

        // data = {7'd8, 56'd95, 8'b0101_1010};
        // data = {7'd16, 48'd0, 16'b1010_1100_0110_1001};
        // data = {7'd24, 40'd0, 24'b11001010_01101100_10101010};
        // data = {7'd32, 32'd0, 32'hA5C3_7F2E};
        // data = {7'd48, 16'd0, 48'h1234_5678_ABCD};
        // data = {7'd64, 64'hFEDC_BA98_7654_3210};



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
        #4000;
        // if (CS == 1)
        $finish;
    end

    // -------------------------------------------------
    // Optional monitor (console)
    // -------------------------------------------------
    initial begin
        $display("Time\tCS\tSCLK\tDL0\tDL1\tSTATE");
    end
    always @(posedge sclk)
        $display("%0t\t%b\t%b\t%b\t%b\t%0d",
                 $time, CS, sclk, DataLine0, DataLine1, dut.state);
    // -------------------------------------------------
    // Dump waves (for GTKWave / Vivado)
    // -------------------------------------------------
    initial begin
        $dumpfile("master_tb.vcd");
        $dumpvars(0, tb_master);
    end

endmodule
