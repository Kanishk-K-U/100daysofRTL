module BCD_to_Excess3 (
    input [3:0] bcd_in,
    output [9:0] excess3_out
);

    wire [9:0] decoder_out;

    decoder_4to10 decoder (
        .inputs(bcd_in),
        .outputs(decoder_out)
    );

    assign excess3_out[0] = 1'b0; // Bit 0 always 0
    assign excess3_out[1] = 1'b1; // Bit 1 always 1
    assign excess3_out[2] = ~decoder_out[0]; // Bit 2 is the complement of decoder_out[0]
    assign excess3_out[3] = ~decoder_out[1]; // Bit 3 is the complement of decoder_out[1]
    assign excess3_out[4] = ~decoder_out[2]; // Bit 4 is the complement of decoder_out[2]
    assign excess3_out[5] = ~decoder_out[3]; // Bit 5 is the complement of decoder_out[3]
    assign excess3_out[6] = decoder_out[4];  // Bit 6 is same as decoder_out[4]
    assign excess3_out[7] = decoder_out[5];  // Bit 7 is same as decoder_out[5]
    assign excess3_out[8] = decoder_out[6];  // Bit 8 is same as decoder_out[6]
    assign excess3_out[9] = decoder_out[7];  // Bit 9 is same as decoder_out[7]

endmodule

// 4-to-10 decoder module
module decoder_4to10 (
    input [3:0] inputs,
    output [9:0] outputs
);
    wire [15:0] and_terms; 

    assign and_terms[0]  = inputs[0] & inputs[1] & inputs[2] & inputs[3];
    assign and_terms[1]  = inputs[0] & inputs[1] & inputs[2] & ~inputs[3];
    assign and_terms[2]  = inputs[0] & inputs[1] & ~inputs[2] & inputs[3];
    assign and_terms[3]  = inputs[0] & inputs[1] & ~inputs[2] & ~inputs[3];
    assign and_terms[4]  = inputs[0] & ~inputs[1] & inputs[2] & inputs[3];
    assign and_terms[5]  = inputs[0] & ~inputs[1] & inputs[2] & ~inputs[3];
    assign and_terms[6]  = inputs[0] & ~inputs[1] & ~inputs[2] & inputs[3];
    assign and_terms[7]  = inputs[0] & ~inputs[1] & ~inputs[2] & ~inputs[3];
    assign and_terms[8]  = ~inputs[0] & inputs[1] & inputs[2] & inputs[3];
    assign and_terms[9]  = ~inputs[0] & inputs[1] & inputs[2] & ~inputs[3];
    assign and_terms[10] = ~inputs[0] & inputs[1] & ~inputs[2] & inputs[3];
    assign and_terms[11] = ~inputs[0] & inputs[1] & ~inputs[2] & ~inputs[3];
    assign and_terms[12] = ~inputs[0] & ~inputs[1] & inputs[2] & inputs[3];
    assign and_terms[13] = ~inputs[0] & ~inputs[1] & inputs[2] & ~inputs[3];
    assign and_terms[14] = ~inputs[0] & ~inputs[1] & ~inputs[2] & inputs[3];
    assign and_terms[15] = ~inputs[0] & ~inputs[1] & ~inputs[2] & ~inputs[3];
    assign outputs[0] = and_terms[0] | and_terms[1];
    assign outputs[1] = and_terms[2] | and_terms[3];
    assign outputs[2] = and_terms[4] | and_terms[5];
    assign outputs[3] = and_terms[6] | and_terms[7];
    assign outputs[4] = and_terms[8] | and_terms[9];
    assign outputs[5] = and_terms[10] | and_terms[11];
    assign outputs[6] = and_terms[12] | and_terms[13];
    assign outputs[7] = and_terms[14] | and_terms[15];
    assign outputs[8] = and_terms[0] | and_terms[1] | and_terms[4] | and_terms[5] | and_terms[8] | and_terms[9] | and_terms[12] | and_terms[13];
    assign outputs[9] = and_terms[2] | and_terms[3] | and_terms[6] | and_terms[7] | and_terms[10] | and_terms[11] | and_terms[14] | and_terms[15];

endmodule
