`timescale 1ns/1ps

module tb_D2L;

    // -------------------------------------------------
    // DUT signals
    // -------------------------------------------------
    reg         clk;
    reg         rstn;
    reg         out_en;
    reg [63:0]  DATA_IN;

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

    task TX;
    input [63:0] tx_DATA;
    begin
        // Init
        rstn    = 1'b0;
        out_en = 1'b0;
        DATA_IN = 64'd0;

        tx_data = tx_DATA;

        // Apply reset
        #100;
        rstn = 1'b1;

        // -------------------------------------------------
        // Launch transaction
        // -------------------------------------------------
        @(posedge clk);
        DATA_IN = tx_data;  // width + payload
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


    end
    endtask
    initial begin
        TX(64'h9F3A_7C21_BD84_5E62);
        TX(64'h14E9_A6D0_3B7C_8F51);
        TX(64'hC8D2_4F91_0A6B_E357);
        TX(64'h5A1C_EB90_7743_2D6F);
        TX(64'hE3F8_1A4D_9C20_6B75);
        TX(64'h07B4_92DE_F1C8_A563);
        TX(64'hB6D0_3F5A_98C1_E274);
        TX(64'h2C97_4E6A_1D85_FB30);
        TX(64'hF8A1_5D39_6C0E_B742);
        TX(64'h4D63_B7F0_28E9_1C5A);
        TX(64'hA9E5_2C1B_7F60_D384);
        TX(64'h1F74_8B2E_C905_6DA3);
        TX(64'hD37A_0E5F_149C_B826);
        TX(64'h6E90_C41B_FD75_2A38);
        TX(64'h83B5_6A9F_0D24_EC71);
        TX(64'hF2C1_7D48_9A05_B36E);        

        $finish;
    end

    // -------------------------------------------------
    // Optional monitor (for debug)
    // -------------------------------------------------
    // always @(posedge clk) begin
    //     if (DONE)
    //         $display("t=%0t DONE asserted", $time);
    // end

    // -------------------------------------------------
    // Waveform dump
    // -------------------------------------------------
    initial begin
        $dumpfile("D2L_tb.vcd");
        $dumpvars(0, tb_D2L);
    end

endmodule