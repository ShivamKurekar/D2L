`timescale 1ns/1ps

module tb_slave_64;

    // -------------------------------------------------
    // Parameters
    // -------------------------------------------------
    localparam DATA_WIDTH = 64;

    // -------------------------------------------------
    // DUT signals
    // -------------------------------------------------
    reg  sclk;
    reg  rstn;
    reg  InLine0;
    reg  InLine1;
    reg  CS;

    wire done;
    wire [DATA_WIDTH-1:0] DATA_OUT;

    // -------------------------------------------------
    // Instantiate DUT
    // -------------------------------------------------
    slave #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .sclk     (sclk),
        .rstn     (rstn),
        .InLine0  (InLine0),
        .InLine1  (InLine1),
        .CS       (CS),
        .done     (done),
        .DATA_OUT (DATA_OUT)
    );

    // -------------------------------------------------
    // Clock generation (25 MHz)
    // -------------------------------------------------
    initial sclk = 1'b0;
    always #20 sclk = ~sclk;   // 40 ns period

    // -------------------------------------------------
    // Test data
    // -------------------------------------------------
    reg [63:0] tx_data;

    // -------------------------------------------------
    // Task: send one 2-bit pair (LSB-first)
    // -------------------------------------------------
    task send_pair(input b1, input b0);
    begin
        @(posedge sclk);
        InLine1 = b1;
        InLine0 = b0;
    end
    endtask

    // -------------------------------------------------
    // Stimulus
    // -------------------------------------------------
    integer i;

    initial begin
        // Init
        rstn     = 1'b0;
        CS       = 1'b1;
        InLine0  = 1'b0;
        InLine1  = 1'b0;

        tx_data  = 64'hA5A5_1234_5678_9ABC;

        // Reset
        #50;
        rstn = 1'b1;

        // Start transfer
        @(posedge sclk);
        CS = 1'b0;

        // -------------------------------------------------
        // Send 64 bits = 32 dual-bit cycles
        // LSB first
        // -------------------------------------------------
        for (i = DATA_WIDTH-1; i >= 1; i = i - 2) begin
            send_pair(tx_data[i], tx_data[i-1]);
        end


        // End transfer
        @(posedge sclk);
        CS = 1'b1;

        // Wait for DONE
        wait (done);

        // -------------------------------------------------
        // Check result
        // -------------------------------------------------
        $display("TX DATA = %b", tx_data);
        $display("RX DATA = %b", DATA_OUT);

        if (DATA_OUT === tx_data)
            $display("RESULT : PASS");
        else
            $display("RESULT : FAIL");

        #100;
        $finish;
    end

    // -------------------------------------------------
    // Debug monitor
    // -------------------------------------------------
    always @(negedge sclk) begin
        if (!CS)
            $display("t=%0t  In1=%b In0=%b  partial_data=%h  state=%0d",
                     $time, InLine1, InLine0, dut.data, dut.state);
    end

    // -------------------------------------------------
    // Waveform dump
    // -------------------------------------------------
    initial begin
        $dumpfile("slave_64_tb.vcd");
        $dumpvars(0, tb_slave_64);
    end

endmodule
