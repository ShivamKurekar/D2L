module D2L (
    input        clk,
    input        rstn,

    input        out_en,          // one-cycle start pulse
    input [70:0] DATA_IN,         // {width[6:0], payload[63:0]}

    output reg        DONE,        // one-cycle completion pulse
    output     [63:0] DATA_OUT
);

    /* ---------------- Internal interconnect ---------------- */
    wire sclk;
    wire CS;
    wire DL0;
    wire DL1;

    wire slave_done;
    wire [63:0] slave_data;

    /* ---------------- Master instance ---------------- */
    master u_master (
        .clk        (clk),
        .rstn       (rstn),
        .out_en     (out_en),
        .data       (DATA_IN),
        .sclk       (sclk),
        .DataLine0  (DL0),
        .DataLine1  (DL1),
        .CS         (CS)
    );

    /* ---------------- Slave instance ---------------- */
    slave #(
        .DATA_WIDTH(64)
    ) u_slave (
        .sclk      (sclk),
        .rstn      (rstn),
        .InLine0   (DL0),
        .InLine1   (DL1),
        .CS        (CS),
        .done      (slave_done),
        .DATA_OUT  (slave_data)
    );

    /* ---------------- DONE pulse generation ---------------- */
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            DONE <= 1'b0;
        else
            DONE <= slave_done;   // one-cycle pulse
    end

    assign DATA_OUT = slave_data;

endmodule
