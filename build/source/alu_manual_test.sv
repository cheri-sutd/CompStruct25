/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alu_manual_test #(
        parameter CLK_FREQ = 24'h989680
    ) (
        input wire clk,
        input wire rst,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        output reg [7:0] led
    );
    localparam E_States_MANUAL_IDLE = 3'h0;
    localparam E_States_MANUAL_STORE16AFIRST = 3'h1;
    localparam E_States_MANUAL_STORE16ALAST = 3'h2;
    localparam E_States_MANUAL_STORE16BFIRST = 3'h3;
    localparam E_States_MANUAL_STORE16BLAST = 3'h4;
    localparam E_States_MANUAL_COMMAND = 3'h5;
    localparam E_States_MANUAL_DISPLAY = 3'h6;
    localparam E_States_AUTO_IDLE = 3'h0;
    localparam E_States_AUTO_NUMA = 3'h1;
    localparam E_States_AUTO_COMMAND = 3'h2;
    localparam E_States_AUTO_NUMB = 3'h3;
    localparam E_States_AUTO_ANSWER = 3'h4;
    localparam E_States_AUTO_ERROR = 3'h5;
    localparam E_States_AUTO_CHECK = 3'h6;
    localparam E_States_AUTO_COMPLETE = 3'h7;
    logic slowclock;
    localparam CLK_FREQ1 = 24'h989680;
    localparam SLOW_CLOCK_DEFAULT_SPEED = 5'h19;
    localparam SEVEN_SEG_DIV = 5'h10;
    logic [5:0] M_roma_address;
    logic [31:0] M_roma_element;
    
    rom_A roma (
        .address(M_roma_address),
        .element(M_roma_element)
    );
    
    
    logic [5:0] M_romb_address;
    logic [31:0] M_romb_element;
    
    rom_B romb (
        .address(M_romb_address),
        .element(M_romb_element)
    );
    
    
    logic [5:0] M_romalu_address;
    logic [5:0] M_romalu_element;
    
    rom_ALUFN romalu (
        .address(M_romalu_address),
        .element(M_romalu_element)
    );
    
    
    logic [5:0] M_romout_address;
    logic [31:0] M_romout_element;
    
    rom_Output romout (
        .address(M_romout_address),
        .element(M_romout_element)
    );
    
    
    logic [31:0] M_alu_a;
    logic [31:0] M_alu_b;
    logic [5:0] M_alu_alufn;
    logic [31:0] M_alu_out;
    logic M_alu_z;
    logic M_alu_v;
    logic M_alu_n;
    
    alu alu (
        .a(M_alu_a),
        .b(M_alu_b),
        .alufn(M_alu_alufn),
        .out(M_alu_out),
        .z(M_alu_z),
        .v(M_alu_v),
        .n(M_alu_n)
    );
    
    
    localparam logic [4:0][0:0] _MP_RISE_1461185015 = {{1'h1, 1'h1, 1'h1, 1'h1, 1'h1}};
    localparam logic [4:0][0:0] _MP_FALL_1461185015 = {{1'h1, 1'h1, 1'h1, 1'h1, 1'h1}};
    logic [4:0] M_io_button_edge_in;
    logic [4:0] M_io_button_edge_out;
    
    genvar idx_0_1461185015;
    
    generate
        for (idx_0_1461185015 = 0; idx_0_1461185015 < 5; idx_0_1461185015 = idx_0_1461185015 + 1) begin: forLoop_idx_0_1461185015
            edge_detector #(
                .RISE(_MP_RISE_1461185015[idx_0_1461185015]),
                .FALL(_MP_FALL_1461185015[idx_0_1461185015])
            ) io_button_edge (
                .clk(clk),
                .in(M_io_button_edge_in[idx_0_1461185015]),
                .out(M_io_button_edge_out[idx_0_1461185015])
            );
        end
    endgenerate
    
    
    localparam logic [4:0][23:0] _MP_CLK_FREQ_1862297445 = {{24'h989680, 24'h989680, 24'h989680, 24'h989680, 24'h989680}};
    localparam _MP_MIN_DELAY_1862297445 = 5'h14;
    localparam _MP_NUM_SYNC_1862297445 = 2'h2;
    logic [4:0] M_io_button_cond_in;
    logic [4:0] M_io_button_cond_out;
    
    genvar idx_0_1862297445;
    
    generate
        for (idx_0_1862297445 = 0; idx_0_1862297445 < 5; idx_0_1862297445 = idx_0_1862297445 + 1) begin: forLoop_idx_0_1862297445
            button_conditioner #(
                .CLK_FREQ(_MP_CLK_FREQ_1862297445[idx_0_1862297445]),
                .MIN_DELAY(_MP_MIN_DELAY_1862297445),
                .NUM_SYNC(_MP_NUM_SYNC_1862297445)
            ) io_button_cond (
                .clk(clk),
                .in(M_io_button_cond_in[idx_0_1862297445]),
                .out(M_io_button_cond_out[idx_0_1862297445])
            );
        end
    endgenerate
    
    
    localparam _MP_RISE_49445457 = 1'h1;
    localparam _MP_FALL_49445457 = 1'h0;
    logic M_slow_clock_edge_in;
    logic M_slow_clock_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_49445457),
        .FALL(_MP_FALL_49445457)
    ) slow_clock_edge (
        .clk(clk),
        .in(M_slow_clock_edge_in),
        .out(M_slow_clock_edge_out)
    );
    
    
    logic [2:0] D_states_d, D_states_q = 3'h0;
    logic [2:0] D_states_auto_d, D_states_auto_q = 3'h0;
    logic [15:0] D_afirsthalf_d, D_afirsthalf_q = 0;
    logic [15:0] D_asecondthalf_d, D_asecondthalf_q = 0;
    logic [15:0] D_bfirsthalf_d, D_bfirsthalf_q = 0;
    logic [15:0] D_bsecondhalf_d, D_bsecondhalf_q = 0;
    logic [5:0] D_alufn_d, D_alufn_q = 0;
    logic [31:0] D_result_d, D_result_q = 32'h0;
    logic [31:0] D_counter_d, D_counter_q = 0;
    logic [4:0] D_speed_pointer_d, D_speed_pointer_q = 5'h19;
    logic D_slow_clock_enable_d, D_slow_clock_enable_q = 1'h0;
    logic D_begin_d, D_begin_q = 1'h0;
    logic [5:0] D_caseCounter_d, D_caseCounter_q = 0;
    logic D_v_d, D_v_q = 1'h0;
    logic D_continue_d, D_continue_q = 1'h1;
    localparam _MP_DIGITS_1694097892 = 3'h4;
    localparam _MP_DIV_1694097892 = 5'h10;
    logic [3:0][3:0] M_seg_values;
    logic [6:0] M_seg_seg;
    logic [3:0] M_seg_sel;
    
    multi_seven_seg #(
        .DIGITS(_MP_DIGITS_1694097892),
        .DIV(_MP_DIV_1694097892)
    ) seg (
        .clk(clk),
        .rst(rst),
        .values(M_seg_values),
        .seg(M_seg_seg),
        .sel(M_seg_sel)
    );
    
    
    localparam _MP_DIGITS_554828171 = 3'h4;
    localparam _MP_LEADING_ZEROS_554828171 = 1'h1;
    logic [13:0] M_decimal_renderer_value;
    logic [3:0][3:0] M_decimal_renderer_digits;
    
    bin_to_dec #(
        .DIGITS(_MP_DIGITS_554828171),
        .LEADING_ZEROS(_MP_LEADING_ZEROS_554828171)
    ) decimal_renderer (
        .value(M_decimal_renderer_value),
        .digits(M_decimal_renderer_digits)
    );
    
    
    always @* begin
        D_afirsthalf_d = D_afirsthalf_q;
        D_asecondthalf_d = D_asecondthalf_q;
        D_bfirsthalf_d = D_bfirsthalf_q;
        D_bsecondhalf_d = D_bsecondhalf_q;
        D_alufn_d = D_alufn_q;
        D_result_d = D_result_q;
        D_begin_d = D_begin_q;
        D_speed_pointer_d = D_speed_pointer_q;
        D_counter_d = D_counter_q;
        D_states_d = D_states_q;
        D_states_auto_d = D_states_auto_q;
        D_slow_clock_enable_d = D_slow_clock_enable_q;
        D_caseCounter_d = D_caseCounter_q;
        D_v_d = D_v_q;
        D_continue_d = D_continue_q;
        
        M_alu_a = {D_afirsthalf_q, D_asecondthalf_q};
        M_alu_b = {D_bfirsthalf_q, D_bsecondhalf_q};
        M_alu_alufn = D_alufn_q;
        D_afirsthalf_d = D_afirsthalf_q;
        D_asecondthalf_d = D_asecondthalf_q;
        D_bfirsthalf_d = D_bfirsthalf_q;
        D_bsecondhalf_d = D_bsecondhalf_q;
        D_alufn_d = D_alufn_q;
        D_result_d = D_result_q;
        D_begin_d = D_begin_q;
        D_speed_pointer_d = D_speed_pointer_q;
        D_counter_d = D_counter_q + 1'h1;
        slowclock = D_counter_q[D_speed_pointer_q];
        D_states_d = D_states_q;
        D_states_auto_d = D_states_auto_q;
        M_io_button_cond_in = io_button[3'h4:1'h0];
        M_io_button_edge_in = M_io_button_cond_out;
        M_slow_clock_edge_in = slowclock;
        D_slow_clock_enable_d = D_slow_clock_enable_q;
        D_caseCounter_d = D_caseCounter_q;
        D_v_d = D_v_q;
        M_roma_address = D_caseCounter_q;
        M_romb_address = D_caseCounter_q;
        M_romalu_address = D_caseCounter_q;
        M_romout_address = D_caseCounter_q;
        D_continue_d = D_continue_q;
        io_led = {D_result_q[5'h1f:5'h18], D_result_q[5'h17:5'h10], D_result_q[3'h7:1'h0]};
        M_decimal_renderer_value = {D_result_q[5'h1f:5'h18], D_result_q[5'h17:5'h10], D_result_q[3'h7:1'h0]};
        led = {1'h0, 1'h0, D_caseCounter_q[3'h5:1'h0]};
        
        case (D_states_q)
            3'h0: begin
                if (M_io_button_edge_out[1'h0] && ~D_begin_q && ~D_slow_clock_enable_q) begin
                    D_begin_d = 1'h1;
                    D_states_d = 3'h1;
                end else begin
                    if (M_io_button_edge_out[1'h1] && D_begin_q) begin
                        D_states_d = 3'h2;
                    end else begin
                        if (M_io_button_edge_out[2'h2] && D_begin_q) begin
                            D_states_d = 3'h3;
                        end else begin
                            if (M_io_button_edge_out[3'h4] && D_begin_q) begin
                                D_states_d = 3'h4;
                            end else begin
                                if (M_io_button_edge_out[2'h3] && D_begin_q) begin
                                    D_states_d = 3'h5;
                                end
                            end
                        end
                    end
                end
            end
            3'h1: begin
                D_afirsthalf_d = {io_dip[1'h1], io_dip[1'h0]};
                D_result_d = {{io_dip[1'h1], io_dip[1'h0]}, 16'h0};
                D_states_d = 3'h0;
            end
            3'h2: begin
                D_asecondthalf_d = {io_dip[1'h1], io_dip[1'h0]};
                D_result_d = {D_afirsthalf_q, io_dip[1'h1], io_dip[1'h0]};
                D_states_d = 3'h0;
            end
            3'h3: begin
                D_bfirsthalf_d = {io_dip[1'h1], io_dip[1'h0]};
                D_result_d = {{io_dip[1'h1], io_dip[1'h0]}, 16'h0};
                D_states_d = 3'h0;
            end
            3'h4: begin
                D_bsecondhalf_d = {io_dip[1'h1], io_dip[1'h0]};
                D_result_d = {D_bfirsthalf_q, io_dip[1'h1], io_dip[1'h0]};
                D_states_d = 3'h0;
            end
            3'h5: begin
                D_alufn_d = io_dip[2'h2][3'h5:1'h0];
                D_states_d = 3'h6;
            end
            3'h6: begin
                D_result_d = M_alu_out;
                D_states_d = 3'h0;
            end
        endcase
        
        case (D_states_auto_q)
            3'h0: begin
                if (M_io_button_edge_out[1'h1] && ~D_begin_q && ~D_slow_clock_enable_q) begin
                    D_slow_clock_enable_d = 1'h1;
                    D_states_auto_d = 3'h1;
                end else begin
                    if (M_io_button_edge_out[1'h1] && D_slow_clock_enable_q && ~D_continue_q) begin
                        if (D_caseCounter_q < 5'h1f) begin
                            D_caseCounter_d = D_caseCounter_q + 1'h1;
                            D_states_auto_d = 3'h1;
                        end else begin
                            D_states_auto_d = 3'h7;
                        end
                    end
                end
            end
            3'h1: begin
                if (M_slow_clock_edge_out) begin
                    D_result_d = M_roma_element;
                    D_afirsthalf_d = M_roma_element[5'h1f:5'h10];
                    D_asecondthalf_d = M_roma_element[4'hf:1'h0];
                    D_states_auto_d = 3'h3;
                end
            end
            3'h3: begin
                if (M_slow_clock_edge_out) begin
                    D_result_d = M_romb_element;
                    D_bfirsthalf_d = M_romb_element[5'h1f:5'h10];
                    D_bsecondhalf_d = M_romb_element[4'hf:1'h0];
                    D_states_auto_d = 3'h2;
                end
            end
            3'h2: begin
                if (M_slow_clock_edge_out) begin
                    D_result_d = {26'h0, M_romalu_element};
                    D_alufn_d = M_romalu_element;
                    D_states_auto_d = 3'h4;
                end
            end
            3'h4: begin
                if (M_slow_clock_edge_out) begin
                    D_result_d = M_alu_out;
                    D_states_auto_d = 3'h5;
                end
            end
            3'h5: begin
                if (M_slow_clock_edge_out) begin
                    if (io_dip[2'h2][3'h7]) begin
                        D_result_d[1'h0] = ~D_result_q[1'h0];
                    end
                    D_states_auto_d = 3'h6;
                end
            end
            3'h6: begin
                if (M_slow_clock_edge_out) begin
                    if (D_result_q == M_romout_element) begin
                        D_result_d = 32'hffffffff;
                        if (D_caseCounter_q < 5'h1f) begin
                            D_caseCounter_d = D_caseCounter_q + 1'h1;
                            D_states_auto_d = 3'h1;
                        end else begin
                            D_states_auto_d = 3'h7;
                        end
                    end else begin
                        D_result_d = 32'hf0f0f0f;
                        D_continue_d = 1'h0;
                        D_states_auto_d = 3'h0;
                    end
                end
            end
            3'h7: begin
                if (M_slow_clock_edge_out) begin
                    D_result_d = 32'h55555555;
                end
            end
        endcase
        M_seg_values = M_decimal_renderer_digits;
        io_segment = ~M_seg_seg;
        io_select = ~M_seg_sel;
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_states_q <= 3'h0;
            D_states_auto_q <= 3'h0;
            D_afirsthalf_q <= 0;
            D_asecondthalf_q <= 0;
            D_bfirsthalf_q <= 0;
            D_bsecondhalf_q <= 0;
            D_alufn_q <= 0;
            D_result_q <= 32'h0;
            D_counter_q <= 0;
            D_speed_pointer_q <= 5'h19;
            D_slow_clock_enable_q <= 1'h0;
            D_begin_q <= 1'h0;
            D_caseCounter_q <= 0;
            D_v_q <= 1'h0;
            D_continue_q <= 1'h1;
        end else begin
            D_states_q <= D_states_d;
            D_states_auto_q <= D_states_auto_d;
            D_afirsthalf_q <= D_afirsthalf_d;
            D_asecondthalf_q <= D_asecondthalf_d;
            D_bfirsthalf_q <= D_bfirsthalf_d;
            D_bsecondhalf_q <= D_bsecondhalf_d;
            D_alufn_q <= D_alufn_d;
            D_result_q <= D_result_d;
            D_counter_q <= D_counter_d;
            D_speed_pointer_q <= D_speed_pointer_d;
            D_slow_clock_enable_q <= D_slow_clock_enable_d;
            D_begin_q <= D_begin_d;
            D_caseCounter_q <= D_caseCounter_d;
            D_v_q <= D_v_d;
            D_continue_q <= D_continue_d;
        end
    end
endmodule