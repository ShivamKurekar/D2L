// Code for Slave of Dual Data Link (D2L)

module slave #(parameter DATA_WIDTH = 64)(
    input sclk, rstn,
    input InLine0, InLine1,
    input CS, // If CS = 0 RX slave selected
    output reg done,
    output [DATA_WIDTH - 1: 0] DATA_OUT
);

    reg DL0, DL1;
    reg [2:0] state;
    reg [5:0] data_cycle;
    reg [DATA_WIDTH - 1 :0] data;

    localparam DATA_CYCLES = DATA_WIDTH / 2;

    localparam IDLE = 0;
    localparam START_RX = 1;
    localparam DATA_RX = 2;
    localparam END_RX = 3;

    always @(negedge sclk or negedge rstn) begin

        if (!rstn) begin
            state <= IDLE;
            data <= 0;
            done <= 0;
            DL0 <= 0;
            DL1 <= 0;
        end

        else begin

            case (state)
                IDLE: begin
                    done <= 0;
                    data_cycle <= 0;
                    data <= 0;
                    if(!CS)
                        state <= START_RX;
                    else
                        state <= IDLE;
                end

                START_RX: begin
                    data <= 0;
                    done <= 0;
                    DL0 <= InLine0;
                    DL1 <= InLine1;
                    state <= DATA_RX;
                end

                DATA_RX: begin
                    // done <= 0;
                    DL0 <= InLine0;
                    DL1 <= InLine1;
                    // data <= {data[DATA_WIDTH - 2:0], InLine1, InLine0};
                    data <= {data[DATA_WIDTH - 2:0], DL1, DL0};
                    // data <= {DL1, DL0, data[DATA_WIDTH - 1: 2]};
                    // data <= {InLine0, InLine1, data[DATA_WIDTH-1:2]};
                        done <= 0;

                    // Then decide whether this was the last cycle
                    if (data_cycle == DATA_CYCLES - 1) begin
                        data_cycle <= 0;
                        state <= END_RX;
                        done <= 1;
                    end else 
                        data_cycle <= data_cycle + 1;
                end

                END_RX: begin
                    done <= 1;
                    state <= IDLE;
                end


                default : begin
                    state <= IDLE;
                end
            endcase

        end
    end

    assign DATA_OUT = data;

endmodule //slave