module ramchip #(
    parameter ADDRESS_SIZE = 64,
    parameter WORD_SIZE    = 32
    )(
    input  logic [ADDRESS_SIZE-1:0] address, // ram address
    input  logic [WORD_SIZE-1:0] data_in,    // input data
    input  logic CS,                         // chip select
    input  logic WE,                         // write enable
    input  logic OE,                         // operation error
    output logic [WORD_SIZE-1:0] data_out    // output data
    );
      
    //-------------//  |
    //  WORD_SIZE  //  | ADDRESS_SIZE
    //-------------//  V
    logic [WORD_SIZE-1:0] mem [ADDRESS_SIZE-1:0]; // create memory wordsize wide x address size deep
    
    // output data is continually assigned 
    assign data_out = (!CS && !OE) ? mem[address] : {WORD_SIZE{1'bz}}; 
    
endmodule