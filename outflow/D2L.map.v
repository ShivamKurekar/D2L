
//
// Verific Verilog Description of module master
//

module master (clk, rstn, out_en, sclk, DL0, DL1, CS);
    input clk /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(4)
    input rstn /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(4)
    input out_en /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(5)
    output sclk /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(6)
    output [3:0]DL0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    output [3:0]DL1 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    output CS /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(8)
    
    wire n25;
    wire n31_2;
    wire [2:0]count;   // /home/shiv/Documents/D2L/master.v(15)
    wire [1:0]data_cycle;   // /home/shiv/Documents/D2L/master.v(18)
    wire [3:0]state;   // /home/shiv/Documents/D2L/master.v(14)
    wire [2:0]n81;
    wire [1:0]n85;
    
    wire n28, n29, n30, n31;
    wire [3:0]next_state;   // /home/shiv/Documents/D2L/master.v(14)
    
    wire \clk~O , n36, n37, n38;
    
    assign DL0[3] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    assign DL0[2] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    assign DL0[1] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    assign DL1[3] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    assign DL1[2] = 1'b0 /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;   // /home/shiv/Documents/D2L/master.v(7)
    assign DL1[1] = 1'b0 /* verific EFX_ATTRIBUTE_CELL_NAME=GND */ ;
    EFX_LUT4 \dlatchrs_113/i1  (.I0(n28), .O(DL0[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'haaaa */ ;   // /home/shiv/Documents/D2L/master.v(136)
    defparam \dlatchrs_113/i1 .LUTMASK = 16'haaaa;
    EFX_LUT4 \dlatchrs_115/i1  (.I0(n29), .O(DL1[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'haaaa */ ;   // /home/shiv/Documents/D2L/master.v(136)
    defparam \dlatchrs_115/i1 .LUTMASK = 16'haaaa;
    EFX_FF \sclk~FF  (.D(n25), .CE(1'b1), .CLK(\clk~O ), .SR(n31_2), 
           .Q(sclk)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/shiv/Documents/D2L/master.v(50)
    defparam \sclk~FF .CLK_POLARITY = 1'b1;
    defparam \sclk~FF .CE_POLARITY = 1'b1;
    defparam \sclk~FF .SR_POLARITY = 1'b0;
    defparam \sclk~FF .D_POLARITY = 1'b1;
    defparam \sclk~FF .SR_SYNC = 1'b1;
    defparam \sclk~FF .SR_VALUE = 1'b0;
    defparam \sclk~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \count[0]~FF  (.D(n81[0]), .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), 
           .Q(count[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/shiv/Documents/D2L/master.v(86)
    defparam \count[0]~FF .CLK_POLARITY = 1'b1;
    defparam \count[0]~FF .CE_POLARITY = 1'b1;
    defparam \count[0]~FF .SR_POLARITY = 1'b1;
    defparam \count[0]~FF .D_POLARITY = 1'b1;
    defparam \count[0]~FF .SR_SYNC = 1'b1;
    defparam \count[0]~FF .SR_VALUE = 1'b0;
    defparam \count[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \count[2]~FF  (.D(n81[2]), .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), 
           .Q(count[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/shiv/Documents/D2L/master.v(86)
    defparam \count[2]~FF .CLK_POLARITY = 1'b1;
    defparam \count[2]~FF .CE_POLARITY = 1'b1;
    defparam \count[2]~FF .SR_POLARITY = 1'b1;
    defparam \count[2]~FF .D_POLARITY = 1'b1;
    defparam \count[2]~FF .SR_SYNC = 1'b1;
    defparam \count[2]~FF .SR_VALUE = 1'b0;
    defparam \count[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_cycle[0]~FF  (.D(n85[0]), .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), 
           .Q(data_cycle[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/shiv/Documents/D2L/master.v(86)
    defparam \data_cycle[0]~FF .CLK_POLARITY = 1'b1;
    defparam \data_cycle[0]~FF .CE_POLARITY = 1'b1;
    defparam \data_cycle[0]~FF .SR_POLARITY = 1'b1;
    defparam \data_cycle[0]~FF .D_POLARITY = 1'b1;
    defparam \data_cycle[0]~FF .SR_SYNC = 1'b1;
    defparam \data_cycle[0]~FF .SR_VALUE = 1'b0;
    defparam \data_cycle[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \count[1]~FF  (.D(n81[1]), .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), 
           .Q(count[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/shiv/Documents/D2L/master.v(86)
    defparam \count[1]~FF .CLK_POLARITY = 1'b1;
    defparam \count[1]~FF .CE_POLARITY = 1'b1;
    defparam \count[1]~FF .SR_POLARITY = 1'b1;
    defparam \count[1]~FF .D_POLARITY = 1'b1;
    defparam \count[1]~FF .SR_SYNC = 1'b1;
    defparam \count[1]~FF .SR_VALUE = 1'b0;
    defparam \count[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \state[0]~FF  (.D(next_state[0]), .CE(1'b1), .CLK(\clk~O ), 
           .SR(rstn), .Q(state[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/shiv/Documents/D2L/master.v(29)
    defparam \state[0]~FF .CLK_POLARITY = 1'b1;
    defparam \state[0]~FF .CE_POLARITY = 1'b1;
    defparam \state[0]~FF .SR_POLARITY = 1'b0;
    defparam \state[0]~FF .D_POLARITY = 1'b1;
    defparam \state[0]~FF .SR_SYNC = 1'b0;
    defparam \state[0]~FF .SR_VALUE = 1'b0;
    defparam \state[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data_cycle[1]~FF  (.D(n85[1]), .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), 
           .Q(data_cycle[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/shiv/Documents/D2L/master.v(86)
    defparam \data_cycle[1]~FF .CLK_POLARITY = 1'b1;
    defparam \data_cycle[1]~FF .CE_POLARITY = 1'b1;
    defparam \data_cycle[1]~FF .SR_POLARITY = 1'b1;
    defparam \data_cycle[1]~FF .D_POLARITY = 1'b1;
    defparam \data_cycle[1]~FF .SR_SYNC = 1'b1;
    defparam \data_cycle[1]~FF .SR_VALUE = 1'b0;
    defparam \data_cycle[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \state[1]~FF  (.D(next_state[1]), .CE(1'b1), .CLK(\clk~O ), 
           .SR(rstn), .Q(state[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/shiv/Documents/D2L/master.v(29)
    defparam \state[1]~FF .CLK_POLARITY = 1'b1;
    defparam \state[1]~FF .CE_POLARITY = 1'b1;
    defparam \state[1]~FF .SR_POLARITY = 1'b0;
    defparam \state[1]~FF .D_POLARITY = 1'b1;
    defparam \state[1]~FF .SR_SYNC = 1'b0;
    defparam \state[1]~FF .SR_VALUE = 1'b0;
    defparam \state[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_LUT4 i93 (.I0(n30), .I1(CS), .I2(n31), .O(CS)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hacac */ ;   // /home/shiv/Documents/D2L/master.v(136)
    defparam i93.LUTMASK = 16'hacac;
    EFX_LUT4 LUT__56 (.I0(count[0]), .I1(count[1]), .I2(count[2]), .O(n25)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8787 */ ;   // /home/shiv/Documents/D2L/master.v(38)
    defparam LUT__56.LUTMASK = 16'h8787;
    EFX_LUT4 LUT__57 (.I0(state[0]), .I1(state[1]), .O(n31_2)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;   // /home/shiv/Documents/D2L/master.v(49)
    defparam LUT__57.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__58 (.I0(state[0]), .I1(data_cycle[0]), .I2(data_cycle[1]), 
            .I3(state[1]), .O(n36)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__58.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__59 (.I0(n36), .I1(count[0]), .O(n81[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;   // /home/shiv/Documents/D2L/master.v(85)
    defparam LUT__59.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__60 (.I0(n36), .I1(count[0]), .I2(count[1]), .I3(count[2]), 
            .O(n81[2])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf40 */ ;   // /home/shiv/Documents/D2L/master.v(85)
    defparam LUT__60.LUTMASK = 16'hbf40;
    EFX_LUT4 LUT__61 (.I0(count[0]), .I1(count[2]), .I2(count[1]), .I3(state[1]), 
            .O(n37)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__61.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__62 (.I0(data_cycle[1]), .I1(n37), .I2(state[0]), .I3(data_cycle[0]), 
            .O(n85[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0b0c */ ;   // /home/shiv/Documents/D2L/master.v(85)
    defparam LUT__62.LUTMASK = 16'h0b0c;
    EFX_LUT4 LUT__63 (.I0(n36), .I1(count[0]), .I2(count[1]), .O(n81[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb4b4 */ ;   // /home/shiv/Documents/D2L/master.v(85)
    defparam LUT__63.LUTMASK = 16'hb4b4;
    EFX_LUT4 LUT__64 (.I0(state[0]), .I1(state[1]), .O(n29)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__64.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__65 (.I0(n29), .I1(data_cycle[0]), .O(n28)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__65.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__66 (.I0(count[0]), .I1(count[2]), .I2(count[1]), .O(n38)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__66.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__67 (.I0(out_en), .I1(n38), .I2(state[1]), .I3(state[0]), 
            .O(next_state[0])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h33ca */ ;   // /home/shiv/Documents/D2L/master.v(135)
    defparam LUT__67.LUTMASK = 16'h33ca;
    EFX_LUT4 LUT__68 (.I0(n37), .I1(data_cycle[0]), .I2(data_cycle[1]), 
            .I3(state[0]), .O(n85[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00f8 */ ;   // /home/shiv/Documents/D2L/master.v(85)
    defparam LUT__68.LUTMASK = 16'h00f8;
    EFX_LUT4 LUT__69 (.I0(n38), .I1(state[0]), .I2(state[1]), .O(next_state[1])) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7878 */ ;   // /home/shiv/Documents/D2L/master.v(135)
    defparam LUT__69.LUTMASK = 16'h7878;
    EFX_LUT4 LUT__78 (.I0(n31_2), .O(n30)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;
    defparam LUT__78.LUTMASK = 16'h5555;
    EFX_LUT4 LUT__79 (.I0(n29), .O(n31)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5555, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;
    defparam LUT__79.LUTMASK = 16'h5555;
    EFX_GBUFCE CLKBUF__0 (.CE(1'b1), .I(clk), .O(\clk~O )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_GBUFCE, CE_POLARITY=1'b1 */ ;
    defparam CLKBUF__0.CE_POLARITY = 1'b1;
    
endmodule

//
// Verific Verilog Description of module EFX_LUT4_5ab02591_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5ab02591_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5ab02591_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_5ab02591_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_15
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_5ab02591_16
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_GBUFCE_5ab02591_0
// module not written out since it is a black box. 
//

