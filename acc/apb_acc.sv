module apb_acc
#(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
)
(
  input  logic                      HCLK,
  input  logic                      HRESETn,
  input  logic [APB_ADDR_WIDTH-1:0] PADDR,
  input  logic               [31:0] PWDATA,
  input  logic                      PWRITE,
  input  logic                      PSEL,
  input  logic                      PENABLE,
  output logic               [31:0] PRDATA,
  output logic                      PREADY,
  output logic                      PSLVERR
);

  logic                 clk;
//  logic                 start;
//  logic                 done;
  logic [1023:0][15:0]   acc_out;
  logic [1023:0][7:0]   acc_in_A;
  logic [1023:0][7:0]   acc_in_B;
  logic [11:0]          addr;
  logic [31:0]          data;


top_acc
top_acc_i
(
  .clk          (       clk       ),
//  .start        (       start     ),
//  .done         (       done      ),
  .acc_out      (       acc_out   ),
  .acc_in_A     (       acc_in_A  ),
  .acc_in_B     (       acc_in_B  )
);

assign clk = HCLK;
// Adress by word.
assign addr = PADDR[11:2];

  always_ff @(posedge HCLK, negedge HRESETn)
  begin
    if (~HRESETn)
    begin
    // Do nothing
    end

    else
    begin
      if (PSEL && PENABLE && PWRITE)
      begin
        case (addr)
          1:
          begin
            acc_in_A[0] <= PWDATA[7:0];
            acc_in_A[1] <= PWDATA[15:8];
            acc_in_A[2] <= PWDATA[23:16];
            acc_in_A[3] <= PWDATA[31:24];
          end
          2:
          begin
            acc_in_A[4] <= PWDATA[7:0];
            acc_in_A[5] <= PWDATA[15:8];
            acc_in_A[6] <= PWDATA[23:16];
            acc_in_A[7] <= PWDATA[31:24];
          end
          3:
          begin
            acc_in_A[8] <= PWDATA[7:0];
            acc_in_A[9] <= PWDATA[15:8];
            acc_in_A[10] <= PWDATA[23:16];
            acc_in_A[11] <= PWDATA[31:24];
          end
          4:
          begin
            acc_in_A[12] <= PWDATA[7:0];
            acc_in_A[13] <= PWDATA[15:8];
            acc_in_A[14] <= PWDATA[23:16];
            acc_in_A[15] <= PWDATA[31:24];
          end
          5:
          begin
            acc_in_A[16] <= PWDATA[7:0];
            acc_in_A[17] <= PWDATA[15:8];
            acc_in_A[18] <= PWDATA[23:16];
            acc_in_A[19] <= PWDATA[31:24];
          end
          6:
          begin
            acc_in_A[20] <= PWDATA[7:0];
            acc_in_A[21] <= PWDATA[15:8];
            acc_in_A[22] <= PWDATA[23:16];
            acc_in_A[23] <= PWDATA[31:24];
          end
          7:
          begin
            acc_in_A[24] <= PWDATA[7:0];
            acc_in_A[25] <= PWDATA[15:8];
            acc_in_A[26] <= PWDATA[23:16];
            acc_in_A[27] <= PWDATA[31:24];
          end
          8:
          begin
            acc_in_A[28] <= PWDATA[7:0];
            acc_in_A[29] <= PWDATA[15:8];
            acc_in_A[30] <= PWDATA[23:16];
            acc_in_A[31] <= PWDATA[31:24];
          end
          9:
          begin
            acc_in_A[32] <= PWDATA[7:0];
            acc_in_A[33] <= PWDATA[15:8];
            acc_in_A[34] <= PWDATA[23:16];
            acc_in_A[35] <= PWDATA[31:24];
          end
          10:
          begin
            acc_in_A[36] <= PWDATA[7:0];
            acc_in_A[37] <= PWDATA[15:8];
            acc_in_A[38] <= PWDATA[23:16];
            acc_in_A[39] <= PWDATA[31:24];
          end
          11:
          begin
            acc_in_A[40] <= PWDATA[7:0];
            acc_in_A[41] <= PWDATA[15:8];
            acc_in_A[42] <= PWDATA[23:16];
            acc_in_A[43] <= PWDATA[31:24];
          end
          12:
          begin
            acc_in_A[44] <= PWDATA[7:0];
            acc_in_A[45] <= PWDATA[15:8];
            acc_in_A[46] <= PWDATA[23:16];
            acc_in_A[47] <= PWDATA[31:24];
          end
          13:
          begin
            acc_in_A[48] <= PWDATA[7:0];
            acc_in_A[49] <= PWDATA[15:8];
            acc_in_A[50] <= PWDATA[23:16];
            acc_in_A[51] <= PWDATA[31:24];
          end
          14:
          begin
            acc_in_A[52] <= PWDATA[7:0];
            acc_in_A[53] <= PWDATA[15:8];
            acc_in_A[54] <= PWDATA[23:16];
            acc_in_A[55] <= PWDATA[31:24];
          end
          15:
          begin
            acc_in_A[56] <= PWDATA[7:0];
            acc_in_A[57] <= PWDATA[15:8];
            acc_in_A[58] <= PWDATA[23:16];
            acc_in_A[59] <= PWDATA[31:24];
          end
          16:
          begin
            acc_in_A[60] <= PWDATA[7:0];
            acc_in_A[61] <= PWDATA[15:8];
            acc_in_A[62] <= PWDATA[23:16];
            acc_in_A[63] <= PWDATA[31:24];
          end
          17:
          begin
            acc_in_A[64] <= PWDATA[7:0];
            acc_in_A[65] <= PWDATA[15:8];
            acc_in_A[66] <= PWDATA[23:16];
            acc_in_A[67] <= PWDATA[31:24];
          end
          18:
          begin
            acc_in_A[68] <= PWDATA[7:0];
            acc_in_A[69] <= PWDATA[15:8];
            acc_in_A[70] <= PWDATA[23:16];
            acc_in_A[71] <= PWDATA[31:24];
          end
          19:
          begin
            acc_in_A[72] <= PWDATA[7:0];
            acc_in_A[73] <= PWDATA[15:8];
            acc_in_A[74] <= PWDATA[23:16];
            acc_in_A[75] <= PWDATA[31:24];
          end
          20:
          begin
            acc_in_A[76] <= PWDATA[7:0];
            acc_in_A[77] <= PWDATA[15:8];
            acc_in_A[78] <= PWDATA[23:16];
            acc_in_A[79] <= PWDATA[31:24];
          end
          21:
          begin
            acc_in_A[80] <= PWDATA[7:0];
            acc_in_A[81] <= PWDATA[15:8];
            acc_in_A[82] <= PWDATA[23:16];
            acc_in_A[83] <= PWDATA[31:24];
          end
          22:
          begin
            acc_in_A[84] <= PWDATA[7:0];
            acc_in_A[85] <= PWDATA[15:8];
            acc_in_A[86] <= PWDATA[23:16];
            acc_in_A[87] <= PWDATA[31:24];
          end
          23:
          begin
            acc_in_A[88] <= PWDATA[7:0];
            acc_in_A[89] <= PWDATA[15:8];
            acc_in_A[90] <= PWDATA[23:16];
            acc_in_A[91] <= PWDATA[31:24];
          end
          24:
          begin
            acc_in_A[92] <= PWDATA[7:0];
            acc_in_A[93] <= PWDATA[15:8];
            acc_in_A[94] <= PWDATA[23:16];
            acc_in_A[95] <= PWDATA[31:24];
          end
          25:
          begin
            acc_in_A[96] <= PWDATA[7:0];
            acc_in_A[97] <= PWDATA[15:8];
            acc_in_A[98] <= PWDATA[23:16];
            acc_in_A[99] <= PWDATA[31:24];
          end
          26:
          begin
            acc_in_A[100] <= PWDATA[7:0];
            acc_in_A[101] <= PWDATA[15:8];
            acc_in_A[102] <= PWDATA[23:16];
            acc_in_A[103] <= PWDATA[31:24];
          end
          27:
          begin
            acc_in_A[104] <= PWDATA[7:0];
            acc_in_A[105] <= PWDATA[15:8];
            acc_in_A[106] <= PWDATA[23:16];
            acc_in_A[107] <= PWDATA[31:24];
          end
          28:
          begin
            acc_in_A[108] <= PWDATA[7:0];
            acc_in_A[109] <= PWDATA[15:8];
            acc_in_A[110] <= PWDATA[23:16];
            acc_in_A[111] <= PWDATA[31:24];
          end
          29:
          begin
            acc_in_A[112] <= PWDATA[7:0];
            acc_in_A[113] <= PWDATA[15:8];
            acc_in_A[114] <= PWDATA[23:16];
            acc_in_A[115] <= PWDATA[31:24];
          end
          30:
          begin
            acc_in_A[116] <= PWDATA[7:0];
            acc_in_A[117] <= PWDATA[15:8];
            acc_in_A[118] <= PWDATA[23:16];
            acc_in_A[119] <= PWDATA[31:24];
          end
          31:
          begin
            acc_in_A[120] <= PWDATA[7:0];
            acc_in_A[121] <= PWDATA[15:8];
            acc_in_A[122] <= PWDATA[23:16];
            acc_in_A[123] <= PWDATA[31:24];
          end
          32:
          begin
            acc_in_A[124] <= PWDATA[7:0];
            acc_in_A[125] <= PWDATA[15:8];
            acc_in_A[126] <= PWDATA[23:16];
            acc_in_A[127] <= PWDATA[31:24];
          end
          33:
          begin
            acc_in_A[128] <= PWDATA[7:0];
            acc_in_A[129] <= PWDATA[15:8];
            acc_in_A[130] <= PWDATA[23:16];
            acc_in_A[131] <= PWDATA[31:24];
          end
          34:
          begin
            acc_in_A[132] <= PWDATA[7:0];
            acc_in_A[133] <= PWDATA[15:8];
            acc_in_A[134] <= PWDATA[23:16];
            acc_in_A[135] <= PWDATA[31:24];
          end
          35:
          begin
            acc_in_A[136] <= PWDATA[7:0];
            acc_in_A[137] <= PWDATA[15:8];
            acc_in_A[138] <= PWDATA[23:16];
            acc_in_A[139] <= PWDATA[31:24];
          end
          36:
          begin
            acc_in_A[140] <= PWDATA[7:0];
            acc_in_A[141] <= PWDATA[15:8];
            acc_in_A[142] <= PWDATA[23:16];
            acc_in_A[143] <= PWDATA[31:24];
          end
          37:
          begin
            acc_in_A[144] <= PWDATA[7:0];
            acc_in_A[145] <= PWDATA[15:8];
            acc_in_A[146] <= PWDATA[23:16];
            acc_in_A[147] <= PWDATA[31:24];
          end
          38:
          begin
            acc_in_A[148] <= PWDATA[7:0];
            acc_in_A[149] <= PWDATA[15:8];
            acc_in_A[150] <= PWDATA[23:16];
            acc_in_A[151] <= PWDATA[31:24];
          end
          39:
          begin
            acc_in_A[152] <= PWDATA[7:0];
            acc_in_A[153] <= PWDATA[15:8];
            acc_in_A[154] <= PWDATA[23:16];
            acc_in_A[155] <= PWDATA[31:24];
          end
          40:
          begin
            acc_in_A[156] <= PWDATA[7:0];
            acc_in_A[157] <= PWDATA[15:8];
            acc_in_A[158] <= PWDATA[23:16];
            acc_in_A[159] <= PWDATA[31:24];
          end
          41:
          begin
            acc_in_A[160] <= PWDATA[7:0];
            acc_in_A[161] <= PWDATA[15:8];
            acc_in_A[162] <= PWDATA[23:16];
            acc_in_A[163] <= PWDATA[31:24];
          end
          42:
          begin
            acc_in_A[164] <= PWDATA[7:0];
            acc_in_A[165] <= PWDATA[15:8];
            acc_in_A[166] <= PWDATA[23:16];
            acc_in_A[167] <= PWDATA[31:24];
          end
          43:
          begin
            acc_in_A[168] <= PWDATA[7:0];
            acc_in_A[169] <= PWDATA[15:8];
            acc_in_A[170] <= PWDATA[23:16];
            acc_in_A[171] <= PWDATA[31:24];
          end
          44:
          begin
            acc_in_A[172] <= PWDATA[7:0];
            acc_in_A[173] <= PWDATA[15:8];
            acc_in_A[174] <= PWDATA[23:16];
            acc_in_A[175] <= PWDATA[31:24];
          end
          45:
          begin
            acc_in_A[176] <= PWDATA[7:0];
            acc_in_A[177] <= PWDATA[15:8];
            acc_in_A[178] <= PWDATA[23:16];
            acc_in_A[179] <= PWDATA[31:24];
          end
          46:
          begin
            acc_in_A[180] <= PWDATA[7:0];
            acc_in_A[181] <= PWDATA[15:8];
            acc_in_A[182] <= PWDATA[23:16];
            acc_in_A[183] <= PWDATA[31:24];
          end
          47:
          begin
            acc_in_A[184] <= PWDATA[7:0];
            acc_in_A[185] <= PWDATA[15:8];
            acc_in_A[186] <= PWDATA[23:16];
            acc_in_A[187] <= PWDATA[31:24];
          end
          48:
          begin
            acc_in_A[188] <= PWDATA[7:0];
            acc_in_A[189] <= PWDATA[15:8];
            acc_in_A[190] <= PWDATA[23:16];
            acc_in_A[191] <= PWDATA[31:24];
          end
          49:
          begin
            acc_in_A[192] <= PWDATA[7:0];
            acc_in_A[193] <= PWDATA[15:8];
            acc_in_A[194] <= PWDATA[23:16];
            acc_in_A[195] <= PWDATA[31:24];
          end
          50:
          begin
            acc_in_A[196] <= PWDATA[7:0];
            acc_in_A[197] <= PWDATA[15:8];
            acc_in_A[198] <= PWDATA[23:16];
            acc_in_A[199] <= PWDATA[31:24];
          end
          51:
          begin
            acc_in_A[200] <= PWDATA[7:0];
            acc_in_A[201] <= PWDATA[15:8];
            acc_in_A[202] <= PWDATA[23:16];
            acc_in_A[203] <= PWDATA[31:24];
          end
          52:
          begin
            acc_in_A[204] <= PWDATA[7:0];
            acc_in_A[205] <= PWDATA[15:8];
            acc_in_A[206] <= PWDATA[23:16];
            acc_in_A[207] <= PWDATA[31:24];
          end
          53:
          begin
            acc_in_A[208] <= PWDATA[7:0];
            acc_in_A[209] <= PWDATA[15:8];
            acc_in_A[210] <= PWDATA[23:16];
            acc_in_A[211] <= PWDATA[31:24];
          end
          54:
          begin
            acc_in_A[212] <= PWDATA[7:0];
            acc_in_A[213] <= PWDATA[15:8];
            acc_in_A[214] <= PWDATA[23:16];
            acc_in_A[215] <= PWDATA[31:24];
          end
          55:
          begin
            acc_in_A[216] <= PWDATA[7:0];
            acc_in_A[217] <= PWDATA[15:8];
            acc_in_A[218] <= PWDATA[23:16];
            acc_in_A[219] <= PWDATA[31:24];
          end
          56:
          begin
            acc_in_A[220] <= PWDATA[7:0];
            acc_in_A[221] <= PWDATA[15:8];
            acc_in_A[222] <= PWDATA[23:16];
            acc_in_A[223] <= PWDATA[31:24];
          end
          57:
          begin
            acc_in_A[224] <= PWDATA[7:0];
            acc_in_A[225] <= PWDATA[15:8];
            acc_in_A[226] <= PWDATA[23:16];
            acc_in_A[227] <= PWDATA[31:24];
          end
          58:
          begin
            acc_in_A[228] <= PWDATA[7:0];
            acc_in_A[229] <= PWDATA[15:8];
            acc_in_A[230] <= PWDATA[23:16];
            acc_in_A[231] <= PWDATA[31:24];
          end
          59:
          begin
            acc_in_A[232] <= PWDATA[7:0];
            acc_in_A[233] <= PWDATA[15:8];
            acc_in_A[234] <= PWDATA[23:16];
            acc_in_A[235] <= PWDATA[31:24];
          end
          60:
          begin
            acc_in_A[236] <= PWDATA[7:0];
            acc_in_A[237] <= PWDATA[15:8];
            acc_in_A[238] <= PWDATA[23:16];
            acc_in_A[239] <= PWDATA[31:24];
          end
          61:
          begin
            acc_in_A[240] <= PWDATA[7:0];
            acc_in_A[241] <= PWDATA[15:8];
            acc_in_A[242] <= PWDATA[23:16];
            acc_in_A[243] <= PWDATA[31:24];
          end
          62:
          begin
            acc_in_A[244] <= PWDATA[7:0];
            acc_in_A[245] <= PWDATA[15:8];
            acc_in_A[246] <= PWDATA[23:16];
            acc_in_A[247] <= PWDATA[31:24];
          end
          63:
          begin
            acc_in_A[248] <= PWDATA[7:0];
            acc_in_A[249] <= PWDATA[15:8];
            acc_in_A[250] <= PWDATA[23:16];
            acc_in_A[251] <= PWDATA[31:24];
          end
          64:
          begin
            acc_in_A[252] <= PWDATA[7:0];
            acc_in_A[253] <= PWDATA[15:8];
            acc_in_A[254] <= PWDATA[23:16];
            acc_in_A[255] <= PWDATA[31:24];
          end
          65:
          begin
            acc_in_A[256] <= PWDATA[7:0];
            acc_in_A[257] <= PWDATA[15:8];
            acc_in_A[258] <= PWDATA[23:16];
            acc_in_A[259] <= PWDATA[31:24];
          end
          66:
          begin
            acc_in_A[260] <= PWDATA[7:0];
            acc_in_A[261] <= PWDATA[15:8];
            acc_in_A[262] <= PWDATA[23:16];
            acc_in_A[263] <= PWDATA[31:24];
          end
          67:
          begin
            acc_in_A[264] <= PWDATA[7:0];
            acc_in_A[265] <= PWDATA[15:8];
            acc_in_A[266] <= PWDATA[23:16];
            acc_in_A[267] <= PWDATA[31:24];
          end
          68:
          begin
            acc_in_A[268] <= PWDATA[7:0];
            acc_in_A[269] <= PWDATA[15:8];
            acc_in_A[270] <= PWDATA[23:16];
            acc_in_A[271] <= PWDATA[31:24];
          end
          69:
          begin
            acc_in_A[272] <= PWDATA[7:0];
            acc_in_A[273] <= PWDATA[15:8];
            acc_in_A[274] <= PWDATA[23:16];
            acc_in_A[275] <= PWDATA[31:24];
          end
          70:
          begin
            acc_in_A[276] <= PWDATA[7:0];
            acc_in_A[277] <= PWDATA[15:8];
            acc_in_A[278] <= PWDATA[23:16];
            acc_in_A[279] <= PWDATA[31:24];
          end
          71:
          begin
            acc_in_A[280] <= PWDATA[7:0];
            acc_in_A[281] <= PWDATA[15:8];
            acc_in_A[282] <= PWDATA[23:16];
            acc_in_A[283] <= PWDATA[31:24];
          end
          72:
          begin
            acc_in_A[284] <= PWDATA[7:0];
            acc_in_A[285] <= PWDATA[15:8];
            acc_in_A[286] <= PWDATA[23:16];
            acc_in_A[287] <= PWDATA[31:24];
          end
          73:
          begin
            acc_in_A[288] <= PWDATA[7:0];
            acc_in_A[289] <= PWDATA[15:8];
            acc_in_A[290] <= PWDATA[23:16];
            acc_in_A[291] <= PWDATA[31:24];
          end
          74:
          begin
            acc_in_A[292] <= PWDATA[7:0];
            acc_in_A[293] <= PWDATA[15:8];
            acc_in_A[294] <= PWDATA[23:16];
            acc_in_A[295] <= PWDATA[31:24];
          end
          75:
          begin
            acc_in_A[296] <= PWDATA[7:0];
            acc_in_A[297] <= PWDATA[15:8];
            acc_in_A[298] <= PWDATA[23:16];
            acc_in_A[299] <= PWDATA[31:24];
          end
          76:
          begin
            acc_in_A[300] <= PWDATA[7:0];
            acc_in_A[301] <= PWDATA[15:8];
            acc_in_A[302] <= PWDATA[23:16];
            acc_in_A[303] <= PWDATA[31:24];
          end
          77:
          begin
            acc_in_A[304] <= PWDATA[7:0];
            acc_in_A[305] <= PWDATA[15:8];
            acc_in_A[306] <= PWDATA[23:16];
            acc_in_A[307] <= PWDATA[31:24];
          end
          78:
          begin
            acc_in_A[308] <= PWDATA[7:0];
            acc_in_A[309] <= PWDATA[15:8];
            acc_in_A[310] <= PWDATA[23:16];
            acc_in_A[311] <= PWDATA[31:24];
          end
          79:
          begin
            acc_in_A[312] <= PWDATA[7:0];
            acc_in_A[313] <= PWDATA[15:8];
            acc_in_A[314] <= PWDATA[23:16];
            acc_in_A[315] <= PWDATA[31:24];
          end
          80:
          begin
            acc_in_A[316] <= PWDATA[7:0];
            acc_in_A[317] <= PWDATA[15:8];
            acc_in_A[318] <= PWDATA[23:16];
            acc_in_A[319] <= PWDATA[31:24];
          end
          81:
          begin
            acc_in_A[320] <= PWDATA[7:0];
            acc_in_A[321] <= PWDATA[15:8];
            acc_in_A[322] <= PWDATA[23:16];
            acc_in_A[323] <= PWDATA[31:24];
          end
          82:
          begin
            acc_in_A[324] <= PWDATA[7:0];
            acc_in_A[325] <= PWDATA[15:8];
            acc_in_A[326] <= PWDATA[23:16];
            acc_in_A[327] <= PWDATA[31:24];
          end
          83:
          begin
            acc_in_A[328] <= PWDATA[7:0];
            acc_in_A[329] <= PWDATA[15:8];
            acc_in_A[330] <= PWDATA[23:16];
            acc_in_A[331] <= PWDATA[31:24];
          end
          84:
          begin
            acc_in_A[332] <= PWDATA[7:0];
            acc_in_A[333] <= PWDATA[15:8];
            acc_in_A[334] <= PWDATA[23:16];
            acc_in_A[335] <= PWDATA[31:24];
          end
          85:
          begin
            acc_in_A[336] <= PWDATA[7:0];
            acc_in_A[337] <= PWDATA[15:8];
            acc_in_A[338] <= PWDATA[23:16];
            acc_in_A[339] <= PWDATA[31:24];
          end
          86:
          begin
            acc_in_A[340] <= PWDATA[7:0];
            acc_in_A[341] <= PWDATA[15:8];
            acc_in_A[342] <= PWDATA[23:16];
            acc_in_A[343] <= PWDATA[31:24];
          end
          87:
          begin
            acc_in_A[344] <= PWDATA[7:0];
            acc_in_A[345] <= PWDATA[15:8];
            acc_in_A[346] <= PWDATA[23:16];
            acc_in_A[347] <= PWDATA[31:24];
          end
          88:
          begin
            acc_in_A[348] <= PWDATA[7:0];
            acc_in_A[349] <= PWDATA[15:8];
            acc_in_A[350] <= PWDATA[23:16];
            acc_in_A[351] <= PWDATA[31:24];
          end
          89:
          begin
            acc_in_A[352] <= PWDATA[7:0];
            acc_in_A[353] <= PWDATA[15:8];
            acc_in_A[354] <= PWDATA[23:16];
            acc_in_A[355] <= PWDATA[31:24];
          end
          90:
          begin
            acc_in_A[356] <= PWDATA[7:0];
            acc_in_A[357] <= PWDATA[15:8];
            acc_in_A[358] <= PWDATA[23:16];
            acc_in_A[359] <= PWDATA[31:24];
          end
          91:
          begin
            acc_in_A[360] <= PWDATA[7:0];
            acc_in_A[361] <= PWDATA[15:8];
            acc_in_A[362] <= PWDATA[23:16];
            acc_in_A[363] <= PWDATA[31:24];
          end
          92:
          begin
            acc_in_A[364] <= PWDATA[7:0];
            acc_in_A[365] <= PWDATA[15:8];
            acc_in_A[366] <= PWDATA[23:16];
            acc_in_A[367] <= PWDATA[31:24];
          end
          93:
          begin
            acc_in_A[368] <= PWDATA[7:0];
            acc_in_A[369] <= PWDATA[15:8];
            acc_in_A[370] <= PWDATA[23:16];
            acc_in_A[371] <= PWDATA[31:24];
          end
          94:
          begin
            acc_in_A[372] <= PWDATA[7:0];
            acc_in_A[373] <= PWDATA[15:8];
            acc_in_A[374] <= PWDATA[23:16];
            acc_in_A[375] <= PWDATA[31:24];
          end
          95:
          begin
            acc_in_A[376] <= PWDATA[7:0];
            acc_in_A[377] <= PWDATA[15:8];
            acc_in_A[378] <= PWDATA[23:16];
            acc_in_A[379] <= PWDATA[31:24];
          end
          96:
          begin
            acc_in_A[380] <= PWDATA[7:0];
            acc_in_A[381] <= PWDATA[15:8];
            acc_in_A[382] <= PWDATA[23:16];
            acc_in_A[383] <= PWDATA[31:24];
          end
          97:
          begin
            acc_in_A[384] <= PWDATA[7:0];
            acc_in_A[385] <= PWDATA[15:8];
            acc_in_A[386] <= PWDATA[23:16];
            acc_in_A[387] <= PWDATA[31:24];
          end
          98:
          begin
            acc_in_A[388] <= PWDATA[7:0];
            acc_in_A[389] <= PWDATA[15:8];
            acc_in_A[390] <= PWDATA[23:16];
            acc_in_A[391] <= PWDATA[31:24];
          end
          99:
          begin
            acc_in_A[392] <= PWDATA[7:0];
            acc_in_A[393] <= PWDATA[15:8];
            acc_in_A[394] <= PWDATA[23:16];
            acc_in_A[395] <= PWDATA[31:24];
          end
          100:
          begin
            acc_in_A[396] <= PWDATA[7:0];
            acc_in_A[397] <= PWDATA[15:8];
            acc_in_A[398] <= PWDATA[23:16];
            acc_in_A[399] <= PWDATA[31:24];
          end
          101:
          begin
            acc_in_A[400] <= PWDATA[7:0];
            acc_in_A[401] <= PWDATA[15:8];
            acc_in_A[402] <= PWDATA[23:16];
            acc_in_A[403] <= PWDATA[31:24];
          end
          102:
          begin
            acc_in_A[404] <= PWDATA[7:0];
            acc_in_A[405] <= PWDATA[15:8];
            acc_in_A[406] <= PWDATA[23:16];
            acc_in_A[407] <= PWDATA[31:24];
          end
          103:
          begin
            acc_in_A[408] <= PWDATA[7:0];
            acc_in_A[409] <= PWDATA[15:8];
            acc_in_A[410] <= PWDATA[23:16];
            acc_in_A[411] <= PWDATA[31:24];
          end
          104:
          begin
            acc_in_A[412] <= PWDATA[7:0];
            acc_in_A[413] <= PWDATA[15:8];
            acc_in_A[414] <= PWDATA[23:16];
            acc_in_A[415] <= PWDATA[31:24];
          end
          105:
          begin
            acc_in_A[416] <= PWDATA[7:0];
            acc_in_A[417] <= PWDATA[15:8];
            acc_in_A[418] <= PWDATA[23:16];
            acc_in_A[419] <= PWDATA[31:24];
          end
          106:
          begin
            acc_in_A[420] <= PWDATA[7:0];
            acc_in_A[421] <= PWDATA[15:8];
            acc_in_A[422] <= PWDATA[23:16];
            acc_in_A[423] <= PWDATA[31:24];
          end
          107:
          begin
            acc_in_A[424] <= PWDATA[7:0];
            acc_in_A[425] <= PWDATA[15:8];
            acc_in_A[426] <= PWDATA[23:16];
            acc_in_A[427] <= PWDATA[31:24];
          end
          108:
          begin
            acc_in_A[428] <= PWDATA[7:0];
            acc_in_A[429] <= PWDATA[15:8];
            acc_in_A[430] <= PWDATA[23:16];
            acc_in_A[431] <= PWDATA[31:24];
          end
          109:
          begin
            acc_in_A[432] <= PWDATA[7:0];
            acc_in_A[433] <= PWDATA[15:8];
            acc_in_A[434] <= PWDATA[23:16];
            acc_in_A[435] <= PWDATA[31:24];
          end
          110:
          begin
            acc_in_A[436] <= PWDATA[7:0];
            acc_in_A[437] <= PWDATA[15:8];
            acc_in_A[438] <= PWDATA[23:16];
            acc_in_A[439] <= PWDATA[31:24];
          end
          111:
          begin
            acc_in_A[440] <= PWDATA[7:0];
            acc_in_A[441] <= PWDATA[15:8];
            acc_in_A[442] <= PWDATA[23:16];
            acc_in_A[443] <= PWDATA[31:24];
          end
          112:
          begin
            acc_in_A[444] <= PWDATA[7:0];
            acc_in_A[445] <= PWDATA[15:8];
            acc_in_A[446] <= PWDATA[23:16];
            acc_in_A[447] <= PWDATA[31:24];
          end
          113:
          begin
            acc_in_A[448] <= PWDATA[7:0];
            acc_in_A[449] <= PWDATA[15:8];
            acc_in_A[450] <= PWDATA[23:16];
            acc_in_A[451] <= PWDATA[31:24];
          end
          114:
          begin
            acc_in_A[452] <= PWDATA[7:0];
            acc_in_A[453] <= PWDATA[15:8];
            acc_in_A[454] <= PWDATA[23:16];
            acc_in_A[455] <= PWDATA[31:24];
          end
          115:
          begin
            acc_in_A[456] <= PWDATA[7:0];
            acc_in_A[457] <= PWDATA[15:8];
            acc_in_A[458] <= PWDATA[23:16];
            acc_in_A[459] <= PWDATA[31:24];
          end
          116:
          begin
            acc_in_A[460] <= PWDATA[7:0];
            acc_in_A[461] <= PWDATA[15:8];
            acc_in_A[462] <= PWDATA[23:16];
            acc_in_A[463] <= PWDATA[31:24];
          end
          117:
          begin
            acc_in_A[464] <= PWDATA[7:0];
            acc_in_A[465] <= PWDATA[15:8];
            acc_in_A[466] <= PWDATA[23:16];
            acc_in_A[467] <= PWDATA[31:24];
          end
          118:
          begin
            acc_in_A[468] <= PWDATA[7:0];
            acc_in_A[469] <= PWDATA[15:8];
            acc_in_A[470] <= PWDATA[23:16];
            acc_in_A[471] <= PWDATA[31:24];
          end
          119:
          begin
            acc_in_A[472] <= PWDATA[7:0];
            acc_in_A[473] <= PWDATA[15:8];
            acc_in_A[474] <= PWDATA[23:16];
            acc_in_A[475] <= PWDATA[31:24];
          end
          120:
          begin
            acc_in_A[476] <= PWDATA[7:0];
            acc_in_A[477] <= PWDATA[15:8];
            acc_in_A[478] <= PWDATA[23:16];
            acc_in_A[479] <= PWDATA[31:24];
          end
          121:
          begin
            acc_in_A[480] <= PWDATA[7:0];
            acc_in_A[481] <= PWDATA[15:8];
            acc_in_A[482] <= PWDATA[23:16];
            acc_in_A[483] <= PWDATA[31:24];
          end
          122:
          begin
            acc_in_A[484] <= PWDATA[7:0];
            acc_in_A[485] <= PWDATA[15:8];
            acc_in_A[486] <= PWDATA[23:16];
            acc_in_A[487] <= PWDATA[31:24];
          end
          123:
          begin
            acc_in_A[488] <= PWDATA[7:0];
            acc_in_A[489] <= PWDATA[15:8];
            acc_in_A[490] <= PWDATA[23:16];
            acc_in_A[491] <= PWDATA[31:24];
          end
          124:
          begin
            acc_in_A[492] <= PWDATA[7:0];
            acc_in_A[493] <= PWDATA[15:8];
            acc_in_A[494] <= PWDATA[23:16];
            acc_in_A[495] <= PWDATA[31:24];
          end
          125:
          begin
            acc_in_A[496] <= PWDATA[7:0];
            acc_in_A[497] <= PWDATA[15:8];
            acc_in_A[498] <= PWDATA[23:16];
            acc_in_A[499] <= PWDATA[31:24];
          end
          126:
          begin
            acc_in_A[500] <= PWDATA[7:0];
            acc_in_A[501] <= PWDATA[15:8];
            acc_in_A[502] <= PWDATA[23:16];
            acc_in_A[503] <= PWDATA[31:24];
          end
          127:
          begin
            acc_in_A[504] <= PWDATA[7:0];
            acc_in_A[505] <= PWDATA[15:8];
            acc_in_A[506] <= PWDATA[23:16];
            acc_in_A[507] <= PWDATA[31:24];
          end
          128:
          begin
            acc_in_A[508] <= PWDATA[7:0];
            acc_in_A[509] <= PWDATA[15:8];
            acc_in_A[510] <= PWDATA[23:16];
            acc_in_A[511] <= PWDATA[31:24];
          end
          129:
          begin
            acc_in_A[512] <= PWDATA[7:0];
            acc_in_A[513] <= PWDATA[15:8];
            acc_in_A[514] <= PWDATA[23:16];
            acc_in_A[515] <= PWDATA[31:24];
          end
          130:
          begin
            acc_in_A[516] <= PWDATA[7:0];
            acc_in_A[517] <= PWDATA[15:8];
            acc_in_A[518] <= PWDATA[23:16];
            acc_in_A[519] <= PWDATA[31:24];
          end
          131:
          begin
            acc_in_A[520] <= PWDATA[7:0];
            acc_in_A[521] <= PWDATA[15:8];
            acc_in_A[522] <= PWDATA[23:16];
            acc_in_A[523] <= PWDATA[31:24];
          end
          132:
          begin
            acc_in_A[524] <= PWDATA[7:0];
            acc_in_A[525] <= PWDATA[15:8];
            acc_in_A[526] <= PWDATA[23:16];
            acc_in_A[527] <= PWDATA[31:24];
          end
          133:
          begin
            acc_in_A[528] <= PWDATA[7:0];
            acc_in_A[529] <= PWDATA[15:8];
            acc_in_A[530] <= PWDATA[23:16];
            acc_in_A[531] <= PWDATA[31:24];
          end
          134:
          begin
            acc_in_A[532] <= PWDATA[7:0];
            acc_in_A[533] <= PWDATA[15:8];
            acc_in_A[534] <= PWDATA[23:16];
            acc_in_A[535] <= PWDATA[31:24];
          end
          135:
          begin
            acc_in_A[536] <= PWDATA[7:0];
            acc_in_A[537] <= PWDATA[15:8];
            acc_in_A[538] <= PWDATA[23:16];
            acc_in_A[539] <= PWDATA[31:24];
          end
          136:
          begin
            acc_in_A[540] <= PWDATA[7:0];
            acc_in_A[541] <= PWDATA[15:8];
            acc_in_A[542] <= PWDATA[23:16];
            acc_in_A[543] <= PWDATA[31:24];
          end
          137:
          begin
            acc_in_A[544] <= PWDATA[7:0];
            acc_in_A[545] <= PWDATA[15:8];
            acc_in_A[546] <= PWDATA[23:16];
            acc_in_A[547] <= PWDATA[31:24];
          end
          138:
          begin
            acc_in_A[548] <= PWDATA[7:0];
            acc_in_A[549] <= PWDATA[15:8];
            acc_in_A[550] <= PWDATA[23:16];
            acc_in_A[551] <= PWDATA[31:24];
          end
          139:
          begin
            acc_in_A[552] <= PWDATA[7:0];
            acc_in_A[553] <= PWDATA[15:8];
            acc_in_A[554] <= PWDATA[23:16];
            acc_in_A[555] <= PWDATA[31:24];
          end
          140:
          begin
            acc_in_A[556] <= PWDATA[7:0];
            acc_in_A[557] <= PWDATA[15:8];
            acc_in_A[558] <= PWDATA[23:16];
            acc_in_A[559] <= PWDATA[31:24];
          end
          141:
          begin
            acc_in_A[560] <= PWDATA[7:0];
            acc_in_A[561] <= PWDATA[15:8];
            acc_in_A[562] <= PWDATA[23:16];
            acc_in_A[563] <= PWDATA[31:24];
          end
          142:
          begin
            acc_in_A[564] <= PWDATA[7:0];
            acc_in_A[565] <= PWDATA[15:8];
            acc_in_A[566] <= PWDATA[23:16];
            acc_in_A[567] <= PWDATA[31:24];
          end
          143:
          begin
            acc_in_A[568] <= PWDATA[7:0];
            acc_in_A[569] <= PWDATA[15:8];
            acc_in_A[570] <= PWDATA[23:16];
            acc_in_A[571] <= PWDATA[31:24];
          end
          144:
          begin
            acc_in_A[572] <= PWDATA[7:0];
            acc_in_A[573] <= PWDATA[15:8];
            acc_in_A[574] <= PWDATA[23:16];
            acc_in_A[575] <= PWDATA[31:24];
          end
          145:
          begin
            acc_in_A[576] <= PWDATA[7:0];
            acc_in_A[577] <= PWDATA[15:8];
            acc_in_A[578] <= PWDATA[23:16];
            acc_in_A[579] <= PWDATA[31:24];
          end
          146:
          begin
            acc_in_A[580] <= PWDATA[7:0];
            acc_in_A[581] <= PWDATA[15:8];
            acc_in_A[582] <= PWDATA[23:16];
            acc_in_A[583] <= PWDATA[31:24];
          end
          147:
          begin
            acc_in_A[584] <= PWDATA[7:0];
            acc_in_A[585] <= PWDATA[15:8];
            acc_in_A[586] <= PWDATA[23:16];
            acc_in_A[587] <= PWDATA[31:24];
          end
          148:
          begin
            acc_in_A[588] <= PWDATA[7:0];
            acc_in_A[589] <= PWDATA[15:8];
            acc_in_A[590] <= PWDATA[23:16];
            acc_in_A[591] <= PWDATA[31:24];
          end
          149:
          begin
            acc_in_A[592] <= PWDATA[7:0];
            acc_in_A[593] <= PWDATA[15:8];
            acc_in_A[594] <= PWDATA[23:16];
            acc_in_A[595] <= PWDATA[31:24];
          end
          150:
          begin
            acc_in_A[596] <= PWDATA[7:0];
            acc_in_A[597] <= PWDATA[15:8];
            acc_in_A[598] <= PWDATA[23:16];
            acc_in_A[599] <= PWDATA[31:24];
          end
          151:
          begin
            acc_in_A[600] <= PWDATA[7:0];
            acc_in_A[601] <= PWDATA[15:8];
            acc_in_A[602] <= PWDATA[23:16];
            acc_in_A[603] <= PWDATA[31:24];
          end
          152:
          begin
            acc_in_A[604] <= PWDATA[7:0];
            acc_in_A[605] <= PWDATA[15:8];
            acc_in_A[606] <= PWDATA[23:16];
            acc_in_A[607] <= PWDATA[31:24];
          end
          153:
          begin
            acc_in_A[608] <= PWDATA[7:0];
            acc_in_A[609] <= PWDATA[15:8];
            acc_in_A[610] <= PWDATA[23:16];
            acc_in_A[611] <= PWDATA[31:24];
          end
          154:
          begin
            acc_in_A[612] <= PWDATA[7:0];
            acc_in_A[613] <= PWDATA[15:8];
            acc_in_A[614] <= PWDATA[23:16];
            acc_in_A[615] <= PWDATA[31:24];
          end
          155:
          begin
            acc_in_A[616] <= PWDATA[7:0];
            acc_in_A[617] <= PWDATA[15:8];
            acc_in_A[618] <= PWDATA[23:16];
            acc_in_A[619] <= PWDATA[31:24];
          end
          156:
          begin
            acc_in_A[620] <= PWDATA[7:0];
            acc_in_A[621] <= PWDATA[15:8];
            acc_in_A[622] <= PWDATA[23:16];
            acc_in_A[623] <= PWDATA[31:24];
          end
          157:
          begin
            acc_in_A[624] <= PWDATA[7:0];
            acc_in_A[625] <= PWDATA[15:8];
            acc_in_A[626] <= PWDATA[23:16];
            acc_in_A[627] <= PWDATA[31:24];
          end
          158:
          begin
            acc_in_A[628] <= PWDATA[7:0];
            acc_in_A[629] <= PWDATA[15:8];
            acc_in_A[630] <= PWDATA[23:16];
            acc_in_A[631] <= PWDATA[31:24];
          end
          159:
          begin
            acc_in_A[632] <= PWDATA[7:0];
            acc_in_A[633] <= PWDATA[15:8];
            acc_in_A[634] <= PWDATA[23:16];
            acc_in_A[635] <= PWDATA[31:24];
          end
          160:
          begin
            acc_in_A[636] <= PWDATA[7:0];
            acc_in_A[637] <= PWDATA[15:8];
            acc_in_A[638] <= PWDATA[23:16];
            acc_in_A[639] <= PWDATA[31:24];
          end
          161:
          begin
            acc_in_A[640] <= PWDATA[7:0];
            acc_in_A[641] <= PWDATA[15:8];
            acc_in_A[642] <= PWDATA[23:16];
            acc_in_A[643] <= PWDATA[31:24];
          end
          162:
          begin
            acc_in_A[644] <= PWDATA[7:0];
            acc_in_A[645] <= PWDATA[15:8];
            acc_in_A[646] <= PWDATA[23:16];
            acc_in_A[647] <= PWDATA[31:24];
          end
          163:
          begin
            acc_in_A[648] <= PWDATA[7:0];
            acc_in_A[649] <= PWDATA[15:8];
            acc_in_A[650] <= PWDATA[23:16];
            acc_in_A[651] <= PWDATA[31:24];
          end
          164:
          begin
            acc_in_A[652] <= PWDATA[7:0];
            acc_in_A[653] <= PWDATA[15:8];
            acc_in_A[654] <= PWDATA[23:16];
            acc_in_A[655] <= PWDATA[31:24];
          end
          165:
          begin
            acc_in_A[656] <= PWDATA[7:0];
            acc_in_A[657] <= PWDATA[15:8];
            acc_in_A[658] <= PWDATA[23:16];
            acc_in_A[659] <= PWDATA[31:24];
          end
          166:
          begin
            acc_in_A[660] <= PWDATA[7:0];
            acc_in_A[661] <= PWDATA[15:8];
            acc_in_A[662] <= PWDATA[23:16];
            acc_in_A[663] <= PWDATA[31:24];
          end
          167:
          begin
            acc_in_A[664] <= PWDATA[7:0];
            acc_in_A[665] <= PWDATA[15:8];
            acc_in_A[666] <= PWDATA[23:16];
            acc_in_A[667] <= PWDATA[31:24];
          end
          168:
          begin
            acc_in_A[668] <= PWDATA[7:0];
            acc_in_A[669] <= PWDATA[15:8];
            acc_in_A[670] <= PWDATA[23:16];
            acc_in_A[671] <= PWDATA[31:24];
          end
          169:
          begin
            acc_in_A[672] <= PWDATA[7:0];
            acc_in_A[673] <= PWDATA[15:8];
            acc_in_A[674] <= PWDATA[23:16];
            acc_in_A[675] <= PWDATA[31:24];
          end
          170:
          begin
            acc_in_A[676] <= PWDATA[7:0];
            acc_in_A[677] <= PWDATA[15:8];
            acc_in_A[678] <= PWDATA[23:16];
            acc_in_A[679] <= PWDATA[31:24];
          end
          171:
          begin
            acc_in_A[680] <= PWDATA[7:0];
            acc_in_A[681] <= PWDATA[15:8];
            acc_in_A[682] <= PWDATA[23:16];
            acc_in_A[683] <= PWDATA[31:24];
          end
          172:
          begin
            acc_in_A[684] <= PWDATA[7:0];
            acc_in_A[685] <= PWDATA[15:8];
            acc_in_A[686] <= PWDATA[23:16];
            acc_in_A[687] <= PWDATA[31:24];
          end
          173:
          begin
            acc_in_A[688] <= PWDATA[7:0];
            acc_in_A[689] <= PWDATA[15:8];
            acc_in_A[690] <= PWDATA[23:16];
            acc_in_A[691] <= PWDATA[31:24];
          end
          174:
          begin
            acc_in_A[692] <= PWDATA[7:0];
            acc_in_A[693] <= PWDATA[15:8];
            acc_in_A[694] <= PWDATA[23:16];
            acc_in_A[695] <= PWDATA[31:24];
          end
          175:
          begin
            acc_in_A[696] <= PWDATA[7:0];
            acc_in_A[697] <= PWDATA[15:8];
            acc_in_A[698] <= PWDATA[23:16];
            acc_in_A[699] <= PWDATA[31:24];
          end
          176:
          begin
            acc_in_A[700] <= PWDATA[7:0];
            acc_in_A[701] <= PWDATA[15:8];
            acc_in_A[702] <= PWDATA[23:16];
            acc_in_A[703] <= PWDATA[31:24];
          end
          177:
          begin
            acc_in_A[704] <= PWDATA[7:0];
            acc_in_A[705] <= PWDATA[15:8];
            acc_in_A[706] <= PWDATA[23:16];
            acc_in_A[707] <= PWDATA[31:24];
          end
          178:
          begin
            acc_in_A[708] <= PWDATA[7:0];
            acc_in_A[709] <= PWDATA[15:8];
            acc_in_A[710] <= PWDATA[23:16];
            acc_in_A[711] <= PWDATA[31:24];
          end
          179:
          begin
            acc_in_A[712] <= PWDATA[7:0];
            acc_in_A[713] <= PWDATA[15:8];
            acc_in_A[714] <= PWDATA[23:16];
            acc_in_A[715] <= PWDATA[31:24];
          end
          180:
          begin
            acc_in_A[716] <= PWDATA[7:0];
            acc_in_A[717] <= PWDATA[15:8];
            acc_in_A[718] <= PWDATA[23:16];
            acc_in_A[719] <= PWDATA[31:24];
          end
          181:
          begin
            acc_in_A[720] <= PWDATA[7:0];
            acc_in_A[721] <= PWDATA[15:8];
            acc_in_A[722] <= PWDATA[23:16];
            acc_in_A[723] <= PWDATA[31:24];
          end
          182:
          begin
            acc_in_A[724] <= PWDATA[7:0];
            acc_in_A[725] <= PWDATA[15:8];
            acc_in_A[726] <= PWDATA[23:16];
            acc_in_A[727] <= PWDATA[31:24];
          end
          183:
          begin
            acc_in_A[728] <= PWDATA[7:0];
            acc_in_A[729] <= PWDATA[15:8];
            acc_in_A[730] <= PWDATA[23:16];
            acc_in_A[731] <= PWDATA[31:24];
          end
          184:
          begin
            acc_in_A[732] <= PWDATA[7:0];
            acc_in_A[733] <= PWDATA[15:8];
            acc_in_A[734] <= PWDATA[23:16];
            acc_in_A[735] <= PWDATA[31:24];
          end
          185:
          begin
            acc_in_A[736] <= PWDATA[7:0];
            acc_in_A[737] <= PWDATA[15:8];
            acc_in_A[738] <= PWDATA[23:16];
            acc_in_A[739] <= PWDATA[31:24];
          end
          186:
          begin
            acc_in_A[740] <= PWDATA[7:0];
            acc_in_A[741] <= PWDATA[15:8];
            acc_in_A[742] <= PWDATA[23:16];
            acc_in_A[743] <= PWDATA[31:24];
          end
          187:
          begin
            acc_in_A[744] <= PWDATA[7:0];
            acc_in_A[745] <= PWDATA[15:8];
            acc_in_A[746] <= PWDATA[23:16];
            acc_in_A[747] <= PWDATA[31:24];
          end
          188:
          begin
            acc_in_A[748] <= PWDATA[7:0];
            acc_in_A[749] <= PWDATA[15:8];
            acc_in_A[750] <= PWDATA[23:16];
            acc_in_A[751] <= PWDATA[31:24];
          end
          189:
          begin
            acc_in_A[752] <= PWDATA[7:0];
            acc_in_A[753] <= PWDATA[15:8];
            acc_in_A[754] <= PWDATA[23:16];
            acc_in_A[755] <= PWDATA[31:24];
          end
          190:
          begin
            acc_in_A[756] <= PWDATA[7:0];
            acc_in_A[757] <= PWDATA[15:8];
            acc_in_A[758] <= PWDATA[23:16];
            acc_in_A[759] <= PWDATA[31:24];
          end
          191:
          begin
            acc_in_A[760] <= PWDATA[7:0];
            acc_in_A[761] <= PWDATA[15:8];
            acc_in_A[762] <= PWDATA[23:16];
            acc_in_A[763] <= PWDATA[31:24];
          end
          192:
          begin
            acc_in_A[764] <= PWDATA[7:0];
            acc_in_A[765] <= PWDATA[15:8];
            acc_in_A[766] <= PWDATA[23:16];
            acc_in_A[767] <= PWDATA[31:24];
          end
          193:
          begin
            acc_in_A[768] <= PWDATA[7:0];
            acc_in_A[769] <= PWDATA[15:8];
            acc_in_A[770] <= PWDATA[23:16];
            acc_in_A[771] <= PWDATA[31:24];
          end
          194:
          begin
            acc_in_A[772] <= PWDATA[7:0];
            acc_in_A[773] <= PWDATA[15:8];
            acc_in_A[774] <= PWDATA[23:16];
            acc_in_A[775] <= PWDATA[31:24];
          end
          195:
          begin
            acc_in_A[776] <= PWDATA[7:0];
            acc_in_A[777] <= PWDATA[15:8];
            acc_in_A[778] <= PWDATA[23:16];
            acc_in_A[779] <= PWDATA[31:24];
          end
          196:
          begin
            acc_in_A[780] <= PWDATA[7:0];
            acc_in_A[781] <= PWDATA[15:8];
            acc_in_A[782] <= PWDATA[23:16];
            acc_in_A[783] <= PWDATA[31:24];
          end
          197:
          begin
            acc_in_A[784] <= PWDATA[7:0];
            acc_in_A[785] <= PWDATA[15:8];
            acc_in_A[786] <= PWDATA[23:16];
            acc_in_A[787] <= PWDATA[31:24];
          end
          198:
          begin
            acc_in_A[788] <= PWDATA[7:0];
            acc_in_A[789] <= PWDATA[15:8];
            acc_in_A[790] <= PWDATA[23:16];
            acc_in_A[791] <= PWDATA[31:24];
          end
          199:
          begin
            acc_in_A[792] <= PWDATA[7:0];
            acc_in_A[793] <= PWDATA[15:8];
            acc_in_A[794] <= PWDATA[23:16];
            acc_in_A[795] <= PWDATA[31:24];
          end
          200:
          begin
            acc_in_A[796] <= PWDATA[7:0];
            acc_in_A[797] <= PWDATA[15:8];
            acc_in_A[798] <= PWDATA[23:16];
            acc_in_A[799] <= PWDATA[31:24];
          end
          201:
          begin
            acc_in_A[800] <= PWDATA[7:0];
            acc_in_A[801] <= PWDATA[15:8];
            acc_in_A[802] <= PWDATA[23:16];
            acc_in_A[803] <= PWDATA[31:24];
          end
          202:
          begin
            acc_in_A[804] <= PWDATA[7:0];
            acc_in_A[805] <= PWDATA[15:8];
            acc_in_A[806] <= PWDATA[23:16];
            acc_in_A[807] <= PWDATA[31:24];
          end
          203:
          begin
            acc_in_A[808] <= PWDATA[7:0];
            acc_in_A[809] <= PWDATA[15:8];
            acc_in_A[810] <= PWDATA[23:16];
            acc_in_A[811] <= PWDATA[31:24];
          end
          204:
          begin
            acc_in_A[812] <= PWDATA[7:0];
            acc_in_A[813] <= PWDATA[15:8];
            acc_in_A[814] <= PWDATA[23:16];
            acc_in_A[815] <= PWDATA[31:24];
          end
          205:
          begin
            acc_in_A[816] <= PWDATA[7:0];
            acc_in_A[817] <= PWDATA[15:8];
            acc_in_A[818] <= PWDATA[23:16];
            acc_in_A[819] <= PWDATA[31:24];
          end
          206:
          begin
            acc_in_A[820] <= PWDATA[7:0];
            acc_in_A[821] <= PWDATA[15:8];
            acc_in_A[822] <= PWDATA[23:16];
            acc_in_A[823] <= PWDATA[31:24];
          end
          207:
          begin
            acc_in_A[824] <= PWDATA[7:0];
            acc_in_A[825] <= PWDATA[15:8];
            acc_in_A[826] <= PWDATA[23:16];
            acc_in_A[827] <= PWDATA[31:24];
          end
          208:
          begin
            acc_in_A[828] <= PWDATA[7:0];
            acc_in_A[829] <= PWDATA[15:8];
            acc_in_A[830] <= PWDATA[23:16];
            acc_in_A[831] <= PWDATA[31:24];
          end
          209:
          begin
            acc_in_A[832] <= PWDATA[7:0];
            acc_in_A[833] <= PWDATA[15:8];
            acc_in_A[834] <= PWDATA[23:16];
            acc_in_A[835] <= PWDATA[31:24];
          end
          210:
          begin
            acc_in_A[836] <= PWDATA[7:0];
            acc_in_A[837] <= PWDATA[15:8];
            acc_in_A[838] <= PWDATA[23:16];
            acc_in_A[839] <= PWDATA[31:24];
          end
          211:
          begin
            acc_in_A[840] <= PWDATA[7:0];
            acc_in_A[841] <= PWDATA[15:8];
            acc_in_A[842] <= PWDATA[23:16];
            acc_in_A[843] <= PWDATA[31:24];
          end
          212:
          begin
            acc_in_A[844] <= PWDATA[7:0];
            acc_in_A[845] <= PWDATA[15:8];
            acc_in_A[846] <= PWDATA[23:16];
            acc_in_A[847] <= PWDATA[31:24];
          end
          213:
          begin
            acc_in_A[848] <= PWDATA[7:0];
            acc_in_A[849] <= PWDATA[15:8];
            acc_in_A[850] <= PWDATA[23:16];
            acc_in_A[851] <= PWDATA[31:24];
          end
          214:
          begin
            acc_in_A[852] <= PWDATA[7:0];
            acc_in_A[853] <= PWDATA[15:8];
            acc_in_A[854] <= PWDATA[23:16];
            acc_in_A[855] <= PWDATA[31:24];
          end
          215:
          begin
            acc_in_A[856] <= PWDATA[7:0];
            acc_in_A[857] <= PWDATA[15:8];
            acc_in_A[858] <= PWDATA[23:16];
            acc_in_A[859] <= PWDATA[31:24];
          end
          216:
          begin
            acc_in_A[860] <= PWDATA[7:0];
            acc_in_A[861] <= PWDATA[15:8];
            acc_in_A[862] <= PWDATA[23:16];
            acc_in_A[863] <= PWDATA[31:24];
          end
          217:
          begin
            acc_in_A[864] <= PWDATA[7:0];
            acc_in_A[865] <= PWDATA[15:8];
            acc_in_A[866] <= PWDATA[23:16];
            acc_in_A[867] <= PWDATA[31:24];
          end
          218:
          begin
            acc_in_A[868] <= PWDATA[7:0];
            acc_in_A[869] <= PWDATA[15:8];
            acc_in_A[870] <= PWDATA[23:16];
            acc_in_A[871] <= PWDATA[31:24];
          end
          219:
          begin
            acc_in_A[872] <= PWDATA[7:0];
            acc_in_A[873] <= PWDATA[15:8];
            acc_in_A[874] <= PWDATA[23:16];
            acc_in_A[875] <= PWDATA[31:24];
          end
          220:
          begin
            acc_in_A[876] <= PWDATA[7:0];
            acc_in_A[877] <= PWDATA[15:8];
            acc_in_A[878] <= PWDATA[23:16];
            acc_in_A[879] <= PWDATA[31:24];
          end
          221:
          begin
            acc_in_A[880] <= PWDATA[7:0];
            acc_in_A[881] <= PWDATA[15:8];
            acc_in_A[882] <= PWDATA[23:16];
            acc_in_A[883] <= PWDATA[31:24];
          end
          222:
          begin
            acc_in_A[884] <= PWDATA[7:0];
            acc_in_A[885] <= PWDATA[15:8];
            acc_in_A[886] <= PWDATA[23:16];
            acc_in_A[887] <= PWDATA[31:24];
          end
          223:
          begin
            acc_in_A[888] <= PWDATA[7:0];
            acc_in_A[889] <= PWDATA[15:8];
            acc_in_A[890] <= PWDATA[23:16];
            acc_in_A[891] <= PWDATA[31:24];
          end
          224:
          begin
            acc_in_A[892] <= PWDATA[7:0];
            acc_in_A[893] <= PWDATA[15:8];
            acc_in_A[894] <= PWDATA[23:16];
            acc_in_A[895] <= PWDATA[31:24];
          end
          225:
          begin
            acc_in_A[896] <= PWDATA[7:0];
            acc_in_A[897] <= PWDATA[15:8];
            acc_in_A[898] <= PWDATA[23:16];
            acc_in_A[899] <= PWDATA[31:24];
          end
          226:
          begin
            acc_in_A[900] <= PWDATA[7:0];
            acc_in_A[901] <= PWDATA[15:8];
            acc_in_A[902] <= PWDATA[23:16];
            acc_in_A[903] <= PWDATA[31:24];
          end
          227:
          begin
            acc_in_A[904] <= PWDATA[7:0];
            acc_in_A[905] <= PWDATA[15:8];
            acc_in_A[906] <= PWDATA[23:16];
            acc_in_A[907] <= PWDATA[31:24];
          end
          228:
          begin
            acc_in_A[908] <= PWDATA[7:0];
            acc_in_A[909] <= PWDATA[15:8];
            acc_in_A[910] <= PWDATA[23:16];
            acc_in_A[911] <= PWDATA[31:24];
          end
          229:
          begin
            acc_in_A[912] <= PWDATA[7:0];
            acc_in_A[913] <= PWDATA[15:8];
            acc_in_A[914] <= PWDATA[23:16];
            acc_in_A[915] <= PWDATA[31:24];
          end
          230:
          begin
            acc_in_A[916] <= PWDATA[7:0];
            acc_in_A[917] <= PWDATA[15:8];
            acc_in_A[918] <= PWDATA[23:16];
            acc_in_A[919] <= PWDATA[31:24];
          end
          231:
          begin
            acc_in_A[920] <= PWDATA[7:0];
            acc_in_A[921] <= PWDATA[15:8];
            acc_in_A[922] <= PWDATA[23:16];
            acc_in_A[923] <= PWDATA[31:24];
          end
          232:
          begin
            acc_in_A[924] <= PWDATA[7:0];
            acc_in_A[925] <= PWDATA[15:8];
            acc_in_A[926] <= PWDATA[23:16];
            acc_in_A[927] <= PWDATA[31:24];
          end
          233:
          begin
            acc_in_A[928] <= PWDATA[7:0];
            acc_in_A[929] <= PWDATA[15:8];
            acc_in_A[930] <= PWDATA[23:16];
            acc_in_A[931] <= PWDATA[31:24];
          end
          234:
          begin
            acc_in_A[932] <= PWDATA[7:0];
            acc_in_A[933] <= PWDATA[15:8];
            acc_in_A[934] <= PWDATA[23:16];
            acc_in_A[935] <= PWDATA[31:24];
          end
          235:
          begin
            acc_in_A[936] <= PWDATA[7:0];
            acc_in_A[937] <= PWDATA[15:8];
            acc_in_A[938] <= PWDATA[23:16];
            acc_in_A[939] <= PWDATA[31:24];
          end
          236:
          begin
            acc_in_A[940] <= PWDATA[7:0];
            acc_in_A[941] <= PWDATA[15:8];
            acc_in_A[942] <= PWDATA[23:16];
            acc_in_A[943] <= PWDATA[31:24];
          end
          237:
          begin
            acc_in_A[944] <= PWDATA[7:0];
            acc_in_A[945] <= PWDATA[15:8];
            acc_in_A[946] <= PWDATA[23:16];
            acc_in_A[947] <= PWDATA[31:24];
          end
          238:
          begin
            acc_in_A[948] <= PWDATA[7:0];
            acc_in_A[949] <= PWDATA[15:8];
            acc_in_A[950] <= PWDATA[23:16];
            acc_in_A[951] <= PWDATA[31:24];
          end
          239:
          begin
            acc_in_A[952] <= PWDATA[7:0];
            acc_in_A[953] <= PWDATA[15:8];
            acc_in_A[954] <= PWDATA[23:16];
            acc_in_A[955] <= PWDATA[31:24];
          end
          240:
          begin
            acc_in_A[956] <= PWDATA[7:0];
            acc_in_A[957] <= PWDATA[15:8];
            acc_in_A[958] <= PWDATA[23:16];
            acc_in_A[959] <= PWDATA[31:24];
          end
          241:
          begin
            acc_in_A[960] <= PWDATA[7:0];
            acc_in_A[961] <= PWDATA[15:8];
            acc_in_A[962] <= PWDATA[23:16];
            acc_in_A[963] <= PWDATA[31:24];
          end
          242:
          begin
            acc_in_A[964] <= PWDATA[7:0];
            acc_in_A[965] <= PWDATA[15:8];
            acc_in_A[966] <= PWDATA[23:16];
            acc_in_A[967] <= PWDATA[31:24];
          end
          243:
          begin
            acc_in_A[968] <= PWDATA[7:0];
            acc_in_A[969] <= PWDATA[15:8];
            acc_in_A[970] <= PWDATA[23:16];
            acc_in_A[971] <= PWDATA[31:24];
          end
          244:
          begin
            acc_in_A[972] <= PWDATA[7:0];
            acc_in_A[973] <= PWDATA[15:8];
            acc_in_A[974] <= PWDATA[23:16];
            acc_in_A[975] <= PWDATA[31:24];
          end
          245:
          begin
            acc_in_A[976] <= PWDATA[7:0];
            acc_in_A[977] <= PWDATA[15:8];
            acc_in_A[978] <= PWDATA[23:16];
            acc_in_A[979] <= PWDATA[31:24];
          end
          246:
          begin
            acc_in_A[980] <= PWDATA[7:0];
            acc_in_A[981] <= PWDATA[15:8];
            acc_in_A[982] <= PWDATA[23:16];
            acc_in_A[983] <= PWDATA[31:24];
          end
          247:
          begin
            acc_in_A[984] <= PWDATA[7:0];
            acc_in_A[985] <= PWDATA[15:8];
            acc_in_A[986] <= PWDATA[23:16];
            acc_in_A[987] <= PWDATA[31:24];
          end
          248:
          begin
            acc_in_A[988] <= PWDATA[7:0];
            acc_in_A[989] <= PWDATA[15:8];
            acc_in_A[990] <= PWDATA[23:16];
            acc_in_A[991] <= PWDATA[31:24];
          end
          249:
          begin
            acc_in_A[992] <= PWDATA[7:0];
            acc_in_A[993] <= PWDATA[15:8];
            acc_in_A[994] <= PWDATA[23:16];
            acc_in_A[995] <= PWDATA[31:24];
          end
          250:
          begin
            acc_in_A[996] <= PWDATA[7:0];
            acc_in_A[997] <= PWDATA[15:8];
            acc_in_A[998] <= PWDATA[23:16];
            acc_in_A[999] <= PWDATA[31:24];
          end
          251:
          begin
            acc_in_A[1000] <= PWDATA[7:0];
            acc_in_A[1001] <= PWDATA[15:8];
            acc_in_A[1002] <= PWDATA[23:16];
            acc_in_A[1003] <= PWDATA[31:24];
          end
          252:
          begin
            acc_in_A[1004] <= PWDATA[7:0];
            acc_in_A[1005] <= PWDATA[15:8];
            acc_in_A[1006] <= PWDATA[23:16];
            acc_in_A[1007] <= PWDATA[31:24];
          end
          253:
          begin
            acc_in_A[1008] <= PWDATA[7:0];
            acc_in_A[1009] <= PWDATA[15:8];
            acc_in_A[1010] <= PWDATA[23:16];
            acc_in_A[1011] <= PWDATA[31:24];
          end
          254:
          begin
            acc_in_A[1012] <= PWDATA[7:0];
            acc_in_A[1013] <= PWDATA[15:8];
            acc_in_A[1014] <= PWDATA[23:16];
            acc_in_A[1015] <= PWDATA[31:24];
          end
          255:
          begin
            acc_in_A[1016] <= PWDATA[7:0];
            acc_in_A[1017] <= PWDATA[15:8];
            acc_in_A[1018] <= PWDATA[23:16];
            acc_in_A[1019] <= PWDATA[31:24];
          end
          256:
          begin
            acc_in_A[1020] <= PWDATA[7:0];
            acc_in_A[1021] <= PWDATA[15:8];
            acc_in_A[1022] <= PWDATA[23:16];
            acc_in_A[1023] <= PWDATA[31:24];
          end
          257:
          begin
            acc_in_B[0] <= PWDATA[7:0];
            acc_in_B[1] <= PWDATA[15:8];
            acc_in_B[2] <= PWDATA[23:16];
            acc_in_B[3] <= PWDATA[31:24];
          end
          258:
          begin
            acc_in_B[4] <= PWDATA[7:0];
            acc_in_B[5] <= PWDATA[15:8];
            acc_in_B[6] <= PWDATA[23:16];
            acc_in_B[7] <= PWDATA[31:24];
          end
          259:
          begin
            acc_in_B[8] <= PWDATA[7:0];
            acc_in_B[9] <= PWDATA[15:8];
            acc_in_B[10] <= PWDATA[23:16];
            acc_in_B[11] <= PWDATA[31:24];
          end
          260:
          begin
            acc_in_B[12] <= PWDATA[7:0];
            acc_in_B[13] <= PWDATA[15:8];
            acc_in_B[14] <= PWDATA[23:16];
            acc_in_B[15] <= PWDATA[31:24];
          end
          261:
          begin
            acc_in_B[16] <= PWDATA[7:0];
            acc_in_B[17] <= PWDATA[15:8];
            acc_in_B[18] <= PWDATA[23:16];
            acc_in_B[19] <= PWDATA[31:24];
          end
          262:
          begin
            acc_in_B[20] <= PWDATA[7:0];
            acc_in_B[21] <= PWDATA[15:8];
            acc_in_B[22] <= PWDATA[23:16];
            acc_in_B[23] <= PWDATA[31:24];
          end
          263:
          begin
            acc_in_B[24] <= PWDATA[7:0];
            acc_in_B[25] <= PWDATA[15:8];
            acc_in_B[26] <= PWDATA[23:16];
            acc_in_B[27] <= PWDATA[31:24];
          end
          264:
          begin
            acc_in_B[28] <= PWDATA[7:0];
            acc_in_B[29] <= PWDATA[15:8];
            acc_in_B[30] <= PWDATA[23:16];
            acc_in_B[31] <= PWDATA[31:24];
          end
          265:
          begin
            acc_in_B[32] <= PWDATA[7:0];
            acc_in_B[33] <= PWDATA[15:8];
            acc_in_B[34] <= PWDATA[23:16];
            acc_in_B[35] <= PWDATA[31:24];
          end
          266:
          begin
            acc_in_B[36] <= PWDATA[7:0];
            acc_in_B[37] <= PWDATA[15:8];
            acc_in_B[38] <= PWDATA[23:16];
            acc_in_B[39] <= PWDATA[31:24];
          end
          267:
          begin
            acc_in_B[40] <= PWDATA[7:0];
            acc_in_B[41] <= PWDATA[15:8];
            acc_in_B[42] <= PWDATA[23:16];
            acc_in_B[43] <= PWDATA[31:24];
          end
          268:
          begin
            acc_in_B[44] <= PWDATA[7:0];
            acc_in_B[45] <= PWDATA[15:8];
            acc_in_B[46] <= PWDATA[23:16];
            acc_in_B[47] <= PWDATA[31:24];
          end
          269:
          begin
            acc_in_B[48] <= PWDATA[7:0];
            acc_in_B[49] <= PWDATA[15:8];
            acc_in_B[50] <= PWDATA[23:16];
            acc_in_B[51] <= PWDATA[31:24];
          end
          270:
          begin
            acc_in_B[52] <= PWDATA[7:0];
            acc_in_B[53] <= PWDATA[15:8];
            acc_in_B[54] <= PWDATA[23:16];
            acc_in_B[55] <= PWDATA[31:24];
          end
          271:
          begin
            acc_in_B[56] <= PWDATA[7:0];
            acc_in_B[57] <= PWDATA[15:8];
            acc_in_B[58] <= PWDATA[23:16];
            acc_in_B[59] <= PWDATA[31:24];
          end
          272:
          begin
            acc_in_B[60] <= PWDATA[7:0];
            acc_in_B[61] <= PWDATA[15:8];
            acc_in_B[62] <= PWDATA[23:16];
            acc_in_B[63] <= PWDATA[31:24];
          end
          273:
          begin
            acc_in_B[64] <= PWDATA[7:0];
            acc_in_B[65] <= PWDATA[15:8];
            acc_in_B[66] <= PWDATA[23:16];
            acc_in_B[67] <= PWDATA[31:24];
          end
          274:
          begin
            acc_in_B[68] <= PWDATA[7:0];
            acc_in_B[69] <= PWDATA[15:8];
            acc_in_B[70] <= PWDATA[23:16];
            acc_in_B[71] <= PWDATA[31:24];
          end
          275:
          begin
            acc_in_B[72] <= PWDATA[7:0];
            acc_in_B[73] <= PWDATA[15:8];
            acc_in_B[74] <= PWDATA[23:16];
            acc_in_B[75] <= PWDATA[31:24];
          end
          276:
          begin
            acc_in_B[76] <= PWDATA[7:0];
            acc_in_B[77] <= PWDATA[15:8];
            acc_in_B[78] <= PWDATA[23:16];
            acc_in_B[79] <= PWDATA[31:24];
          end
          277:
          begin
            acc_in_B[80] <= PWDATA[7:0];
            acc_in_B[81] <= PWDATA[15:8];
            acc_in_B[82] <= PWDATA[23:16];
            acc_in_B[83] <= PWDATA[31:24];
          end
          278:
          begin
            acc_in_B[84] <= PWDATA[7:0];
            acc_in_B[85] <= PWDATA[15:8];
            acc_in_B[86] <= PWDATA[23:16];
            acc_in_B[87] <= PWDATA[31:24];
          end
          279:
          begin
            acc_in_B[88] <= PWDATA[7:0];
            acc_in_B[89] <= PWDATA[15:8];
            acc_in_B[90] <= PWDATA[23:16];
            acc_in_B[91] <= PWDATA[31:24];
          end
          280:
          begin
            acc_in_B[92] <= PWDATA[7:0];
            acc_in_B[93] <= PWDATA[15:8];
            acc_in_B[94] <= PWDATA[23:16];
            acc_in_B[95] <= PWDATA[31:24];
          end
          281:
          begin
            acc_in_B[96] <= PWDATA[7:0];
            acc_in_B[97] <= PWDATA[15:8];
            acc_in_B[98] <= PWDATA[23:16];
            acc_in_B[99] <= PWDATA[31:24];
          end
          282:
          begin
            acc_in_B[100] <= PWDATA[7:0];
            acc_in_B[101] <= PWDATA[15:8];
            acc_in_B[102] <= PWDATA[23:16];
            acc_in_B[103] <= PWDATA[31:24];
          end
          283:
          begin
            acc_in_B[104] <= PWDATA[7:0];
            acc_in_B[105] <= PWDATA[15:8];
            acc_in_B[106] <= PWDATA[23:16];
            acc_in_B[107] <= PWDATA[31:24];
          end
          284:
          begin
            acc_in_B[108] <= PWDATA[7:0];
            acc_in_B[109] <= PWDATA[15:8];
            acc_in_B[110] <= PWDATA[23:16];
            acc_in_B[111] <= PWDATA[31:24];
          end
          285:
          begin
            acc_in_B[112] <= PWDATA[7:0];
            acc_in_B[113] <= PWDATA[15:8];
            acc_in_B[114] <= PWDATA[23:16];
            acc_in_B[115] <= PWDATA[31:24];
          end
          286:
          begin
            acc_in_B[116] <= PWDATA[7:0];
            acc_in_B[117] <= PWDATA[15:8];
            acc_in_B[118] <= PWDATA[23:16];
            acc_in_B[119] <= PWDATA[31:24];
          end
          287:
          begin
            acc_in_B[120] <= PWDATA[7:0];
            acc_in_B[121] <= PWDATA[15:8];
            acc_in_B[122] <= PWDATA[23:16];
            acc_in_B[123] <= PWDATA[31:24];
          end
          288:
          begin
            acc_in_B[124] <= PWDATA[7:0];
            acc_in_B[125] <= PWDATA[15:8];
            acc_in_B[126] <= PWDATA[23:16];
            acc_in_B[127] <= PWDATA[31:24];
          end
          289:
          begin
            acc_in_B[128] <= PWDATA[7:0];
            acc_in_B[129] <= PWDATA[15:8];
            acc_in_B[130] <= PWDATA[23:16];
            acc_in_B[131] <= PWDATA[31:24];
          end
          290:
          begin
            acc_in_B[132] <= PWDATA[7:0];
            acc_in_B[133] <= PWDATA[15:8];
            acc_in_B[134] <= PWDATA[23:16];
            acc_in_B[135] <= PWDATA[31:24];
          end
          291:
          begin
            acc_in_B[136] <= PWDATA[7:0];
            acc_in_B[137] <= PWDATA[15:8];
            acc_in_B[138] <= PWDATA[23:16];
            acc_in_B[139] <= PWDATA[31:24];
          end
          292:
          begin
            acc_in_B[140] <= PWDATA[7:0];
            acc_in_B[141] <= PWDATA[15:8];
            acc_in_B[142] <= PWDATA[23:16];
            acc_in_B[143] <= PWDATA[31:24];
          end
          293:
          begin
            acc_in_B[144] <= PWDATA[7:0];
            acc_in_B[145] <= PWDATA[15:8];
            acc_in_B[146] <= PWDATA[23:16];
            acc_in_B[147] <= PWDATA[31:24];
          end
          294:
          begin
            acc_in_B[148] <= PWDATA[7:0];
            acc_in_B[149] <= PWDATA[15:8];
            acc_in_B[150] <= PWDATA[23:16];
            acc_in_B[151] <= PWDATA[31:24];
          end
          295:
          begin
            acc_in_B[152] <= PWDATA[7:0];
            acc_in_B[153] <= PWDATA[15:8];
            acc_in_B[154] <= PWDATA[23:16];
            acc_in_B[155] <= PWDATA[31:24];
          end
          296:
          begin
            acc_in_B[156] <= PWDATA[7:0];
            acc_in_B[157] <= PWDATA[15:8];
            acc_in_B[158] <= PWDATA[23:16];
            acc_in_B[159] <= PWDATA[31:24];
          end
          297:
          begin
            acc_in_B[160] <= PWDATA[7:0];
            acc_in_B[161] <= PWDATA[15:8];
            acc_in_B[162] <= PWDATA[23:16];
            acc_in_B[163] <= PWDATA[31:24];
          end
          298:
          begin
            acc_in_B[164] <= PWDATA[7:0];
            acc_in_B[165] <= PWDATA[15:8];
            acc_in_B[166] <= PWDATA[23:16];
            acc_in_B[167] <= PWDATA[31:24];
          end
          299:
          begin
            acc_in_B[168] <= PWDATA[7:0];
            acc_in_B[169] <= PWDATA[15:8];
            acc_in_B[170] <= PWDATA[23:16];
            acc_in_B[171] <= PWDATA[31:24];
          end
          300:
          begin
            acc_in_B[172] <= PWDATA[7:0];
            acc_in_B[173] <= PWDATA[15:8];
            acc_in_B[174] <= PWDATA[23:16];
            acc_in_B[175] <= PWDATA[31:24];
          end
          301:
          begin
            acc_in_B[176] <= PWDATA[7:0];
            acc_in_B[177] <= PWDATA[15:8];
            acc_in_B[178] <= PWDATA[23:16];
            acc_in_B[179] <= PWDATA[31:24];
          end
          302:
          begin
            acc_in_B[180] <= PWDATA[7:0];
            acc_in_B[181] <= PWDATA[15:8];
            acc_in_B[182] <= PWDATA[23:16];
            acc_in_B[183] <= PWDATA[31:24];
          end
          303:
          begin
            acc_in_B[184] <= PWDATA[7:0];
            acc_in_B[185] <= PWDATA[15:8];
            acc_in_B[186] <= PWDATA[23:16];
            acc_in_B[187] <= PWDATA[31:24];
          end
          304:
          begin
            acc_in_B[188] <= PWDATA[7:0];
            acc_in_B[189] <= PWDATA[15:8];
            acc_in_B[190] <= PWDATA[23:16];
            acc_in_B[191] <= PWDATA[31:24];
          end
          305:
          begin
            acc_in_B[192] <= PWDATA[7:0];
            acc_in_B[193] <= PWDATA[15:8];
            acc_in_B[194] <= PWDATA[23:16];
            acc_in_B[195] <= PWDATA[31:24];
          end
          306:
          begin
            acc_in_B[196] <= PWDATA[7:0];
            acc_in_B[197] <= PWDATA[15:8];
            acc_in_B[198] <= PWDATA[23:16];
            acc_in_B[199] <= PWDATA[31:24];
          end
          307:
          begin
            acc_in_B[200] <= PWDATA[7:0];
            acc_in_B[201] <= PWDATA[15:8];
            acc_in_B[202] <= PWDATA[23:16];
            acc_in_B[203] <= PWDATA[31:24];
          end
          308:
          begin
            acc_in_B[204] <= PWDATA[7:0];
            acc_in_B[205] <= PWDATA[15:8];
            acc_in_B[206] <= PWDATA[23:16];
            acc_in_B[207] <= PWDATA[31:24];
          end
          309:
          begin
            acc_in_B[208] <= PWDATA[7:0];
            acc_in_B[209] <= PWDATA[15:8];
            acc_in_B[210] <= PWDATA[23:16];
            acc_in_B[211] <= PWDATA[31:24];
          end
          310:
          begin
            acc_in_B[212] <= PWDATA[7:0];
            acc_in_B[213] <= PWDATA[15:8];
            acc_in_B[214] <= PWDATA[23:16];
            acc_in_B[215] <= PWDATA[31:24];
          end
          311:
          begin
            acc_in_B[216] <= PWDATA[7:0];
            acc_in_B[217] <= PWDATA[15:8];
            acc_in_B[218] <= PWDATA[23:16];
            acc_in_B[219] <= PWDATA[31:24];
          end
          312:
          begin
            acc_in_B[220] <= PWDATA[7:0];
            acc_in_B[221] <= PWDATA[15:8];
            acc_in_B[222] <= PWDATA[23:16];
            acc_in_B[223] <= PWDATA[31:24];
          end
          313:
          begin
            acc_in_B[224] <= PWDATA[7:0];
            acc_in_B[225] <= PWDATA[15:8];
            acc_in_B[226] <= PWDATA[23:16];
            acc_in_B[227] <= PWDATA[31:24];
          end
          314:
          begin
            acc_in_B[228] <= PWDATA[7:0];
            acc_in_B[229] <= PWDATA[15:8];
            acc_in_B[230] <= PWDATA[23:16];
            acc_in_B[231] <= PWDATA[31:24];
          end
          315:
          begin
            acc_in_B[232] <= PWDATA[7:0];
            acc_in_B[233] <= PWDATA[15:8];
            acc_in_B[234] <= PWDATA[23:16];
            acc_in_B[235] <= PWDATA[31:24];
          end
          316:
          begin
            acc_in_B[236] <= PWDATA[7:0];
            acc_in_B[237] <= PWDATA[15:8];
            acc_in_B[238] <= PWDATA[23:16];
            acc_in_B[239] <= PWDATA[31:24];
          end
          317:
          begin
            acc_in_B[240] <= PWDATA[7:0];
            acc_in_B[241] <= PWDATA[15:8];
            acc_in_B[242] <= PWDATA[23:16];
            acc_in_B[243] <= PWDATA[31:24];
          end
          318:
          begin
            acc_in_B[244] <= PWDATA[7:0];
            acc_in_B[245] <= PWDATA[15:8];
            acc_in_B[246] <= PWDATA[23:16];
            acc_in_B[247] <= PWDATA[31:24];
          end
          319:
          begin
            acc_in_B[248] <= PWDATA[7:0];
            acc_in_B[249] <= PWDATA[15:8];
            acc_in_B[250] <= PWDATA[23:16];
            acc_in_B[251] <= PWDATA[31:24];
          end
          320:
          begin
            acc_in_B[252] <= PWDATA[7:0];
            acc_in_B[253] <= PWDATA[15:8];
            acc_in_B[254] <= PWDATA[23:16];
            acc_in_B[255] <= PWDATA[31:24];
          end
          321:
          begin
            acc_in_B[256] <= PWDATA[7:0];
            acc_in_B[257] <= PWDATA[15:8];
            acc_in_B[258] <= PWDATA[23:16];
            acc_in_B[259] <= PWDATA[31:24];
          end
          322:
          begin
            acc_in_B[260] <= PWDATA[7:0];
            acc_in_B[261] <= PWDATA[15:8];
            acc_in_B[262] <= PWDATA[23:16];
            acc_in_B[263] <= PWDATA[31:24];
          end
          323:
          begin
            acc_in_B[264] <= PWDATA[7:0];
            acc_in_B[265] <= PWDATA[15:8];
            acc_in_B[266] <= PWDATA[23:16];
            acc_in_B[267] <= PWDATA[31:24];
          end
          324:
          begin
            acc_in_B[268] <= PWDATA[7:0];
            acc_in_B[269] <= PWDATA[15:8];
            acc_in_B[270] <= PWDATA[23:16];
            acc_in_B[271] <= PWDATA[31:24];
          end
          325:
          begin
            acc_in_B[272] <= PWDATA[7:0];
            acc_in_B[273] <= PWDATA[15:8];
            acc_in_B[274] <= PWDATA[23:16];
            acc_in_B[275] <= PWDATA[31:24];
          end
          326:
          begin
            acc_in_B[276] <= PWDATA[7:0];
            acc_in_B[277] <= PWDATA[15:8];
            acc_in_B[278] <= PWDATA[23:16];
            acc_in_B[279] <= PWDATA[31:24];
          end
          327:
          begin
            acc_in_B[280] <= PWDATA[7:0];
            acc_in_B[281] <= PWDATA[15:8];
            acc_in_B[282] <= PWDATA[23:16];
            acc_in_B[283] <= PWDATA[31:24];
          end
          328:
          begin
            acc_in_B[284] <= PWDATA[7:0];
            acc_in_B[285] <= PWDATA[15:8];
            acc_in_B[286] <= PWDATA[23:16];
            acc_in_B[287] <= PWDATA[31:24];
          end
          329:
          begin
            acc_in_B[288] <= PWDATA[7:0];
            acc_in_B[289] <= PWDATA[15:8];
            acc_in_B[290] <= PWDATA[23:16];
            acc_in_B[291] <= PWDATA[31:24];
          end
          330:
          begin
            acc_in_B[292] <= PWDATA[7:0];
            acc_in_B[293] <= PWDATA[15:8];
            acc_in_B[294] <= PWDATA[23:16];
            acc_in_B[295] <= PWDATA[31:24];
          end
          331:
          begin
            acc_in_B[296] <= PWDATA[7:0];
            acc_in_B[297] <= PWDATA[15:8];
            acc_in_B[298] <= PWDATA[23:16];
            acc_in_B[299] <= PWDATA[31:24];
          end
          332:
          begin
            acc_in_B[300] <= PWDATA[7:0];
            acc_in_B[301] <= PWDATA[15:8];
            acc_in_B[302] <= PWDATA[23:16];
            acc_in_B[303] <= PWDATA[31:24];
          end
          333:
          begin
            acc_in_B[304] <= PWDATA[7:0];
            acc_in_B[305] <= PWDATA[15:8];
            acc_in_B[306] <= PWDATA[23:16];
            acc_in_B[307] <= PWDATA[31:24];
          end
          334:
          begin
            acc_in_B[308] <= PWDATA[7:0];
            acc_in_B[309] <= PWDATA[15:8];
            acc_in_B[310] <= PWDATA[23:16];
            acc_in_B[311] <= PWDATA[31:24];
          end
          335:
          begin
            acc_in_B[312] <= PWDATA[7:0];
            acc_in_B[313] <= PWDATA[15:8];
            acc_in_B[314] <= PWDATA[23:16];
            acc_in_B[315] <= PWDATA[31:24];
          end
          336:
          begin
            acc_in_B[316] <= PWDATA[7:0];
            acc_in_B[317] <= PWDATA[15:8];
            acc_in_B[318] <= PWDATA[23:16];
            acc_in_B[319] <= PWDATA[31:24];
          end
          337:
          begin
            acc_in_B[320] <= PWDATA[7:0];
            acc_in_B[321] <= PWDATA[15:8];
            acc_in_B[322] <= PWDATA[23:16];
            acc_in_B[323] <= PWDATA[31:24];
          end
          338:
          begin
            acc_in_B[324] <= PWDATA[7:0];
            acc_in_B[325] <= PWDATA[15:8];
            acc_in_B[326] <= PWDATA[23:16];
            acc_in_B[327] <= PWDATA[31:24];
          end
          339:
          begin
            acc_in_B[328] <= PWDATA[7:0];
            acc_in_B[329] <= PWDATA[15:8];
            acc_in_B[330] <= PWDATA[23:16];
            acc_in_B[331] <= PWDATA[31:24];
          end
          340:
          begin
            acc_in_B[332] <= PWDATA[7:0];
            acc_in_B[333] <= PWDATA[15:8];
            acc_in_B[334] <= PWDATA[23:16];
            acc_in_B[335] <= PWDATA[31:24];
          end
          341:
          begin
            acc_in_B[336] <= PWDATA[7:0];
            acc_in_B[337] <= PWDATA[15:8];
            acc_in_B[338] <= PWDATA[23:16];
            acc_in_B[339] <= PWDATA[31:24];
          end
          342:
          begin
            acc_in_B[340] <= PWDATA[7:0];
            acc_in_B[341] <= PWDATA[15:8];
            acc_in_B[342] <= PWDATA[23:16];
            acc_in_B[343] <= PWDATA[31:24];
          end
          343:
          begin
            acc_in_B[344] <= PWDATA[7:0];
            acc_in_B[345] <= PWDATA[15:8];
            acc_in_B[346] <= PWDATA[23:16];
            acc_in_B[347] <= PWDATA[31:24];
          end
          344:
          begin
            acc_in_B[348] <= PWDATA[7:0];
            acc_in_B[349] <= PWDATA[15:8];
            acc_in_B[350] <= PWDATA[23:16];
            acc_in_B[351] <= PWDATA[31:24];
          end
          345:
          begin
            acc_in_B[352] <= PWDATA[7:0];
            acc_in_B[353] <= PWDATA[15:8];
            acc_in_B[354] <= PWDATA[23:16];
            acc_in_B[355] <= PWDATA[31:24];
          end
          346:
          begin
            acc_in_B[356] <= PWDATA[7:0];
            acc_in_B[357] <= PWDATA[15:8];
            acc_in_B[358] <= PWDATA[23:16];
            acc_in_B[359] <= PWDATA[31:24];
          end
          347:
          begin
            acc_in_B[360] <= PWDATA[7:0];
            acc_in_B[361] <= PWDATA[15:8];
            acc_in_B[362] <= PWDATA[23:16];
            acc_in_B[363] <= PWDATA[31:24];
          end
          348:
          begin
            acc_in_B[364] <= PWDATA[7:0];
            acc_in_B[365] <= PWDATA[15:8];
            acc_in_B[366] <= PWDATA[23:16];
            acc_in_B[367] <= PWDATA[31:24];
          end
          349:
          begin
            acc_in_B[368] <= PWDATA[7:0];
            acc_in_B[369] <= PWDATA[15:8];
            acc_in_B[370] <= PWDATA[23:16];
            acc_in_B[371] <= PWDATA[31:24];
          end
          350:
          begin
            acc_in_B[372] <= PWDATA[7:0];
            acc_in_B[373] <= PWDATA[15:8];
            acc_in_B[374] <= PWDATA[23:16];
            acc_in_B[375] <= PWDATA[31:24];
          end
          351:
          begin
            acc_in_B[376] <= PWDATA[7:0];
            acc_in_B[377] <= PWDATA[15:8];
            acc_in_B[378] <= PWDATA[23:16];
            acc_in_B[379] <= PWDATA[31:24];
          end
          352:
          begin
            acc_in_B[380] <= PWDATA[7:0];
            acc_in_B[381] <= PWDATA[15:8];
            acc_in_B[382] <= PWDATA[23:16];
            acc_in_B[383] <= PWDATA[31:24];
          end
          353:
          begin
            acc_in_B[384] <= PWDATA[7:0];
            acc_in_B[385] <= PWDATA[15:8];
            acc_in_B[386] <= PWDATA[23:16];
            acc_in_B[387] <= PWDATA[31:24];
          end
          354:
          begin
            acc_in_B[388] <= PWDATA[7:0];
            acc_in_B[389] <= PWDATA[15:8];
            acc_in_B[390] <= PWDATA[23:16];
            acc_in_B[391] <= PWDATA[31:24];
          end
          355:
          begin
            acc_in_B[392] <= PWDATA[7:0];
            acc_in_B[393] <= PWDATA[15:8];
            acc_in_B[394] <= PWDATA[23:16];
            acc_in_B[395] <= PWDATA[31:24];
          end
          356:
          begin
            acc_in_B[396] <= PWDATA[7:0];
            acc_in_B[397] <= PWDATA[15:8];
            acc_in_B[398] <= PWDATA[23:16];
            acc_in_B[399] <= PWDATA[31:24];
          end
          357:
          begin
            acc_in_B[400] <= PWDATA[7:0];
            acc_in_B[401] <= PWDATA[15:8];
            acc_in_B[402] <= PWDATA[23:16];
            acc_in_B[403] <= PWDATA[31:24];
          end
          358:
          begin
            acc_in_B[404] <= PWDATA[7:0];
            acc_in_B[405] <= PWDATA[15:8];
            acc_in_B[406] <= PWDATA[23:16];
            acc_in_B[407] <= PWDATA[31:24];
          end
          359:
          begin
            acc_in_B[408] <= PWDATA[7:0];
            acc_in_B[409] <= PWDATA[15:8];
            acc_in_B[410] <= PWDATA[23:16];
            acc_in_B[411] <= PWDATA[31:24];
          end
          360:
          begin
            acc_in_B[412] <= PWDATA[7:0];
            acc_in_B[413] <= PWDATA[15:8];
            acc_in_B[414] <= PWDATA[23:16];
            acc_in_B[415] <= PWDATA[31:24];
          end
          361:
          begin
            acc_in_B[416] <= PWDATA[7:0];
            acc_in_B[417] <= PWDATA[15:8];
            acc_in_B[418] <= PWDATA[23:16];
            acc_in_B[419] <= PWDATA[31:24];
          end
          362:
          begin
            acc_in_B[420] <= PWDATA[7:0];
            acc_in_B[421] <= PWDATA[15:8];
            acc_in_B[422] <= PWDATA[23:16];
            acc_in_B[423] <= PWDATA[31:24];
          end
          363:
          begin
            acc_in_B[424] <= PWDATA[7:0];
            acc_in_B[425] <= PWDATA[15:8];
            acc_in_B[426] <= PWDATA[23:16];
            acc_in_B[427] <= PWDATA[31:24];
          end
          364:
          begin
            acc_in_B[428] <= PWDATA[7:0];
            acc_in_B[429] <= PWDATA[15:8];
            acc_in_B[430] <= PWDATA[23:16];
            acc_in_B[431] <= PWDATA[31:24];
          end
          365:
          begin
            acc_in_B[432] <= PWDATA[7:0];
            acc_in_B[433] <= PWDATA[15:8];
            acc_in_B[434] <= PWDATA[23:16];
            acc_in_B[435] <= PWDATA[31:24];
          end
          366:
          begin
            acc_in_B[436] <= PWDATA[7:0];
            acc_in_B[437] <= PWDATA[15:8];
            acc_in_B[438] <= PWDATA[23:16];
            acc_in_B[439] <= PWDATA[31:24];
          end
          367:
          begin
            acc_in_B[440] <= PWDATA[7:0];
            acc_in_B[441] <= PWDATA[15:8];
            acc_in_B[442] <= PWDATA[23:16];
            acc_in_B[443] <= PWDATA[31:24];
          end
          368:
          begin
            acc_in_B[444] <= PWDATA[7:0];
            acc_in_B[445] <= PWDATA[15:8];
            acc_in_B[446] <= PWDATA[23:16];
            acc_in_B[447] <= PWDATA[31:24];
          end
          369:
          begin
            acc_in_B[448] <= PWDATA[7:0];
            acc_in_B[449] <= PWDATA[15:8];
            acc_in_B[450] <= PWDATA[23:16];
            acc_in_B[451] <= PWDATA[31:24];
          end
          370:
          begin
            acc_in_B[452] <= PWDATA[7:0];
            acc_in_B[453] <= PWDATA[15:8];
            acc_in_B[454] <= PWDATA[23:16];
            acc_in_B[455] <= PWDATA[31:24];
          end
          371:
          begin
            acc_in_B[456] <= PWDATA[7:0];
            acc_in_B[457] <= PWDATA[15:8];
            acc_in_B[458] <= PWDATA[23:16];
            acc_in_B[459] <= PWDATA[31:24];
          end
          372:
          begin
            acc_in_B[460] <= PWDATA[7:0];
            acc_in_B[461] <= PWDATA[15:8];
            acc_in_B[462] <= PWDATA[23:16];
            acc_in_B[463] <= PWDATA[31:24];
          end
          373:
          begin
            acc_in_B[464] <= PWDATA[7:0];
            acc_in_B[465] <= PWDATA[15:8];
            acc_in_B[466] <= PWDATA[23:16];
            acc_in_B[467] <= PWDATA[31:24];
          end
          374:
          begin
            acc_in_B[468] <= PWDATA[7:0];
            acc_in_B[469] <= PWDATA[15:8];
            acc_in_B[470] <= PWDATA[23:16];
            acc_in_B[471] <= PWDATA[31:24];
          end
          375:
          begin
            acc_in_B[472] <= PWDATA[7:0];
            acc_in_B[473] <= PWDATA[15:8];
            acc_in_B[474] <= PWDATA[23:16];
            acc_in_B[475] <= PWDATA[31:24];
          end
          376:
          begin
            acc_in_B[476] <= PWDATA[7:0];
            acc_in_B[477] <= PWDATA[15:8];
            acc_in_B[478] <= PWDATA[23:16];
            acc_in_B[479] <= PWDATA[31:24];
          end
          377:
          begin
            acc_in_B[480] <= PWDATA[7:0];
            acc_in_B[481] <= PWDATA[15:8];
            acc_in_B[482] <= PWDATA[23:16];
            acc_in_B[483] <= PWDATA[31:24];
          end
          378:
          begin
            acc_in_B[484] <= PWDATA[7:0];
            acc_in_B[485] <= PWDATA[15:8];
            acc_in_B[486] <= PWDATA[23:16];
            acc_in_B[487] <= PWDATA[31:24];
          end
          379:
          begin
            acc_in_B[488] <= PWDATA[7:0];
            acc_in_B[489] <= PWDATA[15:8];
            acc_in_B[490] <= PWDATA[23:16];
            acc_in_B[491] <= PWDATA[31:24];
          end
          380:
          begin
            acc_in_B[492] <= PWDATA[7:0];
            acc_in_B[493] <= PWDATA[15:8];
            acc_in_B[494] <= PWDATA[23:16];
            acc_in_B[495] <= PWDATA[31:24];
          end
          381:
          begin
            acc_in_B[496] <= PWDATA[7:0];
            acc_in_B[497] <= PWDATA[15:8];
            acc_in_B[498] <= PWDATA[23:16];
            acc_in_B[499] <= PWDATA[31:24];
          end
          382:
          begin
            acc_in_B[500] <= PWDATA[7:0];
            acc_in_B[501] <= PWDATA[15:8];
            acc_in_B[502] <= PWDATA[23:16];
            acc_in_B[503] <= PWDATA[31:24];
          end
          383:
          begin
            acc_in_B[504] <= PWDATA[7:0];
            acc_in_B[505] <= PWDATA[15:8];
            acc_in_B[506] <= PWDATA[23:16];
            acc_in_B[507] <= PWDATA[31:24];
          end
          384:
          begin
            acc_in_B[508] <= PWDATA[7:0];
            acc_in_B[509] <= PWDATA[15:8];
            acc_in_B[510] <= PWDATA[23:16];
            acc_in_B[511] <= PWDATA[31:24];
          end
          385:
          begin
            acc_in_B[512] <= PWDATA[7:0];
            acc_in_B[513] <= PWDATA[15:8];
            acc_in_B[514] <= PWDATA[23:16];
            acc_in_B[515] <= PWDATA[31:24];
          end
          386:
          begin
            acc_in_B[516] <= PWDATA[7:0];
            acc_in_B[517] <= PWDATA[15:8];
            acc_in_B[518] <= PWDATA[23:16];
            acc_in_B[519] <= PWDATA[31:24];
          end
          387:
          begin
            acc_in_B[520] <= PWDATA[7:0];
            acc_in_B[521] <= PWDATA[15:8];
            acc_in_B[522] <= PWDATA[23:16];
            acc_in_B[523] <= PWDATA[31:24];
          end
          388:
          begin
            acc_in_B[524] <= PWDATA[7:0];
            acc_in_B[525] <= PWDATA[15:8];
            acc_in_B[526] <= PWDATA[23:16];
            acc_in_B[527] <= PWDATA[31:24];
          end
          389:
          begin
            acc_in_B[528] <= PWDATA[7:0];
            acc_in_B[529] <= PWDATA[15:8];
            acc_in_B[530] <= PWDATA[23:16];
            acc_in_B[531] <= PWDATA[31:24];
          end
          390:
          begin
            acc_in_B[532] <= PWDATA[7:0];
            acc_in_B[533] <= PWDATA[15:8];
            acc_in_B[534] <= PWDATA[23:16];
            acc_in_B[535] <= PWDATA[31:24];
          end
          391:
          begin
            acc_in_B[536] <= PWDATA[7:0];
            acc_in_B[537] <= PWDATA[15:8];
            acc_in_B[538] <= PWDATA[23:16];
            acc_in_B[539] <= PWDATA[31:24];
          end
          392:
          begin
            acc_in_B[540] <= PWDATA[7:0];
            acc_in_B[541] <= PWDATA[15:8];
            acc_in_B[542] <= PWDATA[23:16];
            acc_in_B[543] <= PWDATA[31:24];
          end
          393:
          begin
            acc_in_B[544] <= PWDATA[7:0];
            acc_in_B[545] <= PWDATA[15:8];
            acc_in_B[546] <= PWDATA[23:16];
            acc_in_B[547] <= PWDATA[31:24];
          end
          394:
          begin
            acc_in_B[548] <= PWDATA[7:0];
            acc_in_B[549] <= PWDATA[15:8];
            acc_in_B[550] <= PWDATA[23:16];
            acc_in_B[551] <= PWDATA[31:24];
          end
          395:
          begin
            acc_in_B[552] <= PWDATA[7:0];
            acc_in_B[553] <= PWDATA[15:8];
            acc_in_B[554] <= PWDATA[23:16];
            acc_in_B[555] <= PWDATA[31:24];
          end
          396:
          begin
            acc_in_B[556] <= PWDATA[7:0];
            acc_in_B[557] <= PWDATA[15:8];
            acc_in_B[558] <= PWDATA[23:16];
            acc_in_B[559] <= PWDATA[31:24];
          end
          397:
          begin
            acc_in_B[560] <= PWDATA[7:0];
            acc_in_B[561] <= PWDATA[15:8];
            acc_in_B[562] <= PWDATA[23:16];
            acc_in_B[563] <= PWDATA[31:24];
          end
          398:
          begin
            acc_in_B[564] <= PWDATA[7:0];
            acc_in_B[565] <= PWDATA[15:8];
            acc_in_B[566] <= PWDATA[23:16];
            acc_in_B[567] <= PWDATA[31:24];
          end
          399:
          begin
            acc_in_B[568] <= PWDATA[7:0];
            acc_in_B[569] <= PWDATA[15:8];
            acc_in_B[570] <= PWDATA[23:16];
            acc_in_B[571] <= PWDATA[31:24];
          end
          400:
          begin
            acc_in_B[572] <= PWDATA[7:0];
            acc_in_B[573] <= PWDATA[15:8];
            acc_in_B[574] <= PWDATA[23:16];
            acc_in_B[575] <= PWDATA[31:24];
          end
          401:
          begin
            acc_in_B[576] <= PWDATA[7:0];
            acc_in_B[577] <= PWDATA[15:8];
            acc_in_B[578] <= PWDATA[23:16];
            acc_in_B[579] <= PWDATA[31:24];
          end
          402:
          begin
            acc_in_B[580] <= PWDATA[7:0];
            acc_in_B[581] <= PWDATA[15:8];
            acc_in_B[582] <= PWDATA[23:16];
            acc_in_B[583] <= PWDATA[31:24];
          end
          403:
          begin
            acc_in_B[584] <= PWDATA[7:0];
            acc_in_B[585] <= PWDATA[15:8];
            acc_in_B[586] <= PWDATA[23:16];
            acc_in_B[587] <= PWDATA[31:24];
          end
          404:
          begin
            acc_in_B[588] <= PWDATA[7:0];
            acc_in_B[589] <= PWDATA[15:8];
            acc_in_B[590] <= PWDATA[23:16];
            acc_in_B[591] <= PWDATA[31:24];
          end
          405:
          begin
            acc_in_B[592] <= PWDATA[7:0];
            acc_in_B[593] <= PWDATA[15:8];
            acc_in_B[594] <= PWDATA[23:16];
            acc_in_B[595] <= PWDATA[31:24];
          end
          406:
          begin
            acc_in_B[596] <= PWDATA[7:0];
            acc_in_B[597] <= PWDATA[15:8];
            acc_in_B[598] <= PWDATA[23:16];
            acc_in_B[599] <= PWDATA[31:24];
          end
          407:
          begin
            acc_in_B[600] <= PWDATA[7:0];
            acc_in_B[601] <= PWDATA[15:8];
            acc_in_B[602] <= PWDATA[23:16];
            acc_in_B[603] <= PWDATA[31:24];
          end
          408:
          begin
            acc_in_B[604] <= PWDATA[7:0];
            acc_in_B[605] <= PWDATA[15:8];
            acc_in_B[606] <= PWDATA[23:16];
            acc_in_B[607] <= PWDATA[31:24];
          end
          409:
          begin
            acc_in_B[608] <= PWDATA[7:0];
            acc_in_B[609] <= PWDATA[15:8];
            acc_in_B[610] <= PWDATA[23:16];
            acc_in_B[611] <= PWDATA[31:24];
          end
          410:
          begin
            acc_in_B[612] <= PWDATA[7:0];
            acc_in_B[613] <= PWDATA[15:8];
            acc_in_B[614] <= PWDATA[23:16];
            acc_in_B[615] <= PWDATA[31:24];
          end
          411:
          begin
            acc_in_B[616] <= PWDATA[7:0];
            acc_in_B[617] <= PWDATA[15:8];
            acc_in_B[618] <= PWDATA[23:16];
            acc_in_B[619] <= PWDATA[31:24];
          end
          412:
          begin
            acc_in_B[620] <= PWDATA[7:0];
            acc_in_B[621] <= PWDATA[15:8];
            acc_in_B[622] <= PWDATA[23:16];
            acc_in_B[623] <= PWDATA[31:24];
          end
          413:
          begin
            acc_in_B[624] <= PWDATA[7:0];
            acc_in_B[625] <= PWDATA[15:8];
            acc_in_B[626] <= PWDATA[23:16];
            acc_in_B[627] <= PWDATA[31:24];
          end
          414:
          begin
            acc_in_B[628] <= PWDATA[7:0];
            acc_in_B[629] <= PWDATA[15:8];
            acc_in_B[630] <= PWDATA[23:16];
            acc_in_B[631] <= PWDATA[31:24];
          end
          415:
          begin
            acc_in_B[632] <= PWDATA[7:0];
            acc_in_B[633] <= PWDATA[15:8];
            acc_in_B[634] <= PWDATA[23:16];
            acc_in_B[635] <= PWDATA[31:24];
          end
          416:
          begin
            acc_in_B[636] <= PWDATA[7:0];
            acc_in_B[637] <= PWDATA[15:8];
            acc_in_B[638] <= PWDATA[23:16];
            acc_in_B[639] <= PWDATA[31:24];
          end
          417:
          begin
            acc_in_B[640] <= PWDATA[7:0];
            acc_in_B[641] <= PWDATA[15:8];
            acc_in_B[642] <= PWDATA[23:16];
            acc_in_B[643] <= PWDATA[31:24];
          end
          418:
          begin
            acc_in_B[644] <= PWDATA[7:0];
            acc_in_B[645] <= PWDATA[15:8];
            acc_in_B[646] <= PWDATA[23:16];
            acc_in_B[647] <= PWDATA[31:24];
          end
          419:
          begin
            acc_in_B[648] <= PWDATA[7:0];
            acc_in_B[649] <= PWDATA[15:8];
            acc_in_B[650] <= PWDATA[23:16];
            acc_in_B[651] <= PWDATA[31:24];
          end
          420:
          begin
            acc_in_B[652] <= PWDATA[7:0];
            acc_in_B[653] <= PWDATA[15:8];
            acc_in_B[654] <= PWDATA[23:16];
            acc_in_B[655] <= PWDATA[31:24];
          end
          421:
          begin
            acc_in_B[656] <= PWDATA[7:0];
            acc_in_B[657] <= PWDATA[15:8];
            acc_in_B[658] <= PWDATA[23:16];
            acc_in_B[659] <= PWDATA[31:24];
          end
          422:
          begin
            acc_in_B[660] <= PWDATA[7:0];
            acc_in_B[661] <= PWDATA[15:8];
            acc_in_B[662] <= PWDATA[23:16];
            acc_in_B[663] <= PWDATA[31:24];
          end
          423:
          begin
            acc_in_B[664] <= PWDATA[7:0];
            acc_in_B[665] <= PWDATA[15:8];
            acc_in_B[666] <= PWDATA[23:16];
            acc_in_B[667] <= PWDATA[31:24];
          end
          424:
          begin
            acc_in_B[668] <= PWDATA[7:0];
            acc_in_B[669] <= PWDATA[15:8];
            acc_in_B[670] <= PWDATA[23:16];
            acc_in_B[671] <= PWDATA[31:24];
          end
          425:
          begin
            acc_in_B[672] <= PWDATA[7:0];
            acc_in_B[673] <= PWDATA[15:8];
            acc_in_B[674] <= PWDATA[23:16];
            acc_in_B[675] <= PWDATA[31:24];
          end
          426:
          begin
            acc_in_B[676] <= PWDATA[7:0];
            acc_in_B[677] <= PWDATA[15:8];
            acc_in_B[678] <= PWDATA[23:16];
            acc_in_B[679] <= PWDATA[31:24];
          end
          427:
          begin
            acc_in_B[680] <= PWDATA[7:0];
            acc_in_B[681] <= PWDATA[15:8];
            acc_in_B[682] <= PWDATA[23:16];
            acc_in_B[683] <= PWDATA[31:24];
          end
          428:
          begin
            acc_in_B[684] <= PWDATA[7:0];
            acc_in_B[685] <= PWDATA[15:8];
            acc_in_B[686] <= PWDATA[23:16];
            acc_in_B[687] <= PWDATA[31:24];
          end
          429:
          begin
            acc_in_B[688] <= PWDATA[7:0];
            acc_in_B[689] <= PWDATA[15:8];
            acc_in_B[690] <= PWDATA[23:16];
            acc_in_B[691] <= PWDATA[31:24];
          end
          430:
          begin
            acc_in_B[692] <= PWDATA[7:0];
            acc_in_B[693] <= PWDATA[15:8];
            acc_in_B[694] <= PWDATA[23:16];
            acc_in_B[695] <= PWDATA[31:24];
          end
          431:
          begin
            acc_in_B[696] <= PWDATA[7:0];
            acc_in_B[697] <= PWDATA[15:8];
            acc_in_B[698] <= PWDATA[23:16];
            acc_in_B[699] <= PWDATA[31:24];
          end
          432:
          begin
            acc_in_B[700] <= PWDATA[7:0];
            acc_in_B[701] <= PWDATA[15:8];
            acc_in_B[702] <= PWDATA[23:16];
            acc_in_B[703] <= PWDATA[31:24];
          end
          433:
          begin
            acc_in_B[704] <= PWDATA[7:0];
            acc_in_B[705] <= PWDATA[15:8];
            acc_in_B[706] <= PWDATA[23:16];
            acc_in_B[707] <= PWDATA[31:24];
          end
          434:
          begin
            acc_in_B[708] <= PWDATA[7:0];
            acc_in_B[709] <= PWDATA[15:8];
            acc_in_B[710] <= PWDATA[23:16];
            acc_in_B[711] <= PWDATA[31:24];
          end
          435:
          begin
            acc_in_B[712] <= PWDATA[7:0];
            acc_in_B[713] <= PWDATA[15:8];
            acc_in_B[714] <= PWDATA[23:16];
            acc_in_B[715] <= PWDATA[31:24];
          end
          436:
          begin
            acc_in_B[716] <= PWDATA[7:0];
            acc_in_B[717] <= PWDATA[15:8];
            acc_in_B[718] <= PWDATA[23:16];
            acc_in_B[719] <= PWDATA[31:24];
          end
          437:
          begin
            acc_in_B[720] <= PWDATA[7:0];
            acc_in_B[721] <= PWDATA[15:8];
            acc_in_B[722] <= PWDATA[23:16];
            acc_in_B[723] <= PWDATA[31:24];
          end
          438:
          begin
            acc_in_B[724] <= PWDATA[7:0];
            acc_in_B[725] <= PWDATA[15:8];
            acc_in_B[726] <= PWDATA[23:16];
            acc_in_B[727] <= PWDATA[31:24];
          end
          439:
          begin
            acc_in_B[728] <= PWDATA[7:0];
            acc_in_B[729] <= PWDATA[15:8];
            acc_in_B[730] <= PWDATA[23:16];
            acc_in_B[731] <= PWDATA[31:24];
          end
          440:
          begin
            acc_in_B[732] <= PWDATA[7:0];
            acc_in_B[733] <= PWDATA[15:8];
            acc_in_B[734] <= PWDATA[23:16];
            acc_in_B[735] <= PWDATA[31:24];
          end
          441:
          begin
            acc_in_B[736] <= PWDATA[7:0];
            acc_in_B[737] <= PWDATA[15:8];
            acc_in_B[738] <= PWDATA[23:16];
            acc_in_B[739] <= PWDATA[31:24];
          end
          442:
          begin
            acc_in_B[740] <= PWDATA[7:0];
            acc_in_B[741] <= PWDATA[15:8];
            acc_in_B[742] <= PWDATA[23:16];
            acc_in_B[743] <= PWDATA[31:24];
          end
          443:
          begin
            acc_in_B[744] <= PWDATA[7:0];
            acc_in_B[745] <= PWDATA[15:8];
            acc_in_B[746] <= PWDATA[23:16];
            acc_in_B[747] <= PWDATA[31:24];
          end
          444:
          begin
            acc_in_B[748] <= PWDATA[7:0];
            acc_in_B[749] <= PWDATA[15:8];
            acc_in_B[750] <= PWDATA[23:16];
            acc_in_B[751] <= PWDATA[31:24];
          end
          445:
          begin
            acc_in_B[752] <= PWDATA[7:0];
            acc_in_B[753] <= PWDATA[15:8];
            acc_in_B[754] <= PWDATA[23:16];
            acc_in_B[755] <= PWDATA[31:24];
          end
          446:
          begin
            acc_in_B[756] <= PWDATA[7:0];
            acc_in_B[757] <= PWDATA[15:8];
            acc_in_B[758] <= PWDATA[23:16];
            acc_in_B[759] <= PWDATA[31:24];
          end
          447:
          begin
            acc_in_B[760] <= PWDATA[7:0];
            acc_in_B[761] <= PWDATA[15:8];
            acc_in_B[762] <= PWDATA[23:16];
            acc_in_B[763] <= PWDATA[31:24];
          end
          448:
          begin
            acc_in_B[764] <= PWDATA[7:0];
            acc_in_B[765] <= PWDATA[15:8];
            acc_in_B[766] <= PWDATA[23:16];
            acc_in_B[767] <= PWDATA[31:24];
          end
          449:
          begin
            acc_in_B[768] <= PWDATA[7:0];
            acc_in_B[769] <= PWDATA[15:8];
            acc_in_B[770] <= PWDATA[23:16];
            acc_in_B[771] <= PWDATA[31:24];
          end
          450:
          begin
            acc_in_B[772] <= PWDATA[7:0];
            acc_in_B[773] <= PWDATA[15:8];
            acc_in_B[774] <= PWDATA[23:16];
            acc_in_B[775] <= PWDATA[31:24];
          end
          451:
          begin
            acc_in_B[776] <= PWDATA[7:0];
            acc_in_B[777] <= PWDATA[15:8];
            acc_in_B[778] <= PWDATA[23:16];
            acc_in_B[779] <= PWDATA[31:24];
          end
          452:
          begin
            acc_in_B[780] <= PWDATA[7:0];
            acc_in_B[781] <= PWDATA[15:8];
            acc_in_B[782] <= PWDATA[23:16];
            acc_in_B[783] <= PWDATA[31:24];
          end
          453:
          begin
            acc_in_B[784] <= PWDATA[7:0];
            acc_in_B[785] <= PWDATA[15:8];
            acc_in_B[786] <= PWDATA[23:16];
            acc_in_B[787] <= PWDATA[31:24];
          end
          454:
          begin
            acc_in_B[788] <= PWDATA[7:0];
            acc_in_B[789] <= PWDATA[15:8];
            acc_in_B[790] <= PWDATA[23:16];
            acc_in_B[791] <= PWDATA[31:24];
          end
          455:
          begin
            acc_in_B[792] <= PWDATA[7:0];
            acc_in_B[793] <= PWDATA[15:8];
            acc_in_B[794] <= PWDATA[23:16];
            acc_in_B[795] <= PWDATA[31:24];
          end
          456:
          begin
            acc_in_B[796] <= PWDATA[7:0];
            acc_in_B[797] <= PWDATA[15:8];
            acc_in_B[798] <= PWDATA[23:16];
            acc_in_B[799] <= PWDATA[31:24];
          end
          457:
          begin
            acc_in_B[800] <= PWDATA[7:0];
            acc_in_B[801] <= PWDATA[15:8];
            acc_in_B[802] <= PWDATA[23:16];
            acc_in_B[803] <= PWDATA[31:24];
          end
          458:
          begin
            acc_in_B[804] <= PWDATA[7:0];
            acc_in_B[805] <= PWDATA[15:8];
            acc_in_B[806] <= PWDATA[23:16];
            acc_in_B[807] <= PWDATA[31:24];
          end
          459:
          begin
            acc_in_B[808] <= PWDATA[7:0];
            acc_in_B[809] <= PWDATA[15:8];
            acc_in_B[810] <= PWDATA[23:16];
            acc_in_B[811] <= PWDATA[31:24];
          end
          460:
          begin
            acc_in_B[812] <= PWDATA[7:0];
            acc_in_B[813] <= PWDATA[15:8];
            acc_in_B[814] <= PWDATA[23:16];
            acc_in_B[815] <= PWDATA[31:24];
          end
          461:
          begin
            acc_in_B[816] <= PWDATA[7:0];
            acc_in_B[817] <= PWDATA[15:8];
            acc_in_B[818] <= PWDATA[23:16];
            acc_in_B[819] <= PWDATA[31:24];
          end
          462:
          begin
            acc_in_B[820] <= PWDATA[7:0];
            acc_in_B[821] <= PWDATA[15:8];
            acc_in_B[822] <= PWDATA[23:16];
            acc_in_B[823] <= PWDATA[31:24];
          end
          463:
          begin
            acc_in_B[824] <= PWDATA[7:0];
            acc_in_B[825] <= PWDATA[15:8];
            acc_in_B[826] <= PWDATA[23:16];
            acc_in_B[827] <= PWDATA[31:24];
          end
          464:
          begin
            acc_in_B[828] <= PWDATA[7:0];
            acc_in_B[829] <= PWDATA[15:8];
            acc_in_B[830] <= PWDATA[23:16];
            acc_in_B[831] <= PWDATA[31:24];
          end
          465:
          begin
            acc_in_B[832] <= PWDATA[7:0];
            acc_in_B[833] <= PWDATA[15:8];
            acc_in_B[834] <= PWDATA[23:16];
            acc_in_B[835] <= PWDATA[31:24];
          end
          466:
          begin
            acc_in_B[836] <= PWDATA[7:0];
            acc_in_B[837] <= PWDATA[15:8];
            acc_in_B[838] <= PWDATA[23:16];
            acc_in_B[839] <= PWDATA[31:24];
          end
          467:
          begin
            acc_in_B[840] <= PWDATA[7:0];
            acc_in_B[841] <= PWDATA[15:8];
            acc_in_B[842] <= PWDATA[23:16];
            acc_in_B[843] <= PWDATA[31:24];
          end
          468:
          begin
            acc_in_B[844] <= PWDATA[7:0];
            acc_in_B[845] <= PWDATA[15:8];
            acc_in_B[846] <= PWDATA[23:16];
            acc_in_B[847] <= PWDATA[31:24];
          end
          469:
          begin
            acc_in_B[848] <= PWDATA[7:0];
            acc_in_B[849] <= PWDATA[15:8];
            acc_in_B[850] <= PWDATA[23:16];
            acc_in_B[851] <= PWDATA[31:24];
          end
          470:
          begin
            acc_in_B[852] <= PWDATA[7:0];
            acc_in_B[853] <= PWDATA[15:8];
            acc_in_B[854] <= PWDATA[23:16];
            acc_in_B[855] <= PWDATA[31:24];
          end
          471:
          begin
            acc_in_B[856] <= PWDATA[7:0];
            acc_in_B[857] <= PWDATA[15:8];
            acc_in_B[858] <= PWDATA[23:16];
            acc_in_B[859] <= PWDATA[31:24];
          end
          472:
          begin
            acc_in_B[860] <= PWDATA[7:0];
            acc_in_B[861] <= PWDATA[15:8];
            acc_in_B[862] <= PWDATA[23:16];
            acc_in_B[863] <= PWDATA[31:24];
          end
          473:
          begin
            acc_in_B[864] <= PWDATA[7:0];
            acc_in_B[865] <= PWDATA[15:8];
            acc_in_B[866] <= PWDATA[23:16];
            acc_in_B[867] <= PWDATA[31:24];
          end
          474:
          begin
            acc_in_B[868] <= PWDATA[7:0];
            acc_in_B[869] <= PWDATA[15:8];
            acc_in_B[870] <= PWDATA[23:16];
            acc_in_B[871] <= PWDATA[31:24];
          end
          475:
          begin
            acc_in_B[872] <= PWDATA[7:0];
            acc_in_B[873] <= PWDATA[15:8];
            acc_in_B[874] <= PWDATA[23:16];
            acc_in_B[875] <= PWDATA[31:24];
          end
          476:
          begin
            acc_in_B[876] <= PWDATA[7:0];
            acc_in_B[877] <= PWDATA[15:8];
            acc_in_B[878] <= PWDATA[23:16];
            acc_in_B[879] <= PWDATA[31:24];
          end
          477:
          begin
            acc_in_B[880] <= PWDATA[7:0];
            acc_in_B[881] <= PWDATA[15:8];
            acc_in_B[882] <= PWDATA[23:16];
            acc_in_B[883] <= PWDATA[31:24];
          end
          478:
          begin
            acc_in_B[884] <= PWDATA[7:0];
            acc_in_B[885] <= PWDATA[15:8];
            acc_in_B[886] <= PWDATA[23:16];
            acc_in_B[887] <= PWDATA[31:24];
          end
          479:
          begin
            acc_in_B[888] <= PWDATA[7:0];
            acc_in_B[889] <= PWDATA[15:8];
            acc_in_B[890] <= PWDATA[23:16];
            acc_in_B[891] <= PWDATA[31:24];
          end
          480:
          begin
            acc_in_B[892] <= PWDATA[7:0];
            acc_in_B[893] <= PWDATA[15:8];
            acc_in_B[894] <= PWDATA[23:16];
            acc_in_B[895] <= PWDATA[31:24];
          end
          481:
          begin
            acc_in_B[896] <= PWDATA[7:0];
            acc_in_B[897] <= PWDATA[15:8];
            acc_in_B[898] <= PWDATA[23:16];
            acc_in_B[899] <= PWDATA[31:24];
          end
          482:
          begin
            acc_in_B[900] <= PWDATA[7:0];
            acc_in_B[901] <= PWDATA[15:8];
            acc_in_B[902] <= PWDATA[23:16];
            acc_in_B[903] <= PWDATA[31:24];
          end
          483:
          begin
            acc_in_B[904] <= PWDATA[7:0];
            acc_in_B[905] <= PWDATA[15:8];
            acc_in_B[906] <= PWDATA[23:16];
            acc_in_B[907] <= PWDATA[31:24];
          end
          484:
          begin
            acc_in_B[908] <= PWDATA[7:0];
            acc_in_B[909] <= PWDATA[15:8];
            acc_in_B[910] <= PWDATA[23:16];
            acc_in_B[911] <= PWDATA[31:24];
          end
          485:
          begin
            acc_in_B[912] <= PWDATA[7:0];
            acc_in_B[913] <= PWDATA[15:8];
            acc_in_B[914] <= PWDATA[23:16];
            acc_in_B[915] <= PWDATA[31:24];
          end
          486:
          begin
            acc_in_B[916] <= PWDATA[7:0];
            acc_in_B[917] <= PWDATA[15:8];
            acc_in_B[918] <= PWDATA[23:16];
            acc_in_B[919] <= PWDATA[31:24];
          end
          487:
          begin
            acc_in_B[920] <= PWDATA[7:0];
            acc_in_B[921] <= PWDATA[15:8];
            acc_in_B[922] <= PWDATA[23:16];
            acc_in_B[923] <= PWDATA[31:24];
          end
          488:
          begin
            acc_in_B[924] <= PWDATA[7:0];
            acc_in_B[925] <= PWDATA[15:8];
            acc_in_B[926] <= PWDATA[23:16];
            acc_in_B[927] <= PWDATA[31:24];
          end
          489:
          begin
            acc_in_B[928] <= PWDATA[7:0];
            acc_in_B[929] <= PWDATA[15:8];
            acc_in_B[930] <= PWDATA[23:16];
            acc_in_B[931] <= PWDATA[31:24];
          end
          490:
          begin
            acc_in_B[932] <= PWDATA[7:0];
            acc_in_B[933] <= PWDATA[15:8];
            acc_in_B[934] <= PWDATA[23:16];
            acc_in_B[935] <= PWDATA[31:24];
          end
          491:
          begin
            acc_in_B[936] <= PWDATA[7:0];
            acc_in_B[937] <= PWDATA[15:8];
            acc_in_B[938] <= PWDATA[23:16];
            acc_in_B[939] <= PWDATA[31:24];
          end
          492:
          begin
            acc_in_B[940] <= PWDATA[7:0];
            acc_in_B[941] <= PWDATA[15:8];
            acc_in_B[942] <= PWDATA[23:16];
            acc_in_B[943] <= PWDATA[31:24];
          end
          493:
          begin
            acc_in_B[944] <= PWDATA[7:0];
            acc_in_B[945] <= PWDATA[15:8];
            acc_in_B[946] <= PWDATA[23:16];
            acc_in_B[947] <= PWDATA[31:24];
          end
          494:
          begin
            acc_in_B[948] <= PWDATA[7:0];
            acc_in_B[949] <= PWDATA[15:8];
            acc_in_B[950] <= PWDATA[23:16];
            acc_in_B[951] <= PWDATA[31:24];
          end
          495:
          begin
            acc_in_B[952] <= PWDATA[7:0];
            acc_in_B[953] <= PWDATA[15:8];
            acc_in_B[954] <= PWDATA[23:16];
            acc_in_B[955] <= PWDATA[31:24];
          end
          496:
          begin
            acc_in_B[956] <= PWDATA[7:0];
            acc_in_B[957] <= PWDATA[15:8];
            acc_in_B[958] <= PWDATA[23:16];
            acc_in_B[959] <= PWDATA[31:24];
          end
          497:
          begin
            acc_in_B[960] <= PWDATA[7:0];
            acc_in_B[961] <= PWDATA[15:8];
            acc_in_B[962] <= PWDATA[23:16];
            acc_in_B[963] <= PWDATA[31:24];
          end
          498:
          begin
            acc_in_B[964] <= PWDATA[7:0];
            acc_in_B[965] <= PWDATA[15:8];
            acc_in_B[966] <= PWDATA[23:16];
            acc_in_B[967] <= PWDATA[31:24];
          end
          499:
          begin
            acc_in_B[968] <= PWDATA[7:0];
            acc_in_B[969] <= PWDATA[15:8];
            acc_in_B[970] <= PWDATA[23:16];
            acc_in_B[971] <= PWDATA[31:24];
          end
          500:
          begin
            acc_in_B[972] <= PWDATA[7:0];
            acc_in_B[973] <= PWDATA[15:8];
            acc_in_B[974] <= PWDATA[23:16];
            acc_in_B[975] <= PWDATA[31:24];
          end
          501:
          begin
            acc_in_B[976] <= PWDATA[7:0];
            acc_in_B[977] <= PWDATA[15:8];
            acc_in_B[978] <= PWDATA[23:16];
            acc_in_B[979] <= PWDATA[31:24];
          end
          502:
          begin
            acc_in_B[980] <= PWDATA[7:0];
            acc_in_B[981] <= PWDATA[15:8];
            acc_in_B[982] <= PWDATA[23:16];
            acc_in_B[983] <= PWDATA[31:24];
          end
          503:
          begin
            acc_in_B[984] <= PWDATA[7:0];
            acc_in_B[985] <= PWDATA[15:8];
            acc_in_B[986] <= PWDATA[23:16];
            acc_in_B[987] <= PWDATA[31:24];
          end
          504:
          begin
            acc_in_B[988] <= PWDATA[7:0];
            acc_in_B[989] <= PWDATA[15:8];
            acc_in_B[990] <= PWDATA[23:16];
            acc_in_B[991] <= PWDATA[31:24];
          end
          505:
          begin
            acc_in_B[992] <= PWDATA[7:0];
            acc_in_B[993] <= PWDATA[15:8];
            acc_in_B[994] <= PWDATA[23:16];
            acc_in_B[995] <= PWDATA[31:24];
          end
          506:
          begin
            acc_in_B[996] <= PWDATA[7:0];
            acc_in_B[997] <= PWDATA[15:8];
            acc_in_B[998] <= PWDATA[23:16];
            acc_in_B[999] <= PWDATA[31:24];
          end
          507:
          begin
            acc_in_B[1000] <= PWDATA[7:0];
            acc_in_B[1001] <= PWDATA[15:8];
            acc_in_B[1002] <= PWDATA[23:16];
            acc_in_B[1003] <= PWDATA[31:24];
          end
          508:
          begin
            acc_in_B[1004] <= PWDATA[7:0];
            acc_in_B[1005] <= PWDATA[15:8];
            acc_in_B[1006] <= PWDATA[23:16];
            acc_in_B[1007] <= PWDATA[31:24];
          end
          509:
          begin
            acc_in_B[1008] <= PWDATA[7:0];
            acc_in_B[1009] <= PWDATA[15:8];
            acc_in_B[1010] <= PWDATA[23:16];
            acc_in_B[1011] <= PWDATA[31:24];
          end
          510:
          begin
            acc_in_B[1012] <= PWDATA[7:0];
            acc_in_B[1013] <= PWDATA[15:8];
            acc_in_B[1014] <= PWDATA[23:16];
            acc_in_B[1015] <= PWDATA[31:24];
          end
          511:
          begin
            acc_in_B[1016] <= PWDATA[7:0];
            acc_in_B[1017] <= PWDATA[15:8];
            acc_in_B[1018] <= PWDATA[23:16];
            acc_in_B[1019] <= PWDATA[31:24];
          end
          512:
          begin
            acc_in_B[1020] <= PWDATA[7:0];
            acc_in_B[1021] <= PWDATA[15:8];
            acc_in_B[1022] <= PWDATA[23:16];
            acc_in_B[1023] <= PWDATA[31:24];
          end
          default:
            // Do nothing
          end
        endcase
      end
    end
  end

  //Assign outputs and inputs from local variables
  always_comb
  begin
    if (PSEL && PENABLE && ~PWRITE)
    begin
      case (addr)
        1:
        begin
          PRDATA[15:0] = acc_out[0];
          PRDATA[31:16] = acc_out[1];
        end
        2:
        begin
          PRDATA[15:0] = acc_out[2];
          PRDATA[31:16] = acc_out[3];
        end
        3:
        begin
          PRDATA[15:0] = acc_out[4];
          PRDATA[31:16] = acc_out[5];
        end
        4:
        begin
          PRDATA[15:0] = acc_out[6];
          PRDATA[31:16] = acc_out[7];
        end
        5:
        begin
          PRDATA[15:0] = acc_out[8];
          PRDATA[31:16] = acc_out[9];
        end
        6:
        begin
          PRDATA[15:0] = acc_out[10];
          PRDATA[31:16] = acc_out[11];
        end
        7:
        begin
          PRDATA[15:0] = acc_out[12];
          PRDATA[31:16] = acc_out[13];
        end
        8:
        begin
          PRDATA[15:0] = acc_out[14];
          PRDATA[31:16] = acc_out[15];
        end
        9:
        begin
          PRDATA[15:0] = acc_out[16];
          PRDATA[31:16] = acc_out[17];
        end
        10:
        begin
          PRDATA[15:0] = acc_out[18];
          PRDATA[31:16] = acc_out[19];
        end
        11:
        begin
          PRDATA[15:0] = acc_out[20];
          PRDATA[31:16] = acc_out[21];
        end
        12:
        begin
          PRDATA[15:0] = acc_out[22];
          PRDATA[31:16] = acc_out[23];
        end
        13:
        begin
          PRDATA[15:0] = acc_out[24];
          PRDATA[31:16] = acc_out[25];
        end
        14:
        begin
          PRDATA[15:0] = acc_out[26];
          PRDATA[31:16] = acc_out[27];
        end
        15:
        begin
          PRDATA[15:0] = acc_out[28];
          PRDATA[31:16] = acc_out[29];
        end
        16:
        begin
          PRDATA[15:0] = acc_out[30];
          PRDATA[31:16] = acc_out[31];
        end
        17:
        begin
          PRDATA[15:0] = acc_out[32];
          PRDATA[31:16] = acc_out[33];
        end
        18:
        begin
          PRDATA[15:0] = acc_out[34];
          PRDATA[31:16] = acc_out[35];
        end
        19:
        begin
          PRDATA[15:0] = acc_out[36];
          PRDATA[31:16] = acc_out[37];
        end
        20:
        begin
          PRDATA[15:0] = acc_out[38];
          PRDATA[31:16] = acc_out[39];
        end
        21:
        begin
          PRDATA[15:0] = acc_out[40];
          PRDATA[31:16] = acc_out[41];
        end
        22:
        begin
          PRDATA[15:0] = acc_out[42];
          PRDATA[31:16] = acc_out[43];
        end
        23:
        begin
          PRDATA[15:0] = acc_out[44];
          PRDATA[31:16] = acc_out[45];
        end
        24:
        begin
          PRDATA[15:0] = acc_out[46];
          PRDATA[31:16] = acc_out[47];
        end
        25:
        begin
          PRDATA[15:0] = acc_out[48];
          PRDATA[31:16] = acc_out[49];
        end
        26:
        begin
          PRDATA[15:0] = acc_out[50];
          PRDATA[31:16] = acc_out[51];
        end
        27:
        begin
          PRDATA[15:0] = acc_out[52];
          PRDATA[31:16] = acc_out[53];
        end
        28:
        begin
          PRDATA[15:0] = acc_out[54];
          PRDATA[31:16] = acc_out[55];
        end
        29:
        begin
          PRDATA[15:0] = acc_out[56];
          PRDATA[31:16] = acc_out[57];
        end
        30:
        begin
          PRDATA[15:0] = acc_out[58];
          PRDATA[31:16] = acc_out[59];
        end
        31:
        begin
          PRDATA[15:0] = acc_out[60];
          PRDATA[31:16] = acc_out[61];
        end
        32:
        begin
          PRDATA[15:0] = acc_out[62];
          PRDATA[31:16] = acc_out[63];
        end
        33:
        begin
          PRDATA[15:0] = acc_out[64];
          PRDATA[31:16] = acc_out[65];
        end
        34:
        begin
          PRDATA[15:0] = acc_out[66];
          PRDATA[31:16] = acc_out[67];
        end
        35:
        begin
          PRDATA[15:0] = acc_out[68];
          PRDATA[31:16] = acc_out[69];
        end
        36:
        begin
          PRDATA[15:0] = acc_out[70];
          PRDATA[31:16] = acc_out[71];
        end
        37:
        begin
          PRDATA[15:0] = acc_out[72];
          PRDATA[31:16] = acc_out[73];
        end
        38:
        begin
          PRDATA[15:0] = acc_out[74];
          PRDATA[31:16] = acc_out[75];
        end
        39:
        begin
          PRDATA[15:0] = acc_out[76];
          PRDATA[31:16] = acc_out[77];
        end
        40:
        begin
          PRDATA[15:0] = acc_out[78];
          PRDATA[31:16] = acc_out[79];
        end
        41:
        begin
          PRDATA[15:0] = acc_out[80];
          PRDATA[31:16] = acc_out[81];
        end
        42:
        begin
          PRDATA[15:0] = acc_out[82];
          PRDATA[31:16] = acc_out[83];
        end
        43:
        begin
          PRDATA[15:0] = acc_out[84];
          PRDATA[31:16] = acc_out[85];
        end
        44:
        begin
          PRDATA[15:0] = acc_out[86];
          PRDATA[31:16] = acc_out[87];
        end
        45:
        begin
          PRDATA[15:0] = acc_out[88];
          PRDATA[31:16] = acc_out[89];
        end
        46:
        begin
          PRDATA[15:0] = acc_out[90];
          PRDATA[31:16] = acc_out[91];
        end
        47:
        begin
          PRDATA[15:0] = acc_out[92];
          PRDATA[31:16] = acc_out[93];
        end
        48:
        begin
          PRDATA[15:0] = acc_out[94];
          PRDATA[31:16] = acc_out[95];
        end
        49:
        begin
          PRDATA[15:0] = acc_out[96];
          PRDATA[31:16] = acc_out[97];
        end
        50:
        begin
          PRDATA[15:0] = acc_out[98];
          PRDATA[31:16] = acc_out[99];
        end
        51:
        begin
          PRDATA[15:0] = acc_out[100];
          PRDATA[31:16] = acc_out[101];
        end
        52:
        begin
          PRDATA[15:0] = acc_out[102];
          PRDATA[31:16] = acc_out[103];
        end
        53:
        begin
          PRDATA[15:0] = acc_out[104];
          PRDATA[31:16] = acc_out[105];
        end
        54:
        begin
          PRDATA[15:0] = acc_out[106];
          PRDATA[31:16] = acc_out[107];
        end
        55:
        begin
          PRDATA[15:0] = acc_out[108];
          PRDATA[31:16] = acc_out[109];
        end
        56:
        begin
          PRDATA[15:0] = acc_out[110];
          PRDATA[31:16] = acc_out[111];
        end
        57:
        begin
          PRDATA[15:0] = acc_out[112];
          PRDATA[31:16] = acc_out[113];
        end
        58:
        begin
          PRDATA[15:0] = acc_out[114];
          PRDATA[31:16] = acc_out[115];
        end
        59:
        begin
          PRDATA[15:0] = acc_out[116];
          PRDATA[31:16] = acc_out[117];
        end
        60:
        begin
          PRDATA[15:0] = acc_out[118];
          PRDATA[31:16] = acc_out[119];
        end
        61:
        begin
          PRDATA[15:0] = acc_out[120];
          PRDATA[31:16] = acc_out[121];
        end
        62:
        begin
          PRDATA[15:0] = acc_out[122];
          PRDATA[31:16] = acc_out[123];
        end
        63:
        begin
          PRDATA[15:0] = acc_out[124];
          PRDATA[31:16] = acc_out[125];
        end
        64:
        begin
          PRDATA[15:0] = acc_out[126];
          PRDATA[31:16] = acc_out[127];
        end
        65:
        begin
          PRDATA[15:0] = acc_out[128];
          PRDATA[31:16] = acc_out[129];
        end
        66:
        begin
          PRDATA[15:0] = acc_out[130];
          PRDATA[31:16] = acc_out[131];
        end
        67:
        begin
          PRDATA[15:0] = acc_out[132];
          PRDATA[31:16] = acc_out[133];
        end
        68:
        begin
          PRDATA[15:0] = acc_out[134];
          PRDATA[31:16] = acc_out[135];
        end
        69:
        begin
          PRDATA[15:0] = acc_out[136];
          PRDATA[31:16] = acc_out[137];
        end
        70:
        begin
          PRDATA[15:0] = acc_out[138];
          PRDATA[31:16] = acc_out[139];
        end
        71:
        begin
          PRDATA[15:0] = acc_out[140];
          PRDATA[31:16] = acc_out[141];
        end
        72:
        begin
          PRDATA[15:0] = acc_out[142];
          PRDATA[31:16] = acc_out[143];
        end
        73:
        begin
          PRDATA[15:0] = acc_out[144];
          PRDATA[31:16] = acc_out[145];
        end
        74:
        begin
          PRDATA[15:0] = acc_out[146];
          PRDATA[31:16] = acc_out[147];
        end
        75:
        begin
          PRDATA[15:0] = acc_out[148];
          PRDATA[31:16] = acc_out[149];
        end
        76:
        begin
          PRDATA[15:0] = acc_out[150];
          PRDATA[31:16] = acc_out[151];
        end
        77:
        begin
          PRDATA[15:0] = acc_out[152];
          PRDATA[31:16] = acc_out[153];
        end
        78:
        begin
          PRDATA[15:0] = acc_out[154];
          PRDATA[31:16] = acc_out[155];
        end
        79:
        begin
          PRDATA[15:0] = acc_out[156];
          PRDATA[31:16] = acc_out[157];
        end
        80:
        begin
          PRDATA[15:0] = acc_out[158];
          PRDATA[31:16] = acc_out[159];
        end
        81:
        begin
          PRDATA[15:0] = acc_out[160];
          PRDATA[31:16] = acc_out[161];
        end
        82:
        begin
          PRDATA[15:0] = acc_out[162];
          PRDATA[31:16] = acc_out[163];
        end
        83:
        begin
          PRDATA[15:0] = acc_out[164];
          PRDATA[31:16] = acc_out[165];
        end
        84:
        begin
          PRDATA[15:0] = acc_out[166];
          PRDATA[31:16] = acc_out[167];
        end
        85:
        begin
          PRDATA[15:0] = acc_out[168];
          PRDATA[31:16] = acc_out[169];
        end
        86:
        begin
          PRDATA[15:0] = acc_out[170];
          PRDATA[31:16] = acc_out[171];
        end
        87:
        begin
          PRDATA[15:0] = acc_out[172];
          PRDATA[31:16] = acc_out[173];
        end
        88:
        begin
          PRDATA[15:0] = acc_out[174];
          PRDATA[31:16] = acc_out[175];
        end
        89:
        begin
          PRDATA[15:0] = acc_out[176];
          PRDATA[31:16] = acc_out[177];
        end
        90:
        begin
          PRDATA[15:0] = acc_out[178];
          PRDATA[31:16] = acc_out[179];
        end
        91:
        begin
          PRDATA[15:0] = acc_out[180];
          PRDATA[31:16] = acc_out[181];
        end
        92:
        begin
          PRDATA[15:0] = acc_out[182];
          PRDATA[31:16] = acc_out[183];
        end
        93:
        begin
          PRDATA[15:0] = acc_out[184];
          PRDATA[31:16] = acc_out[185];
        end
        94:
        begin
          PRDATA[15:0] = acc_out[186];
          PRDATA[31:16] = acc_out[187];
        end
        95:
        begin
          PRDATA[15:0] = acc_out[188];
          PRDATA[31:16] = acc_out[189];
        end
        96:
        begin
          PRDATA[15:0] = acc_out[190];
          PRDATA[31:16] = acc_out[191];
        end
        97:
        begin
          PRDATA[15:0] = acc_out[192];
          PRDATA[31:16] = acc_out[193];
        end
        98:
        begin
          PRDATA[15:0] = acc_out[194];
          PRDATA[31:16] = acc_out[195];
        end
        99:
        begin
          PRDATA[15:0] = acc_out[196];
          PRDATA[31:16] = acc_out[197];
        end
        100:
        begin
          PRDATA[15:0] = acc_out[198];
          PRDATA[31:16] = acc_out[199];
        end
        101:
        begin
          PRDATA[15:0] = acc_out[200];
          PRDATA[31:16] = acc_out[201];
        end
        102:
        begin
          PRDATA[15:0] = acc_out[202];
          PRDATA[31:16] = acc_out[203];
        end
        103:
        begin
          PRDATA[15:0] = acc_out[204];
          PRDATA[31:16] = acc_out[205];
        end
        104:
        begin
          PRDATA[15:0] = acc_out[206];
          PRDATA[31:16] = acc_out[207];
        end
        105:
        begin
          PRDATA[15:0] = acc_out[208];
          PRDATA[31:16] = acc_out[209];
        end
        106:
        begin
          PRDATA[15:0] = acc_out[210];
          PRDATA[31:16] = acc_out[211];
        end
        107:
        begin
          PRDATA[15:0] = acc_out[212];
          PRDATA[31:16] = acc_out[213];
        end
        108:
        begin
          PRDATA[15:0] = acc_out[214];
          PRDATA[31:16] = acc_out[215];
        end
        109:
        begin
          PRDATA[15:0] = acc_out[216];
          PRDATA[31:16] = acc_out[217];
        end
        110:
        begin
          PRDATA[15:0] = acc_out[218];
          PRDATA[31:16] = acc_out[219];
        end
        111:
        begin
          PRDATA[15:0] = acc_out[220];
          PRDATA[31:16] = acc_out[221];
        end
        112:
        begin
          PRDATA[15:0] = acc_out[222];
          PRDATA[31:16] = acc_out[223];
        end
        113:
        begin
          PRDATA[15:0] = acc_out[224];
          PRDATA[31:16] = acc_out[225];
        end
        114:
        begin
          PRDATA[15:0] = acc_out[226];
          PRDATA[31:16] = acc_out[227];
        end
        115:
        begin
          PRDATA[15:0] = acc_out[228];
          PRDATA[31:16] = acc_out[229];
        end
        116:
        begin
          PRDATA[15:0] = acc_out[230];
          PRDATA[31:16] = acc_out[231];
        end
        117:
        begin
          PRDATA[15:0] = acc_out[232];
          PRDATA[31:16] = acc_out[233];
        end
        118:
        begin
          PRDATA[15:0] = acc_out[234];
          PRDATA[31:16] = acc_out[235];
        end
        119:
        begin
          PRDATA[15:0] = acc_out[236];
          PRDATA[31:16] = acc_out[237];
        end
        120:
        begin
          PRDATA[15:0] = acc_out[238];
          PRDATA[31:16] = acc_out[239];
        end
        121:
        begin
          PRDATA[15:0] = acc_out[240];
          PRDATA[31:16] = acc_out[241];
        end
        122:
        begin
          PRDATA[15:0] = acc_out[242];
          PRDATA[31:16] = acc_out[243];
        end
        123:
        begin
          PRDATA[15:0] = acc_out[244];
          PRDATA[31:16] = acc_out[245];
        end
        124:
        begin
          PRDATA[15:0] = acc_out[246];
          PRDATA[31:16] = acc_out[247];
        end
        125:
        begin
          PRDATA[15:0] = acc_out[248];
          PRDATA[31:16] = acc_out[249];
        end
        126:
        begin
          PRDATA[15:0] = acc_out[250];
          PRDATA[31:16] = acc_out[251];
        end
        127:
        begin
          PRDATA[15:0] = acc_out[252];
          PRDATA[31:16] = acc_out[253];
        end
        128:
        begin
          PRDATA[15:0] = acc_out[254];
          PRDATA[31:16] = acc_out[255];
        end
        129:
        begin
          PRDATA[15:0] = acc_out[256];
          PRDATA[31:16] = acc_out[257];
        end
        130:
        begin
          PRDATA[15:0] = acc_out[258];
          PRDATA[31:16] = acc_out[259];
        end
        131:
        begin
          PRDATA[15:0] = acc_out[260];
          PRDATA[31:16] = acc_out[261];
        end
        132:
        begin
          PRDATA[15:0] = acc_out[262];
          PRDATA[31:16] = acc_out[263];
        end
        133:
        begin
          PRDATA[15:0] = acc_out[264];
          PRDATA[31:16] = acc_out[265];
        end
        134:
        begin
          PRDATA[15:0] = acc_out[266];
          PRDATA[31:16] = acc_out[267];
        end
        135:
        begin
          PRDATA[15:0] = acc_out[268];
          PRDATA[31:16] = acc_out[269];
        end
        136:
        begin
          PRDATA[15:0] = acc_out[270];
          PRDATA[31:16] = acc_out[271];
        end
        137:
        begin
          PRDATA[15:0] = acc_out[272];
          PRDATA[31:16] = acc_out[273];
        end
        138:
        begin
          PRDATA[15:0] = acc_out[274];
          PRDATA[31:16] = acc_out[275];
        end
        139:
        begin
          PRDATA[15:0] = acc_out[276];
          PRDATA[31:16] = acc_out[277];
        end
        140:
        begin
          PRDATA[15:0] = acc_out[278];
          PRDATA[31:16] = acc_out[279];
        end
        141:
        begin
          PRDATA[15:0] = acc_out[280];
          PRDATA[31:16] = acc_out[281];
        end
        142:
        begin
          PRDATA[15:0] = acc_out[282];
          PRDATA[31:16] = acc_out[283];
        end
        143:
        begin
          PRDATA[15:0] = acc_out[284];
          PRDATA[31:16] = acc_out[285];
        end
        144:
        begin
          PRDATA[15:0] = acc_out[286];
          PRDATA[31:16] = acc_out[287];
        end
        145:
        begin
          PRDATA[15:0] = acc_out[288];
          PRDATA[31:16] = acc_out[289];
        end
        146:
        begin
          PRDATA[15:0] = acc_out[290];
          PRDATA[31:16] = acc_out[291];
        end
        147:
        begin
          PRDATA[15:0] = acc_out[292];
          PRDATA[31:16] = acc_out[293];
        end
        148:
        begin
          PRDATA[15:0] = acc_out[294];
          PRDATA[31:16] = acc_out[295];
        end
        149:
        begin
          PRDATA[15:0] = acc_out[296];
          PRDATA[31:16] = acc_out[297];
        end
        150:
        begin
          PRDATA[15:0] = acc_out[298];
          PRDATA[31:16] = acc_out[299];
        end
        151:
        begin
          PRDATA[15:0] = acc_out[300];
          PRDATA[31:16] = acc_out[301];
        end
        152:
        begin
          PRDATA[15:0] = acc_out[302];
          PRDATA[31:16] = acc_out[303];
        end
        153:
        begin
          PRDATA[15:0] = acc_out[304];
          PRDATA[31:16] = acc_out[305];
        end
        154:
        begin
          PRDATA[15:0] = acc_out[306];
          PRDATA[31:16] = acc_out[307];
        end
        155:
        begin
          PRDATA[15:0] = acc_out[308];
          PRDATA[31:16] = acc_out[309];
        end
        156:
        begin
          PRDATA[15:0] = acc_out[310];
          PRDATA[31:16] = acc_out[311];
        end
        157:
        begin
          PRDATA[15:0] = acc_out[312];
          PRDATA[31:16] = acc_out[313];
        end
        158:
        begin
          PRDATA[15:0] = acc_out[314];
          PRDATA[31:16] = acc_out[315];
        end
        159:
        begin
          PRDATA[15:0] = acc_out[316];
          PRDATA[31:16] = acc_out[317];
        end
        160:
        begin
          PRDATA[15:0] = acc_out[318];
          PRDATA[31:16] = acc_out[319];
        end
        161:
        begin
          PRDATA[15:0] = acc_out[320];
          PRDATA[31:16] = acc_out[321];
        end
        162:
        begin
          PRDATA[15:0] = acc_out[322];
          PRDATA[31:16] = acc_out[323];
        end
        163:
        begin
          PRDATA[15:0] = acc_out[324];
          PRDATA[31:16] = acc_out[325];
        end
        164:
        begin
          PRDATA[15:0] = acc_out[326];
          PRDATA[31:16] = acc_out[327];
        end
        165:
        begin
          PRDATA[15:0] = acc_out[328];
          PRDATA[31:16] = acc_out[329];
        end
        166:
        begin
          PRDATA[15:0] = acc_out[330];
          PRDATA[31:16] = acc_out[331];
        end
        167:
        begin
          PRDATA[15:0] = acc_out[332];
          PRDATA[31:16] = acc_out[333];
        end
        168:
        begin
          PRDATA[15:0] = acc_out[334];
          PRDATA[31:16] = acc_out[335];
        end
        169:
        begin
          PRDATA[15:0] = acc_out[336];
          PRDATA[31:16] = acc_out[337];
        end
        170:
        begin
          PRDATA[15:0] = acc_out[338];
          PRDATA[31:16] = acc_out[339];
        end
        171:
        begin
          PRDATA[15:0] = acc_out[340];
          PRDATA[31:16] = acc_out[341];
        end
        172:
        begin
          PRDATA[15:0] = acc_out[342];
          PRDATA[31:16] = acc_out[343];
        end
        173:
        begin
          PRDATA[15:0] = acc_out[344];
          PRDATA[31:16] = acc_out[345];
        end
        174:
        begin
          PRDATA[15:0] = acc_out[346];
          PRDATA[31:16] = acc_out[347];
        end
        175:
        begin
          PRDATA[15:0] = acc_out[348];
          PRDATA[31:16] = acc_out[349];
        end
        176:
        begin
          PRDATA[15:0] = acc_out[350];
          PRDATA[31:16] = acc_out[351];
        end
        177:
        begin
          PRDATA[15:0] = acc_out[352];
          PRDATA[31:16] = acc_out[353];
        end
        178:
        begin
          PRDATA[15:0] = acc_out[354];
          PRDATA[31:16] = acc_out[355];
        end
        179:
        begin
          PRDATA[15:0] = acc_out[356];
          PRDATA[31:16] = acc_out[357];
        end
        180:
        begin
          PRDATA[15:0] = acc_out[358];
          PRDATA[31:16] = acc_out[359];
        end
        181:
        begin
          PRDATA[15:0] = acc_out[360];
          PRDATA[31:16] = acc_out[361];
        end
        182:
        begin
          PRDATA[15:0] = acc_out[362];
          PRDATA[31:16] = acc_out[363];
        end
        183:
        begin
          PRDATA[15:0] = acc_out[364];
          PRDATA[31:16] = acc_out[365];
        end
        184:
        begin
          PRDATA[15:0] = acc_out[366];
          PRDATA[31:16] = acc_out[367];
        end
        185:
        begin
          PRDATA[15:0] = acc_out[368];
          PRDATA[31:16] = acc_out[369];
        end
        186:
        begin
          PRDATA[15:0] = acc_out[370];
          PRDATA[31:16] = acc_out[371];
        end
        187:
        begin
          PRDATA[15:0] = acc_out[372];
          PRDATA[31:16] = acc_out[373];
        end
        188:
        begin
          PRDATA[15:0] = acc_out[374];
          PRDATA[31:16] = acc_out[375];
        end
        189:
        begin
          PRDATA[15:0] = acc_out[376];
          PRDATA[31:16] = acc_out[377];
        end
        190:
        begin
          PRDATA[15:0] = acc_out[378];
          PRDATA[31:16] = acc_out[379];
        end
        191:
        begin
          PRDATA[15:0] = acc_out[380];
          PRDATA[31:16] = acc_out[381];
        end
        192:
        begin
          PRDATA[15:0] = acc_out[382];
          PRDATA[31:16] = acc_out[383];
        end
        193:
        begin
          PRDATA[15:0] = acc_out[384];
          PRDATA[31:16] = acc_out[385];
        end
        194:
        begin
          PRDATA[15:0] = acc_out[386];
          PRDATA[31:16] = acc_out[387];
        end
        195:
        begin
          PRDATA[15:0] = acc_out[388];
          PRDATA[31:16] = acc_out[389];
        end
        196:
        begin
          PRDATA[15:0] = acc_out[390];
          PRDATA[31:16] = acc_out[391];
        end
        197:
        begin
          PRDATA[15:0] = acc_out[392];
          PRDATA[31:16] = acc_out[393];
        end
        198:
        begin
          PRDATA[15:0] = acc_out[394];
          PRDATA[31:16] = acc_out[395];
        end
        199:
        begin
          PRDATA[15:0] = acc_out[396];
          PRDATA[31:16] = acc_out[397];
        end
        200:
        begin
          PRDATA[15:0] = acc_out[398];
          PRDATA[31:16] = acc_out[399];
        end
        201:
        begin
          PRDATA[15:0] = acc_out[400];
          PRDATA[31:16] = acc_out[401];
        end
        202:
        begin
          PRDATA[15:0] = acc_out[402];
          PRDATA[31:16] = acc_out[403];
        end
        203:
        begin
          PRDATA[15:0] = acc_out[404];
          PRDATA[31:16] = acc_out[405];
        end
        204:
        begin
          PRDATA[15:0] = acc_out[406];
          PRDATA[31:16] = acc_out[407];
        end
        205:
        begin
          PRDATA[15:0] = acc_out[408];
          PRDATA[31:16] = acc_out[409];
        end
        206:
        begin
          PRDATA[15:0] = acc_out[410];
          PRDATA[31:16] = acc_out[411];
        end
        207:
        begin
          PRDATA[15:0] = acc_out[412];
          PRDATA[31:16] = acc_out[413];
        end
        208:
        begin
          PRDATA[15:0] = acc_out[414];
          PRDATA[31:16] = acc_out[415];
        end
        209:
        begin
          PRDATA[15:0] = acc_out[416];
          PRDATA[31:16] = acc_out[417];
        end
        210:
        begin
          PRDATA[15:0] = acc_out[418];
          PRDATA[31:16] = acc_out[419];
        end
        211:
        begin
          PRDATA[15:0] = acc_out[420];
          PRDATA[31:16] = acc_out[421];
        end
        212:
        begin
          PRDATA[15:0] = acc_out[422];
          PRDATA[31:16] = acc_out[423];
        end
        213:
        begin
          PRDATA[15:0] = acc_out[424];
          PRDATA[31:16] = acc_out[425];
        end
        214:
        begin
          PRDATA[15:0] = acc_out[426];
          PRDATA[31:16] = acc_out[427];
        end
        215:
        begin
          PRDATA[15:0] = acc_out[428];
          PRDATA[31:16] = acc_out[429];
        end
        216:
        begin
          PRDATA[15:0] = acc_out[430];
          PRDATA[31:16] = acc_out[431];
        end
        217:
        begin
          PRDATA[15:0] = acc_out[432];
          PRDATA[31:16] = acc_out[433];
        end
        218:
        begin
          PRDATA[15:0] = acc_out[434];
          PRDATA[31:16] = acc_out[435];
        end
        219:
        begin
          PRDATA[15:0] = acc_out[436];
          PRDATA[31:16] = acc_out[437];
        end
        220:
        begin
          PRDATA[15:0] = acc_out[438];
          PRDATA[31:16] = acc_out[439];
        end
        221:
        begin
          PRDATA[15:0] = acc_out[440];
          PRDATA[31:16] = acc_out[441];
        end
        222:
        begin
          PRDATA[15:0] = acc_out[442];
          PRDATA[31:16] = acc_out[443];
        end
        223:
        begin
          PRDATA[15:0] = acc_out[444];
          PRDATA[31:16] = acc_out[445];
        end
        224:
        begin
          PRDATA[15:0] = acc_out[446];
          PRDATA[31:16] = acc_out[447];
        end
        225:
        begin
          PRDATA[15:0] = acc_out[448];
          PRDATA[31:16] = acc_out[449];
        end
        226:
        begin
          PRDATA[15:0] = acc_out[450];
          PRDATA[31:16] = acc_out[451];
        end
        227:
        begin
          PRDATA[15:0] = acc_out[452];
          PRDATA[31:16] = acc_out[453];
        end
        228:
        begin
          PRDATA[15:0] = acc_out[454];
          PRDATA[31:16] = acc_out[455];
        end
        229:
        begin
          PRDATA[15:0] = acc_out[456];
          PRDATA[31:16] = acc_out[457];
        end
        230:
        begin
          PRDATA[15:0] = acc_out[458];
          PRDATA[31:16] = acc_out[459];
        end
        231:
        begin
          PRDATA[15:0] = acc_out[460];
          PRDATA[31:16] = acc_out[461];
        end
        232:
        begin
          PRDATA[15:0] = acc_out[462];
          PRDATA[31:16] = acc_out[463];
        end
        233:
        begin
          PRDATA[15:0] = acc_out[464];
          PRDATA[31:16] = acc_out[465];
        end
        234:
        begin
          PRDATA[15:0] = acc_out[466];
          PRDATA[31:16] = acc_out[467];
        end
        235:
        begin
          PRDATA[15:0] = acc_out[468];
          PRDATA[31:16] = acc_out[469];
        end
        236:
        begin
          PRDATA[15:0] = acc_out[470];
          PRDATA[31:16] = acc_out[471];
        end
        237:
        begin
          PRDATA[15:0] = acc_out[472];
          PRDATA[31:16] = acc_out[473];
        end
        238:
        begin
          PRDATA[15:0] = acc_out[474];
          PRDATA[31:16] = acc_out[475];
        end
        239:
        begin
          PRDATA[15:0] = acc_out[476];
          PRDATA[31:16] = acc_out[477];
        end
        240:
        begin
          PRDATA[15:0] = acc_out[478];
          PRDATA[31:16] = acc_out[479];
        end
        241:
        begin
          PRDATA[15:0] = acc_out[480];
          PRDATA[31:16] = acc_out[481];
        end
        242:
        begin
          PRDATA[15:0] = acc_out[482];
          PRDATA[31:16] = acc_out[483];
        end
        243:
        begin
          PRDATA[15:0] = acc_out[484];
          PRDATA[31:16] = acc_out[485];
        end
        244:
        begin
          PRDATA[15:0] = acc_out[486];
          PRDATA[31:16] = acc_out[487];
        end
        245:
        begin
          PRDATA[15:0] = acc_out[488];
          PRDATA[31:16] = acc_out[489];
        end
        246:
        begin
          PRDATA[15:0] = acc_out[490];
          PRDATA[31:16] = acc_out[491];
        end
        247:
        begin
          PRDATA[15:0] = acc_out[492];
          PRDATA[31:16] = acc_out[493];
        end
        248:
        begin
          PRDATA[15:0] = acc_out[494];
          PRDATA[31:16] = acc_out[495];
        end
        249:
        begin
          PRDATA[15:0] = acc_out[496];
          PRDATA[31:16] = acc_out[497];
        end
        250:
        begin
          PRDATA[15:0] = acc_out[498];
          PRDATA[31:16] = acc_out[499];
        end
        251:
        begin
          PRDATA[15:0] = acc_out[500];
          PRDATA[31:16] = acc_out[501];
        end
        252:
        begin
          PRDATA[15:0] = acc_out[502];
          PRDATA[31:16] = acc_out[503];
        end
        253:
        begin
          PRDATA[15:0] = acc_out[504];
          PRDATA[31:16] = acc_out[505];
        end
        254:
        begin
          PRDATA[15:0] = acc_out[506];
          PRDATA[31:16] = acc_out[507];
        end
        255:
        begin
          PRDATA[15:0] = acc_out[508];
          PRDATA[31:16] = acc_out[509];
        end
        256:
        begin
          PRDATA[15:0] = acc_out[510];
          PRDATA[31:16] = acc_out[511];
        end
        257:
        begin
          PRDATA[15:0] = acc_out[512];
          PRDATA[31:16] = acc_out[513];
        end
        258:
        begin
          PRDATA[15:0] = acc_out[514];
          PRDATA[31:16] = acc_out[515];
        end
        259:
        begin
          PRDATA[15:0] = acc_out[516];
          PRDATA[31:16] = acc_out[517];
        end
        260:
        begin
          PRDATA[15:0] = acc_out[518];
          PRDATA[31:16] = acc_out[519];
        end
        261:
        begin
          PRDATA[15:0] = acc_out[520];
          PRDATA[31:16] = acc_out[521];
        end
        262:
        begin
          PRDATA[15:0] = acc_out[522];
          PRDATA[31:16] = acc_out[523];
        end
        263:
        begin
          PRDATA[15:0] = acc_out[524];
          PRDATA[31:16] = acc_out[525];
        end
        264:
        begin
          PRDATA[15:0] = acc_out[526];
          PRDATA[31:16] = acc_out[527];
        end
        265:
        begin
          PRDATA[15:0] = acc_out[528];
          PRDATA[31:16] = acc_out[529];
        end
        266:
        begin
          PRDATA[15:0] = acc_out[530];
          PRDATA[31:16] = acc_out[531];
        end
        267:
        begin
          PRDATA[15:0] = acc_out[532];
          PRDATA[31:16] = acc_out[533];
        end
        268:
        begin
          PRDATA[15:0] = acc_out[534];
          PRDATA[31:16] = acc_out[535];
        end
        269:
        begin
          PRDATA[15:0] = acc_out[536];
          PRDATA[31:16] = acc_out[537];
        end
        270:
        begin
          PRDATA[15:0] = acc_out[538];
          PRDATA[31:16] = acc_out[539];
        end
        271:
        begin
          PRDATA[15:0] = acc_out[540];
          PRDATA[31:16] = acc_out[541];
        end
        272:
        begin
          PRDATA[15:0] = acc_out[542];
          PRDATA[31:16] = acc_out[543];
        end
        273:
        begin
          PRDATA[15:0] = acc_out[544];
          PRDATA[31:16] = acc_out[545];
        end
        274:
        begin
          PRDATA[15:0] = acc_out[546];
          PRDATA[31:16] = acc_out[547];
        end
        275:
        begin
          PRDATA[15:0] = acc_out[548];
          PRDATA[31:16] = acc_out[549];
        end
        276:
        begin
          PRDATA[15:0] = acc_out[550];
          PRDATA[31:16] = acc_out[551];
        end
        277:
        begin
          PRDATA[15:0] = acc_out[552];
          PRDATA[31:16] = acc_out[553];
        end
        278:
        begin
          PRDATA[15:0] = acc_out[554];
          PRDATA[31:16] = acc_out[555];
        end
        279:
        begin
          PRDATA[15:0] = acc_out[556];
          PRDATA[31:16] = acc_out[557];
        end
        280:
        begin
          PRDATA[15:0] = acc_out[558];
          PRDATA[31:16] = acc_out[559];
        end
        281:
        begin
          PRDATA[15:0] = acc_out[560];
          PRDATA[31:16] = acc_out[561];
        end
        282:
        begin
          PRDATA[15:0] = acc_out[562];
          PRDATA[31:16] = acc_out[563];
        end
        283:
        begin
          PRDATA[15:0] = acc_out[564];
          PRDATA[31:16] = acc_out[565];
        end
        284:
        begin
          PRDATA[15:0] = acc_out[566];
          PRDATA[31:16] = acc_out[567];
        end
        285:
        begin
          PRDATA[15:0] = acc_out[568];
          PRDATA[31:16] = acc_out[569];
        end
        286:
        begin
          PRDATA[15:0] = acc_out[570];
          PRDATA[31:16] = acc_out[571];
        end
        287:
        begin
          PRDATA[15:0] = acc_out[572];
          PRDATA[31:16] = acc_out[573];
        end
        288:
        begin
          PRDATA[15:0] = acc_out[574];
          PRDATA[31:16] = acc_out[575];
        end
        289:
        begin
          PRDATA[15:0] = acc_out[576];
          PRDATA[31:16] = acc_out[577];
        end
        290:
        begin
          PRDATA[15:0] = acc_out[578];
          PRDATA[31:16] = acc_out[579];
        end
        291:
        begin
          PRDATA[15:0] = acc_out[580];
          PRDATA[31:16] = acc_out[581];
        end
        292:
        begin
          PRDATA[15:0] = acc_out[582];
          PRDATA[31:16] = acc_out[583];
        end
        293:
        begin
          PRDATA[15:0] = acc_out[584];
          PRDATA[31:16] = acc_out[585];
        end
        294:
        begin
          PRDATA[15:0] = acc_out[586];
          PRDATA[31:16] = acc_out[587];
        end
        295:
        begin
          PRDATA[15:0] = acc_out[588];
          PRDATA[31:16] = acc_out[589];
        end
        296:
        begin
          PRDATA[15:0] = acc_out[590];
          PRDATA[31:16] = acc_out[591];
        end
        297:
        begin
          PRDATA[15:0] = acc_out[592];
          PRDATA[31:16] = acc_out[593];
        end
        298:
        begin
          PRDATA[15:0] = acc_out[594];
          PRDATA[31:16] = acc_out[595];
        end
        299:
        begin
          PRDATA[15:0] = acc_out[596];
          PRDATA[31:16] = acc_out[597];
        end
        300:
        begin
          PRDATA[15:0] = acc_out[598];
          PRDATA[31:16] = acc_out[599];
        end
        301:
        begin
          PRDATA[15:0] = acc_out[600];
          PRDATA[31:16] = acc_out[601];
        end
        302:
        begin
          PRDATA[15:0] = acc_out[602];
          PRDATA[31:16] = acc_out[603];
        end
        303:
        begin
          PRDATA[15:0] = acc_out[604];
          PRDATA[31:16] = acc_out[605];
        end
        304:
        begin
          PRDATA[15:0] = acc_out[606];
          PRDATA[31:16] = acc_out[607];
        end
        305:
        begin
          PRDATA[15:0] = acc_out[608];
          PRDATA[31:16] = acc_out[609];
        end
        306:
        begin
          PRDATA[15:0] = acc_out[610];
          PRDATA[31:16] = acc_out[611];
        end
        307:
        begin
          PRDATA[15:0] = acc_out[612];
          PRDATA[31:16] = acc_out[613];
        end
        308:
        begin
          PRDATA[15:0] = acc_out[614];
          PRDATA[31:16] = acc_out[615];
        end
        309:
        begin
          PRDATA[15:0] = acc_out[616];
          PRDATA[31:16] = acc_out[617];
        end
        310:
        begin
          PRDATA[15:0] = acc_out[618];
          PRDATA[31:16] = acc_out[619];
        end
        311:
        begin
          PRDATA[15:0] = acc_out[620];
          PRDATA[31:16] = acc_out[621];
        end
        312:
        begin
          PRDATA[15:0] = acc_out[622];
          PRDATA[31:16] = acc_out[623];
        end
        313:
        begin
          PRDATA[15:0] = acc_out[624];
          PRDATA[31:16] = acc_out[625];
        end
        314:
        begin
          PRDATA[15:0] = acc_out[626];
          PRDATA[31:16] = acc_out[627];
        end
        315:
        begin
          PRDATA[15:0] = acc_out[628];
          PRDATA[31:16] = acc_out[629];
        end
        316:
        begin
          PRDATA[15:0] = acc_out[630];
          PRDATA[31:16] = acc_out[631];
        end
        317:
        begin
          PRDATA[15:0] = acc_out[632];
          PRDATA[31:16] = acc_out[633];
        end
        318:
        begin
          PRDATA[15:0] = acc_out[634];
          PRDATA[31:16] = acc_out[635];
        end
        319:
        begin
          PRDATA[15:0] = acc_out[636];
          PRDATA[31:16] = acc_out[637];
        end
        320:
        begin
          PRDATA[15:0] = acc_out[638];
          PRDATA[31:16] = acc_out[639];
        end
        321:
        begin
          PRDATA[15:0] = acc_out[640];
          PRDATA[31:16] = acc_out[641];
        end
        322:
        begin
          PRDATA[15:0] = acc_out[642];
          PRDATA[31:16] = acc_out[643];
        end
        323:
        begin
          PRDATA[15:0] = acc_out[644];
          PRDATA[31:16] = acc_out[645];
        end
        324:
        begin
          PRDATA[15:0] = acc_out[646];
          PRDATA[31:16] = acc_out[647];
        end
        325:
        begin
          PRDATA[15:0] = acc_out[648];
          PRDATA[31:16] = acc_out[649];
        end
        326:
        begin
          PRDATA[15:0] = acc_out[650];
          PRDATA[31:16] = acc_out[651];
        end
        327:
        begin
          PRDATA[15:0] = acc_out[652];
          PRDATA[31:16] = acc_out[653];
        end
        328:
        begin
          PRDATA[15:0] = acc_out[654];
          PRDATA[31:16] = acc_out[655];
        end
        329:
        begin
          PRDATA[15:0] = acc_out[656];
          PRDATA[31:16] = acc_out[657];
        end
        330:
        begin
          PRDATA[15:0] = acc_out[658];
          PRDATA[31:16] = acc_out[659];
        end
        331:
        begin
          PRDATA[15:0] = acc_out[660];
          PRDATA[31:16] = acc_out[661];
        end
        332:
        begin
          PRDATA[15:0] = acc_out[662];
          PRDATA[31:16] = acc_out[663];
        end
        333:
        begin
          PRDATA[15:0] = acc_out[664];
          PRDATA[31:16] = acc_out[665];
        end
        334:
        begin
          PRDATA[15:0] = acc_out[666];
          PRDATA[31:16] = acc_out[667];
        end
        335:
        begin
          PRDATA[15:0] = acc_out[668];
          PRDATA[31:16] = acc_out[669];
        end
        336:
        begin
          PRDATA[15:0] = acc_out[670];
          PRDATA[31:16] = acc_out[671];
        end
        337:
        begin
          PRDATA[15:0] = acc_out[672];
          PRDATA[31:16] = acc_out[673];
        end
        338:
        begin
          PRDATA[15:0] = acc_out[674];
          PRDATA[31:16] = acc_out[675];
        end
        339:
        begin
          PRDATA[15:0] = acc_out[676];
          PRDATA[31:16] = acc_out[677];
        end
        340:
        begin
          PRDATA[15:0] = acc_out[678];
          PRDATA[31:16] = acc_out[679];
        end
        341:
        begin
          PRDATA[15:0] = acc_out[680];
          PRDATA[31:16] = acc_out[681];
        end
        342:
        begin
          PRDATA[15:0] = acc_out[682];
          PRDATA[31:16] = acc_out[683];
        end
        343:
        begin
          PRDATA[15:0] = acc_out[684];
          PRDATA[31:16] = acc_out[685];
        end
        344:
        begin
          PRDATA[15:0] = acc_out[686];
          PRDATA[31:16] = acc_out[687];
        end
        345:
        begin
          PRDATA[15:0] = acc_out[688];
          PRDATA[31:16] = acc_out[689];
        end
        346:
        begin
          PRDATA[15:0] = acc_out[690];
          PRDATA[31:16] = acc_out[691];
        end
        347:
        begin
          PRDATA[15:0] = acc_out[692];
          PRDATA[31:16] = acc_out[693];
        end
        348:
        begin
          PRDATA[15:0] = acc_out[694];
          PRDATA[31:16] = acc_out[695];
        end
        349:
        begin
          PRDATA[15:0] = acc_out[696];
          PRDATA[31:16] = acc_out[697];
        end
        350:
        begin
          PRDATA[15:0] = acc_out[698];
          PRDATA[31:16] = acc_out[699];
        end
        351:
        begin
          PRDATA[15:0] = acc_out[700];
          PRDATA[31:16] = acc_out[701];
        end
        352:
        begin
          PRDATA[15:0] = acc_out[702];
          PRDATA[31:16] = acc_out[703];
        end
        353:
        begin
          PRDATA[15:0] = acc_out[704];
          PRDATA[31:16] = acc_out[705];
        end
        354:
        begin
          PRDATA[15:0] = acc_out[706];
          PRDATA[31:16] = acc_out[707];
        end
        355:
        begin
          PRDATA[15:0] = acc_out[708];
          PRDATA[31:16] = acc_out[709];
        end
        356:
        begin
          PRDATA[15:0] = acc_out[710];
          PRDATA[31:16] = acc_out[711];
        end
        357:
        begin
          PRDATA[15:0] = acc_out[712];
          PRDATA[31:16] = acc_out[713];
        end
        358:
        begin
          PRDATA[15:0] = acc_out[714];
          PRDATA[31:16] = acc_out[715];
        end
        359:
        begin
          PRDATA[15:0] = acc_out[716];
          PRDATA[31:16] = acc_out[717];
        end
        360:
        begin
          PRDATA[15:0] = acc_out[718];
          PRDATA[31:16] = acc_out[719];
        end
        361:
        begin
          PRDATA[15:0] = acc_out[720];
          PRDATA[31:16] = acc_out[721];
        end
        362:
        begin
          PRDATA[15:0] = acc_out[722];
          PRDATA[31:16] = acc_out[723];
        end
        363:
        begin
          PRDATA[15:0] = acc_out[724];
          PRDATA[31:16] = acc_out[725];
        end
        364:
        begin
          PRDATA[15:0] = acc_out[726];
          PRDATA[31:16] = acc_out[727];
        end
        365:
        begin
          PRDATA[15:0] = acc_out[728];
          PRDATA[31:16] = acc_out[729];
        end
        366:
        begin
          PRDATA[15:0] = acc_out[730];
          PRDATA[31:16] = acc_out[731];
        end
        367:
        begin
          PRDATA[15:0] = acc_out[732];
          PRDATA[31:16] = acc_out[733];
        end
        368:
        begin
          PRDATA[15:0] = acc_out[734];
          PRDATA[31:16] = acc_out[735];
        end
        369:
        begin
          PRDATA[15:0] = acc_out[736];
          PRDATA[31:16] = acc_out[737];
        end
        370:
        begin
          PRDATA[15:0] = acc_out[738];
          PRDATA[31:16] = acc_out[739];
        end
        371:
        begin
          PRDATA[15:0] = acc_out[740];
          PRDATA[31:16] = acc_out[741];
        end
        372:
        begin
          PRDATA[15:0] = acc_out[742];
          PRDATA[31:16] = acc_out[743];
        end
        373:
        begin
          PRDATA[15:0] = acc_out[744];
          PRDATA[31:16] = acc_out[745];
        end
        374:
        begin
          PRDATA[15:0] = acc_out[746];
          PRDATA[31:16] = acc_out[747];
        end
        375:
        begin
          PRDATA[15:0] = acc_out[748];
          PRDATA[31:16] = acc_out[749];
        end
        376:
        begin
          PRDATA[15:0] = acc_out[750];
          PRDATA[31:16] = acc_out[751];
        end
        377:
        begin
          PRDATA[15:0] = acc_out[752];
          PRDATA[31:16] = acc_out[753];
        end
        378:
        begin
          PRDATA[15:0] = acc_out[754];
          PRDATA[31:16] = acc_out[755];
        end
        379:
        begin
          PRDATA[15:0] = acc_out[756];
          PRDATA[31:16] = acc_out[757];
        end
        380:
        begin
          PRDATA[15:0] = acc_out[758];
          PRDATA[31:16] = acc_out[759];
        end
        381:
        begin
          PRDATA[15:0] = acc_out[760];
          PRDATA[31:16] = acc_out[761];
        end
        382:
        begin
          PRDATA[15:0] = acc_out[762];
          PRDATA[31:16] = acc_out[763];
        end
        383:
        begin
          PRDATA[15:0] = acc_out[764];
          PRDATA[31:16] = acc_out[765];
        end
        384:
        begin
          PRDATA[15:0] = acc_out[766];
          PRDATA[31:16] = acc_out[767];
        end
        385:
        begin
          PRDATA[15:0] = acc_out[768];
          PRDATA[31:16] = acc_out[769];
        end
        386:
        begin
          PRDATA[15:0] = acc_out[770];
          PRDATA[31:16] = acc_out[771];
        end
        387:
        begin
          PRDATA[15:0] = acc_out[772];
          PRDATA[31:16] = acc_out[773];
        end
        388:
        begin
          PRDATA[15:0] = acc_out[774];
          PRDATA[31:16] = acc_out[775];
        end
        389:
        begin
          PRDATA[15:0] = acc_out[776];
          PRDATA[31:16] = acc_out[777];
        end
        390:
        begin
          PRDATA[15:0] = acc_out[778];
          PRDATA[31:16] = acc_out[779];
        end
        391:
        begin
          PRDATA[15:0] = acc_out[780];
          PRDATA[31:16] = acc_out[781];
        end
        392:
        begin
          PRDATA[15:0] = acc_out[782];
          PRDATA[31:16] = acc_out[783];
        end
        393:
        begin
          PRDATA[15:0] = acc_out[784];
          PRDATA[31:16] = acc_out[785];
        end
        394:
        begin
          PRDATA[15:0] = acc_out[786];
          PRDATA[31:16] = acc_out[787];
        end
        395:
        begin
          PRDATA[15:0] = acc_out[788];
          PRDATA[31:16] = acc_out[789];
        end
        396:
        begin
          PRDATA[15:0] = acc_out[790];
          PRDATA[31:16] = acc_out[791];
        end
        397:
        begin
          PRDATA[15:0] = acc_out[792];
          PRDATA[31:16] = acc_out[793];
        end
        398:
        begin
          PRDATA[15:0] = acc_out[794];
          PRDATA[31:16] = acc_out[795];
        end
        399:
        begin
          PRDATA[15:0] = acc_out[796];
          PRDATA[31:16] = acc_out[797];
        end
        400:
        begin
          PRDATA[15:0] = acc_out[798];
          PRDATA[31:16] = acc_out[799];
        end
        401:
        begin
          PRDATA[15:0] = acc_out[800];
          PRDATA[31:16] = acc_out[801];
        end
        402:
        begin
          PRDATA[15:0] = acc_out[802];
          PRDATA[31:16] = acc_out[803];
        end
        403:
        begin
          PRDATA[15:0] = acc_out[804];
          PRDATA[31:16] = acc_out[805];
        end
        404:
        begin
          PRDATA[15:0] = acc_out[806];
          PRDATA[31:16] = acc_out[807];
        end
        405:
        begin
          PRDATA[15:0] = acc_out[808];
          PRDATA[31:16] = acc_out[809];
        end
        406:
        begin
          PRDATA[15:0] = acc_out[810];
          PRDATA[31:16] = acc_out[811];
        end
        407:
        begin
          PRDATA[15:0] = acc_out[812];
          PRDATA[31:16] = acc_out[813];
        end
        408:
        begin
          PRDATA[15:0] = acc_out[814];
          PRDATA[31:16] = acc_out[815];
        end
        409:
        begin
          PRDATA[15:0] = acc_out[816];
          PRDATA[31:16] = acc_out[817];
        end
        410:
        begin
          PRDATA[15:0] = acc_out[818];
          PRDATA[31:16] = acc_out[819];
        end
        411:
        begin
          PRDATA[15:0] = acc_out[820];
          PRDATA[31:16] = acc_out[821];
        end
        412:
        begin
          PRDATA[15:0] = acc_out[822];
          PRDATA[31:16] = acc_out[823];
        end
        413:
        begin
          PRDATA[15:0] = acc_out[824];
          PRDATA[31:16] = acc_out[825];
        end
        414:
        begin
          PRDATA[15:0] = acc_out[826];
          PRDATA[31:16] = acc_out[827];
        end
        415:
        begin
          PRDATA[15:0] = acc_out[828];
          PRDATA[31:16] = acc_out[829];
        end
        416:
        begin
          PRDATA[15:0] = acc_out[830];
          PRDATA[31:16] = acc_out[831];
        end
        417:
        begin
          PRDATA[15:0] = acc_out[832];
          PRDATA[31:16] = acc_out[833];
        end
        418:
        begin
          PRDATA[15:0] = acc_out[834];
          PRDATA[31:16] = acc_out[835];
        end
        419:
        begin
          PRDATA[15:0] = acc_out[836];
          PRDATA[31:16] = acc_out[837];
        end
        420:
        begin
          PRDATA[15:0] = acc_out[838];
          PRDATA[31:16] = acc_out[839];
        end
        421:
        begin
          PRDATA[15:0] = acc_out[840];
          PRDATA[31:16] = acc_out[841];
        end
        422:
        begin
          PRDATA[15:0] = acc_out[842];
          PRDATA[31:16] = acc_out[843];
        end
        423:
        begin
          PRDATA[15:0] = acc_out[844];
          PRDATA[31:16] = acc_out[845];
        end
        424:
        begin
          PRDATA[15:0] = acc_out[846];
          PRDATA[31:16] = acc_out[847];
        end
        425:
        begin
          PRDATA[15:0] = acc_out[848];
          PRDATA[31:16] = acc_out[849];
        end
        426:
        begin
          PRDATA[15:0] = acc_out[850];
          PRDATA[31:16] = acc_out[851];
        end
        427:
        begin
          PRDATA[15:0] = acc_out[852];
          PRDATA[31:16] = acc_out[853];
        end
        428:
        begin
          PRDATA[15:0] = acc_out[854];
          PRDATA[31:16] = acc_out[855];
        end
        429:
        begin
          PRDATA[15:0] = acc_out[856];
          PRDATA[31:16] = acc_out[857];
        end
        430:
        begin
          PRDATA[15:0] = acc_out[858];
          PRDATA[31:16] = acc_out[859];
        end
        431:
        begin
          PRDATA[15:0] = acc_out[860];
          PRDATA[31:16] = acc_out[861];
        end
        432:
        begin
          PRDATA[15:0] = acc_out[862];
          PRDATA[31:16] = acc_out[863];
        end
        433:
        begin
          PRDATA[15:0] = acc_out[864];
          PRDATA[31:16] = acc_out[865];
        end
        434:
        begin
          PRDATA[15:0] = acc_out[866];
          PRDATA[31:16] = acc_out[867];
        end
        435:
        begin
          PRDATA[15:0] = acc_out[868];
          PRDATA[31:16] = acc_out[869];
        end
        436:
        begin
          PRDATA[15:0] = acc_out[870];
          PRDATA[31:16] = acc_out[871];
        end
        437:
        begin
          PRDATA[15:0] = acc_out[872];
          PRDATA[31:16] = acc_out[873];
        end
        438:
        begin
          PRDATA[15:0] = acc_out[874];
          PRDATA[31:16] = acc_out[875];
        end
        439:
        begin
          PRDATA[15:0] = acc_out[876];
          PRDATA[31:16] = acc_out[877];
        end
        440:
        begin
          PRDATA[15:0] = acc_out[878];
          PRDATA[31:16] = acc_out[879];
        end
        441:
        begin
          PRDATA[15:0] = acc_out[880];
          PRDATA[31:16] = acc_out[881];
        end
        442:
        begin
          PRDATA[15:0] = acc_out[882];
          PRDATA[31:16] = acc_out[883];
        end
        443:
        begin
          PRDATA[15:0] = acc_out[884];
          PRDATA[31:16] = acc_out[885];
        end
        444:
        begin
          PRDATA[15:0] = acc_out[886];
          PRDATA[31:16] = acc_out[887];
        end
        445:
        begin
          PRDATA[15:0] = acc_out[888];
          PRDATA[31:16] = acc_out[889];
        end
        446:
        begin
          PRDATA[15:0] = acc_out[890];
          PRDATA[31:16] = acc_out[891];
        end
        447:
        begin
          PRDATA[15:0] = acc_out[892];
          PRDATA[31:16] = acc_out[893];
        end
        448:
        begin
          PRDATA[15:0] = acc_out[894];
          PRDATA[31:16] = acc_out[895];
        end
        449:
        begin
          PRDATA[15:0] = acc_out[896];
          PRDATA[31:16] = acc_out[897];
        end
        450:
        begin
          PRDATA[15:0] = acc_out[898];
          PRDATA[31:16] = acc_out[899];
        end
        451:
        begin
          PRDATA[15:0] = acc_out[900];
          PRDATA[31:16] = acc_out[901];
        end
        452:
        begin
          PRDATA[15:0] = acc_out[902];
          PRDATA[31:16] = acc_out[903];
        end
        453:
        begin
          PRDATA[15:0] = acc_out[904];
          PRDATA[31:16] = acc_out[905];
        end
        454:
        begin
          PRDATA[15:0] = acc_out[906];
          PRDATA[31:16] = acc_out[907];
        end
        455:
        begin
          PRDATA[15:0] = acc_out[908];
          PRDATA[31:16] = acc_out[909];
        end
        456:
        begin
          PRDATA[15:0] = acc_out[910];
          PRDATA[31:16] = acc_out[911];
        end
        457:
        begin
          PRDATA[15:0] = acc_out[912];
          PRDATA[31:16] = acc_out[913];
        end
        458:
        begin
          PRDATA[15:0] = acc_out[914];
          PRDATA[31:16] = acc_out[915];
        end
        459:
        begin
          PRDATA[15:0] = acc_out[916];
          PRDATA[31:16] = acc_out[917];
        end
        460:
        begin
          PRDATA[15:0] = acc_out[918];
          PRDATA[31:16] = acc_out[919];
        end
        461:
        begin
          PRDATA[15:0] = acc_out[920];
          PRDATA[31:16] = acc_out[921];
        end
        462:
        begin
          PRDATA[15:0] = acc_out[922];
          PRDATA[31:16] = acc_out[923];
        end
        463:
        begin
          PRDATA[15:0] = acc_out[924];
          PRDATA[31:16] = acc_out[925];
        end
        464:
        begin
          PRDATA[15:0] = acc_out[926];
          PRDATA[31:16] = acc_out[927];
        end
        465:
        begin
          PRDATA[15:0] = acc_out[928];
          PRDATA[31:16] = acc_out[929];
        end
        466:
        begin
          PRDATA[15:0] = acc_out[930];
          PRDATA[31:16] = acc_out[931];
        end
        467:
        begin
          PRDATA[15:0] = acc_out[932];
          PRDATA[31:16] = acc_out[933];
        end
        468:
        begin
          PRDATA[15:0] = acc_out[934];
          PRDATA[31:16] = acc_out[935];
        end
        469:
        begin
          PRDATA[15:0] = acc_out[936];
          PRDATA[31:16] = acc_out[937];
        end
        470:
        begin
          PRDATA[15:0] = acc_out[938];
          PRDATA[31:16] = acc_out[939];
        end
        471:
        begin
          PRDATA[15:0] = acc_out[940];
          PRDATA[31:16] = acc_out[941];
        end
        472:
        begin
          PRDATA[15:0] = acc_out[942];
          PRDATA[31:16] = acc_out[943];
        end
        473:
        begin
          PRDATA[15:0] = acc_out[944];
          PRDATA[31:16] = acc_out[945];
        end
        474:
        begin
          PRDATA[15:0] = acc_out[946];
          PRDATA[31:16] = acc_out[947];
        end
        475:
        begin
          PRDATA[15:0] = acc_out[948];
          PRDATA[31:16] = acc_out[949];
        end
        476:
        begin
          PRDATA[15:0] = acc_out[950];
          PRDATA[31:16] = acc_out[951];
        end
        477:
        begin
          PRDATA[15:0] = acc_out[952];
          PRDATA[31:16] = acc_out[953];
        end
        478:
        begin
          PRDATA[15:0] = acc_out[954];
          PRDATA[31:16] = acc_out[955];
        end
        479:
        begin
          PRDATA[15:0] = acc_out[956];
          PRDATA[31:16] = acc_out[957];
        end
        480:
        begin
          PRDATA[15:0] = acc_out[958];
          PRDATA[31:16] = acc_out[959];
        end
        481:
        begin
          PRDATA[15:0] = acc_out[960];
          PRDATA[31:16] = acc_out[961];
        end
        482:
        begin
          PRDATA[15:0] = acc_out[962];
          PRDATA[31:16] = acc_out[963];
        end
        483:
        begin
          PRDATA[15:0] = acc_out[964];
          PRDATA[31:16] = acc_out[965];
        end
        484:
        begin
          PRDATA[15:0] = acc_out[966];
          PRDATA[31:16] = acc_out[967];
        end
        485:
        begin
          PRDATA[15:0] = acc_out[968];
          PRDATA[31:16] = acc_out[969];
        end
        486:
        begin
          PRDATA[15:0] = acc_out[970];
          PRDATA[31:16] = acc_out[971];
        end
        487:
        begin
          PRDATA[15:0] = acc_out[972];
          PRDATA[31:16] = acc_out[973];
        end
        488:
        begin
          PRDATA[15:0] = acc_out[974];
          PRDATA[31:16] = acc_out[975];
        end
        489:
        begin
          PRDATA[15:0] = acc_out[976];
          PRDATA[31:16] = acc_out[977];
        end
        490:
        begin
          PRDATA[15:0] = acc_out[978];
          PRDATA[31:16] = acc_out[979];
        end
        491:
        begin
          PRDATA[15:0] = acc_out[980];
          PRDATA[31:16] = acc_out[981];
        end
        492:
        begin
          PRDATA[15:0] = acc_out[982];
          PRDATA[31:16] = acc_out[983];
        end
        493:
        begin
          PRDATA[15:0] = acc_out[984];
          PRDATA[31:16] = acc_out[985];
        end
        494:
        begin
          PRDATA[15:0] = acc_out[986];
          PRDATA[31:16] = acc_out[987];
        end
        495:
        begin
          PRDATA[15:0] = acc_out[988];
          PRDATA[31:16] = acc_out[989];
        end
        496:
        begin
          PRDATA[15:0] = acc_out[990];
          PRDATA[31:16] = acc_out[991];
        end
        497:
        begin
          PRDATA[15:0] = acc_out[992];
          PRDATA[31:16] = acc_out[993];
        end
        498:
        begin
          PRDATA[15:0] = acc_out[994];
          PRDATA[31:16] = acc_out[995];
        end
        499:
        begin
          PRDATA[15:0] = acc_out[996];
          PRDATA[31:16] = acc_out[997];
        end
        500:
        begin
          PRDATA[15:0] = acc_out[998];
          PRDATA[31:16] = acc_out[999];
        end
        501:
        begin
          PRDATA[15:0] = acc_out[1000];
          PRDATA[31:16] = acc_out[1001];
        end
        502:
        begin
          PRDATA[15:0] = acc_out[1002];
          PRDATA[31:16] = acc_out[1003];
        end
        503:
        begin
          PRDATA[15:0] = acc_out[1004];
          PRDATA[31:16] = acc_out[1005];
        end
        504:
        begin
          PRDATA[15:0] = acc_out[1006];
          PRDATA[31:16] = acc_out[1007];
        end
        505:
        begin
          PRDATA[15:0] = acc_out[1008];
          PRDATA[31:16] = acc_out[1009];
        end
        506:
        begin
          PRDATA[15:0] = acc_out[1010];
          PRDATA[31:16] = acc_out[1011];
        end
        507:
        begin
          PRDATA[15:0] = acc_out[1012];
          PRDATA[31:16] = acc_out[1013];
        end
        508:
        begin
          PRDATA[15:0] = acc_out[1014];
          PRDATA[31:16] = acc_out[1015];
        end
        509:
        begin
          PRDATA[15:0] = acc_out[1016];
          PRDATA[31:16] = acc_out[1017];
        end
        510:
        begin
          PRDATA[15:0] = acc_out[1018];
          PRDATA[31:16] = acc_out[1019];
        end
        511:
        begin
          PRDATA[15:0] = acc_out[1020];
          PRDATA[31:16] = acc_out[1021];
        end
        512:
        begin
          PRDATA[15:0] = acc_out[1022];
          PRDATA[31:16] = acc_out[1023];
        end
      endcase
    end
  end

  assign PREADY  = 1'b1;
  assign PSLVERR = 1'b0;

endmodule
