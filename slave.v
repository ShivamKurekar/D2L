// Code for Slave of Dual Data Link (D2L)

module slave (
    input sclk,
    input InLine0, InLine1,
    input CS // If CS = 0 RX slave selected
);

    reg [2:0] state, next_state;

    localparam IDLE = 0;
    localparam START_RX = 1;
    localparam DATA_RX = 2;
    localparam END_RX = 3;
    // localparam IDLE = 0;


    always @(negedge sclk) begin

        case (state)
            IDLE: begin
                if(CS)
                    state <= IDLE;
                else
                    state <= START_RX
            end

            START_RX
        endcase
    end

endmodule //slave