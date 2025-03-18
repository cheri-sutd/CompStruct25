/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module rom_Output (
        input wire [5:0] address,
        output reg [31:0] element
    );
    logic [31:0] out;
    always @* begin
        
        case (address)
            1'h0: begin
                out = 32'h1e;
            end
            1'h1: begin
                out = 32'h80000000;
            end
            2'h2: begin
                out = 32'h19;
            end
            2'h3: begin
                out = 32'h7fffffff;
            end
            3'h4: begin
                out = 32'h80000100;
            end
            3'h5: begin
                out = 32'h54;
            end
            3'h6: begin
                out = 32'h0;
            end
            3'h7: begin
                out = 32'h6aaaaaaa;
            end
            4'h8: begin
                out = 32'h0;
            end
            4'h9: begin
                out = 32'h0;
            end
            4'ha: begin
                out = 32'h66;
            end
            4'hb: begin
                out = 32'h4a;
            end
            4'hc: begin
                out = 32'hffffffff;
            end
            4'hd: begin
                out = 32'h3f;
            end
            4'he: begin
                out = 32'h56;
            end
            4'hf: begin
                out = 32'hffffffff;
            end
            5'h10: begin
                out = 32'hcc;
            end
            5'h11: begin
                out = 32'hcc;
            end
            5'h12: begin
                out = 32'h80000000;
            end
            5'h13: begin
                out = 32'ha00000b0;
            end
            5'h14: begin
                out = 32'h64;
            end
            5'h15: begin
                out = 32'h1;
            end
            5'h16: begin
                out = 32'hf9000000;
            end
            5'h17: begin
                out = 32'h1;
            end
            5'h18: begin
                out = 32'h0;
            end
            5'h19: begin
                out = 32'h1;
            end
            5'h1a: begin
                out = 32'h0;
            end
            5'h1b: begin
                out = 32'h0;
            end
            5'h1c: begin
                out = 32'h1;
            end
            5'h1d: begin
                out = 32'h0;
            end
            5'h1e: begin
                out = 32'h2;
            end
            5'h1f: begin
                out = 32'h1;
            end
            default: begin
                out = 32'h0;
            end
        endcase
        element = out;
    end
    
    
endmodule