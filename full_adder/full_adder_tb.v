`timescale 1ns / 1ps

// ID: 22201089
// Module  : full_adder_tb
// Testbench for full_adder. Tries all 8 input combinations.

module full_adder_tb;

    reg  A, B, Cin;
    wire Sum, Cout;
    integer i;

    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
	 
	   initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;
            $display("A=%b B=%b Cin=%b -> Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
        end
        $finish;
    end

endmodule