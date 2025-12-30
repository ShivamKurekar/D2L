`timescale 1ns/1ps

module tb_slave;

    // -------------------------------------------------
    // Parameters
    // -------------------------------------------------
    localparam DATA_WIDTH = 8;

    // -------------------------------------------------
    // DUT signals
    // -------------------------------------------------
    reg  sclk;
    reg  rstn;
    reg  InLine0;
    reg  InLine1;
    reg  CS;

    // -------------------------------------------------
    // Instantiate DUT
    // -------------------------------------------------
    slave #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .sclk    (sclk),
        .rstn    (rstn),
        .InLine0 (InLine0),
        .InLine1 (InLine1),
        .CS      (CS)
    );

    // -------------------------------------------------
    // Clock generation (25 MHz for clarity)
    // -------------------------------------------------
    initial sclk = 1'b0;
    always #40 sclk = ~sclk;   // 40 ns period

    // -------------------------------------------------
    // Task to send one dual-bit cycle
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
    initial begin
        // Init
        rstn     = 1'b0;
        CS       = 1'b1;
        InLine0  = 1'b0;
        InLine1  = 1'b0;

        // Reset
        #50;
        rstn = 1'b1;

        // -------------------------------------------------
        // Send 8-bit data: 1010_0101
        // Bit order (LSB first):
        // Cycle 1: bit1 bit0 = 0 1
        // Cycle 2: bit3 bit2 = 0 1
        // Cycle 3: bit5 bit4 = 1 0
        // Cycle 4: bit7 bit6 = 1 0
        // -------------------------------------------------

        @(posedge sclk);
        CS = 1'b0;  // select slave

        send_pair(1'b1, 1'b0); // cycle 4
        send_pair(1'b0, 1'b1); // cycle 3
        send_pair(1'b1, 1'b0); // cycle 2
        send_pair(1'b0, 1'b1); // cycle 1

        @(posedge sclk);
        CS = 1'b1;  // end transfer

        // Wait and finish
        #200;
        $display("Received data = %b (expected 10011001)", dut.data);
        $finish;
    end

    // -------------------------------------------------
    // Monitor
    // -------------------------------------------------
    always @(negedge sclk) begin
        if (!CS)
            $display("t=%0t InLine1=%b InLine0=%b data=%b state=%0d",
                     $time, InLine1, InLine0, dut.data, dut.state);
    end

    // -------------------------------------------------
    // Dump waveform
    // -------------------------------------------------
    initial begin
        $dumpfile("slave_tb.vcd");
        $dumpvars(0, tb_slave);
    end

endmodule
