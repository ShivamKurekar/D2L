`timescale 1ns/1ps

module tb_D2L;

    // -------------------------------------------------
    // DUT signals
    // -------------------------------------------------
    reg         clk;
    reg         rstn;
    reg         out_en;
    reg [70:0]  DATA_IN;

    wire        DONE;
    wire [63:0] DATA_OUT;

    // -------------------------------------------------
    // Instantiate DUT
    // -------------------------------------------------
    D2L dut (
        .clk      (clk),
        .rstn     (rstn),
        .out_en   (out_en),
        .DATA_IN  (DATA_IN),
        .DONE     (DONE),
        .DATA_OUT (DATA_OUT)
    );

    // -------------------------------------------------
    // Clock generation (100 MHz)
    // -------------------------------------------------
    initial clk = 1'b0;
    always #5 clk = ~clk;   // 10 ns period

    // -------------------------------------------------
    // Test vector
    // -------------------------------------------------
    reg [63:0] tx_data;

    // -------------------------------------------------
    // Stimulus
    // -------------------------------------------------
    initial begin
        // Init
        rstn    = 1'b0;
        out_en = 1'b0;
        DATA_IN = 71'd0;

        tx_data = 64'hA5A5_1234_5678_9ABC;

        // Apply reset
        #100;
        rstn = 1'b1;

        // -------------------------------------------------
        // Launch transaction
        // -------------------------------------------------
        @(posedge clk);
        DATA_IN = {7'd64, tx_data};  // width + payload
        out_en  = 1'b1;

        @(posedge clk);
        out_en  = 1'b0;              // one-cycle pulse

        // -------------------------------------------------
        // Wait for completion
        // -------------------------------------------------
        wait (DONE);

        // -------------------------------------------------
        // Check result
        // -------------------------------------------------
        $display("--------------------------------------------------");
        $display("TX DATA : %h", tx_data);
        $display("RX DATA : %h", DATA_OUT);

        if (DATA_OUT === tx_data)
            $display("RESULT  : PASS");
        else
            $display("RESULT  : FAIL");

        $display("--------------------------------------------------");

        #100;
        $finish;
    end

    // -------------------------------------------------
    // Optional monitor (for debug)
    // -------------------------------------------------
    always @(posedge clk) begin
        if (DONE)
            $display("t=%0t DONE asserted", $time);
    end

    // -------------------------------------------------
    // Waveform dump
    // -------------------------------------------------
    initial begin
        $dumpfile("D2L_tb.vcd");
        $dumpvars(0, tb_D2L);
    end

endmodule