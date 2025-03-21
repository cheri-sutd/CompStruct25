/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module multiplier (
        input wire [31:0] a,
        input wire [31:0] b,
        output reg [31:0] out
    );
    logic [31:0] R_7ba87944_i;
    logic [31:0] RR_7ba87944_i;
    logic [31:0] R_58555e9b_j;
    logic [31:0] RR_58555e9b_j;
    logic [31:0] R_48ffcf72_k;
    logic [31:0] RR_48ffcf72_k;
    logic [495:0] M_fa_a;
    logic [495:0] M_fa_b;
    logic [495:0] M_fa_cin;
    logic [495:0] M_fa_s;
    logic [495:0] M_fa_cout;
    
    genvar idx_0_868261255;
    
    generate
        for (idx_0_868261255 = 0; idx_0_868261255 < 496; idx_0_868261255 = idx_0_868261255 + 1) begin: forLoop_idx_0_868261255
            fa fa (
                .a(M_fa_a[idx_0_868261255]),
                .b(M_fa_b[idx_0_868261255]),
                .cin(M_fa_cin[idx_0_868261255]),
                .s(M_fa_s[idx_0_868261255]),
                .cout(M_fa_cout[idx_0_868261255])
            );
        end
    endgenerate
    
    
    logic [8:0] current_row_fa_index;
    logic [8:0] previous_row_fa_index;
    always @* begin
        M_fa_a = 496'h0;
        M_fa_b = 496'h0;
        M_fa_cin = 496'h0;
        out[1'h0] = b[1'h0] & a[1'h0];
        for (RR_7ba87944_i = 0; RR_7ba87944_i < 5'h1f; RR_7ba87944_i = RR_7ba87944_i + 1) begin
      R_7ba87944_i = (1'h1) + RR_7ba87944_i * (1);
            if (R_7ba87944_i == 1'h1) begin
                for (RR_58555e9b_j = 0; RR_58555e9b_j < 5'h1f; RR_58555e9b_j = RR_58555e9b_j + 1) begin
          R_58555e9b_j = (1'h0) + RR_58555e9b_j * (1);
                    M_fa_a[R_58555e9b_j] = a[R_58555e9b_j] & b[1'h1];
                    M_fa_b[R_58555e9b_j] = a[R_58555e9b_j + 1'h1] & b[1'h0];
                    if (R_58555e9b_j == 1'h0) begin
                        M_fa_cin[R_58555e9b_j] = 1'h0;
                    end else begin
                        M_fa_cin[R_58555e9b_j] = M_fa_cout[R_58555e9b_j - 1'h1];
                    end
                end
                out[1'h1] = M_fa_s[1'h0];
                previous_row_fa_index = 1'h0;
                current_row_fa_index = 5'h1f;
            end else begin
                for (RR_48ffcf72_k = 0; RR_48ffcf72_k < 6'h20 - R_7ba87944_i; RR_48ffcf72_k = RR_48ffcf72_k + 1) begin
          R_48ffcf72_k = (0) + RR_48ffcf72_k * (1);
                    M_fa_a[current_row_fa_index + R_48ffcf72_k] = a[R_48ffcf72_k] & b[R_7ba87944_i];
                    M_fa_b[current_row_fa_index + R_48ffcf72_k] = M_fa_s[previous_row_fa_index + 1'h1 + R_48ffcf72_k];
                    if (R_48ffcf72_k == 1'h0) begin
                        M_fa_cin[current_row_fa_index + R_48ffcf72_k] = 1'h0;
                    end else begin
                        M_fa_cin[current_row_fa_index + R_48ffcf72_k] = M_fa_cout[current_row_fa_index + R_48ffcf72_k - 1'h1];
                    end
                end
                previous_row_fa_index = current_row_fa_index;
                current_row_fa_index = current_row_fa_index + (6'h20 - R_7ba87944_i);
                out[R_7ba87944_i] = M_fa_s[previous_row_fa_index];
            end
        end
        M_fa_a[9'h1ef] = a[1'h0] & b[5'h1f];
        M_fa_b[9'h1ef] = M_fa_s[9'h1ee];
        M_fa_cin[9'h1ef] = 1'h0;
        out[5'h1f] = M_fa_s[9'h1ef];
    end
    
    
endmodule