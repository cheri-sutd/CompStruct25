/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module compare (
        input wire z,
        input wire v,
        input wire n,
        input wire [5:0] alufn,
        output reg [0:0] cmp
    );
    always @* begin
        
        case (alufn[2'h2:1'h1])
            2'h1: begin
                cmp = z;
            end
            2'h2: begin
                cmp = n ^ v;
            end
            2'h3: begin
                cmp = z | (n ^ v);
            end
            default: begin
                cmp = 4'h5;
            end
        endcase
    end
    
    
endmodule