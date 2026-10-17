`timescale 1ns / 1ps

// ID: 22201089
// Module  : full_adder
// 1-bit full adder. 

module full_adder(
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout
);

    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule