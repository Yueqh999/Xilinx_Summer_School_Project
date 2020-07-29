// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module CvtColor (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_src_rows_V_dout,
        p_src_rows_V_empty_n,
        p_src_rows_V_read,
        p_src_cols_V_dout,
        p_src_cols_V_empty_n,
        p_src_cols_V_read,
        p_src_data_stream_0_V_dout,
        p_src_data_stream_0_V_empty_n,
        p_src_data_stream_0_V_read,
        p_src_data_stream_1_V_dout,
        p_src_data_stream_1_V_empty_n,
        p_src_data_stream_1_V_read,
        p_src_data_stream_2_V_dout,
        p_src_data_stream_2_V_empty_n,
        p_src_data_stream_2_V_read,
        p_dst_data_stream_V_din,
        p_dst_data_stream_V_full_n,
        p_dst_data_stream_V_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state8 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] p_src_rows_V_dout;
input   p_src_rows_V_empty_n;
output   p_src_rows_V_read;
input  [31:0] p_src_cols_V_dout;
input   p_src_cols_V_empty_n;
output   p_src_cols_V_read;
input  [7:0] p_src_data_stream_0_V_dout;
input   p_src_data_stream_0_V_empty_n;
output   p_src_data_stream_0_V_read;
input  [7:0] p_src_data_stream_1_V_dout;
input   p_src_data_stream_1_V_empty_n;
output   p_src_data_stream_1_V_read;
input  [7:0] p_src_data_stream_2_V_dout;
input   p_src_data_stream_2_V_empty_n;
output   p_src_data_stream_2_V_read;
output  [7:0] p_dst_data_stream_V_din;
input   p_dst_data_stream_V_full_n;
output   p_dst_data_stream_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg p_src_rows_V_read;
reg p_src_cols_V_read;
reg p_src_data_stream_0_V_read;
reg p_src_data_stream_1_V_read;
reg p_src_data_stream_2_V_read;
reg p_dst_data_stream_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    p_src_rows_V_blk_n;
reg    p_src_cols_V_blk_n;
reg    p_src_data_stream_0_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] tmp_23_i_reg_364;
reg    p_src_data_stream_1_V_blk_n;
reg    p_src_data_stream_2_V_blk_n;
reg    p_dst_data_stream_V_blk_n;
reg    ap_enable_reg_pp0_iter4;
reg   [0:0] tmp_23_i_reg_364_pp0_iter3_reg;
reg   [30:0] j_i_reg_206;
reg   [31:0] cols_reg_345;
reg    ap_block_state1;
reg   [31:0] rows_reg_350;
wire   [0:0] tmp_i_fu_221_p2;
wire    ap_CS_fsm_state2;
wire   [30:0] i_fu_226_p2;
reg   [30:0] i_reg_359;
wire   [0:0] tmp_23_i_fu_236_p2;
wire    ap_block_state3_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_state6_pp0_stage0_iter3;
reg    ap_block_state7_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_23_i_reg_364_pp0_iter1_reg;
reg   [0:0] tmp_23_i_reg_364_pp0_iter2_reg;
wire   [30:0] j_fu_241_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [7:0] tmp_50_reg_373;
reg   [7:0] tmp_51_reg_378;
reg   [7:0] tmp_51_reg_378_pp0_iter2_reg;
reg   [7:0] tmp_52_reg_383;
reg   [7:0] tmp_52_reg_383_pp0_iter2_reg;
wire   [28:0] r_V_i_i_fu_320_p2;
reg   [28:0] r_V_i_i_reg_388;
wire   [7:0] p_Val2_s_fu_312_p3;
reg   [7:0] p_Val2_s_reg_393;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg   [30:0] i_i_reg_195;
wire    ap_CS_fsm_state8;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] i_cast_i_fu_217_p1;
wire   [31:0] j_cast_i_fu_232_p1;
wire   [28:0] grp_fu_337_p3;
wire   [29:0] grp_fu_326_p3;
wire   [0:0] tmp_fu_268_p3;
wire   [7:0] tmp_8_i_i_i_cast_i_fu_275_p1;
wire   [7:0] p_Val2_6_fu_259_p4;
wire   [0:0] tmp_47_fu_285_p3;
wire   [7:0] p_Val2_7_fu_279_p2;
wire   [0:0] tmp_48_fu_298_p3;
wire   [0:0] rev_fu_292_p2;
wire   [0:0] deleted_zeros_fu_306_p2;
wire   [21:0] r_V_i_i_fu_320_p0;
wire   [7:0] r_V_i_i_fu_320_p1;
wire   [22:0] grp_fu_326_p0;
wire   [7:0] grp_fu_326_p1;
wire   [28:0] grp_fu_326_p2;
wire   [19:0] grp_fu_337_p0;
wire   [7:0] grp_fu_337_p1;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [29:0] grp_fu_326_p10;
wire   [29:0] grp_fu_326_p20;
wire   [27:0] grp_fu_337_p10;
wire   [28:0] r_V_i_i_fu_320_p10;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
end

ov5640_sobel_mul_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 22 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 29 ))
ov5640_sobel_mul_bkb_U25(
    .din0(r_V_i_i_fu_320_p0),
    .din1(r_V_i_i_fu_320_p1),
    .dout(r_V_i_i_fu_320_p2)
);

ov5640_sobel_mac_cud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 23 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 30 ))
ov5640_sobel_mac_cud_U26(
    .din0(grp_fu_326_p0),
    .din1(grp_fu_326_p1),
    .din2(grp_fu_326_p2),
    .dout(grp_fu_326_p3)
);

ov5640_sobel_mac_dEe #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 20 ),
    .din1_WIDTH( 8 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 29 ))
ov5640_sobel_mac_dEe_U27(
    .din0(grp_fu_337_p0),
    .din1(grp_fu_337_p1),
    .din2(r_V_i_i_reg_388),
    .dout(grp_fu_337_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((tmp_i_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((tmp_i_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if (((tmp_i_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        i_i_reg_195 <= i_reg_359;
    end else if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_i_reg_195 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_23_i_fu_236_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        j_i_reg_206 <= j_fu_241_p2;
    end else if (((tmp_i_fu_221_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        j_i_reg_206 <= 31'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_reg_345 <= p_src_cols_V_dout;
        rows_reg_350 <= p_src_rows_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_reg_359 <= i_fu_226_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_23_i_reg_364_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_Val2_s_reg_393 <= p_Val2_s_fu_312_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_23_i_reg_364_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        r_V_i_i_reg_388 <= r_V_i_i_fu_320_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_23_i_reg_364 <= tmp_23_i_fu_236_p2;
        tmp_23_i_reg_364_pp0_iter1_reg <= tmp_23_i_reg_364;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        tmp_23_i_reg_364_pp0_iter2_reg <= tmp_23_i_reg_364_pp0_iter1_reg;
        tmp_23_i_reg_364_pp0_iter3_reg <= tmp_23_i_reg_364_pp0_iter2_reg;
        tmp_51_reg_378_pp0_iter2_reg <= tmp_51_reg_378;
        tmp_52_reg_383_pp0_iter2_reg <= tmp_52_reg_383;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_50_reg_373 <= p_src_data_stream_0_V_dout;
        tmp_51_reg_378 <= p_src_data_stream_1_V_dout;
        tmp_52_reg_383 <= p_src_data_stream_2_V_dout;
    end
end

always @ (*) begin
    if ((tmp_23_i_fu_236_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364_pp0_iter3_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        p_dst_data_stream_V_blk_n = p_dst_data_stream_V_full_n;
    end else begin
        p_dst_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364_pp0_iter3_reg == 1'd1) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_dst_data_stream_V_write = 1'b1;
    end else begin
        p_dst_data_stream_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_V_blk_n = p_src_cols_V_empty_n;
    end else begin
        p_src_cols_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_cols_V_read = 1'b1;
    end else begin
        p_src_cols_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_src_data_stream_0_V_blk_n = p_src_data_stream_0_V_empty_n;
    end else begin
        p_src_data_stream_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_src_data_stream_0_V_read = 1'b1;
    end else begin
        p_src_data_stream_0_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_src_data_stream_1_V_blk_n = p_src_data_stream_1_V_empty_n;
    end else begin
        p_src_data_stream_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_src_data_stream_1_V_read = 1'b1;
    end else begin
        p_src_data_stream_1_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_src_data_stream_2_V_blk_n = p_src_data_stream_2_V_empty_n;
    end else begin
        p_src_data_stream_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_23_i_reg_364 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_src_data_stream_2_V_read = 1'b1;
    end else begin
        p_src_data_stream_2_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_rows_V_blk_n = p_src_rows_V_empty_n;
    end else begin
        p_src_rows_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        p_src_rows_V_read = 1'b1;
    end else begin
        p_src_rows_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_i_fu_221_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (tmp_23_i_fu_236_p2 == 1'd0)) & ~((ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (tmp_23_i_fu_236_p2 == 1'd0)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((tmp_23_i_reg_364_pp0_iter3_reg == 1'd1) & (p_dst_data_stream_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_2_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_1_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_0_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((tmp_23_i_reg_364_pp0_iter3_reg == 1'd1) & (p_dst_data_stream_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_2_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_1_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_0_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((tmp_23_i_reg_364_pp0_iter3_reg == 1'd1) & (p_dst_data_stream_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_2_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_1_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_0_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (p_src_cols_V_empty_n == 1'b0) | (p_src_rows_V_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = (((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_2_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_1_V_empty_n == 1'b0)) | ((tmp_23_i_reg_364 == 1'd1) & (p_src_data_stream_0_V_empty_n == 1'b0)));
end

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state7_pp0_stage0_iter4 = ((tmp_23_i_reg_364_pp0_iter3_reg == 1'd1) & (p_dst_data_stream_V_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign deleted_zeros_fu_306_p2 = (tmp_48_fu_298_p3 | rev_fu_292_p2);

assign grp_fu_326_p0 = 30'd2462056;

assign grp_fu_326_p1 = grp_fu_326_p10;

assign grp_fu_326_p10 = tmp_51_reg_378_pp0_iter2_reg;

assign grp_fu_326_p2 = grp_fu_326_p20;

assign grp_fu_326_p20 = grp_fu_337_p3;

assign grp_fu_337_p0 = 28'd478150;

assign grp_fu_337_p1 = grp_fu_337_p10;

assign grp_fu_337_p10 = tmp_52_reg_383_pp0_iter2_reg;

assign i_cast_i_fu_217_p1 = i_i_reg_195;

assign i_fu_226_p2 = (i_i_reg_195 + 31'd1);

assign j_cast_i_fu_232_p1 = j_i_reg_206;

assign j_fu_241_p2 = (j_i_reg_206 + 31'd1);

assign p_Val2_6_fu_259_p4 = {{grp_fu_326_p3[29:22]}};

assign p_Val2_7_fu_279_p2 = (tmp_8_i_i_i_cast_i_fu_275_p1 + p_Val2_6_fu_259_p4);

assign p_Val2_s_fu_312_p3 = ((deleted_zeros_fu_306_p2[0:0] === 1'b1) ? p_Val2_7_fu_279_p2 : 8'd255);

assign p_dst_data_stream_V_din = p_Val2_s_reg_393;

assign r_V_i_i_fu_320_p0 = 29'd1254096;

assign r_V_i_i_fu_320_p1 = r_V_i_i_fu_320_p10;

assign r_V_i_i_fu_320_p10 = tmp_50_reg_373;

assign rev_fu_292_p2 = (tmp_47_fu_285_p3 ^ 1'd1);

assign tmp_23_i_fu_236_p2 = (($signed(j_cast_i_fu_232_p1) < $signed(cols_reg_345)) ? 1'b1 : 1'b0);

assign tmp_47_fu_285_p3 = grp_fu_326_p3[32'd29];

assign tmp_48_fu_298_p3 = p_Val2_7_fu_279_p2[32'd7];

assign tmp_8_i_i_i_cast_i_fu_275_p1 = tmp_fu_268_p3;

assign tmp_fu_268_p3 = grp_fu_326_p3[32'd21];

assign tmp_i_fu_221_p2 = (($signed(i_cast_i_fu_217_p1) < $signed(rows_reg_350)) ? 1'b1 : 1'b0);

endmodule //CvtColor
