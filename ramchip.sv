module ramchip #(
    parameter ADDRESS_SIZE = 64,
    parameter WORD_SIZE = 32
    )(
    input  logic address,  // ram address
    input  logic data_in,  // input data
    input  logic CS,       // chip select
    input  logic WE,       // write enable
    output logic data_out  // output data
    );

    reg [WORD_SIZE-1:0] mem [0:ADDRESS_SIZE-1]; // create memory wordsize wide x address size deep
    
    // output data is continually assigned in this interation
    assign data_out = (!CS && !OE) ? mem[address] : {WORD_SIZE{1'bz}}; 
    
endmodule