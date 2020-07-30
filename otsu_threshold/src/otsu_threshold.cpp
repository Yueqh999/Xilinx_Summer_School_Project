#include "otsu_threshold.h"

void ov5640_otsu_threshold(AXI_STREAM & INPUT_STREAM,
					       AXI_STREAM & OUTPUT_STREAM,
						   int rows,
						   int cols
){

#pragma HLS INTERFACE axis port=INPUT_STREAM
#pragma HLS INTERFACE axis port=OUTPUT_STREAM
#pragma HLS INTERFACE s_axilite port=rows
#pragma HLS INTERFACE s_axilite port=cols
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS dataflow

	//hls::mat ��ʽ����
	RGB_IMAGE img_0(rows,cols);
	GRAY_IMAGE img_1(rows,cols);
	GRAY_IMAGE img_2(rows,cols);
	RGB_IMAGE img_3(rows,cols);

	//�� AXI4 Stream ����ת���� hls::mat ��ʽ
	hls::AXIvideo2Mat(INPUT_STREAM,img_0);

	//�� RGB888 ��ʽ�Ĳ�ɫ����ת���ɻҶ�����
	hls::CvtColor<HLS_RGB2GRAY,HLS_8UC3,HLS_8UC1>(img_0,img_1);

	//�ԻҶ�ͼ�����OTSU����Ӧ��ֵ��
	hls::Otsu_threshold<HLS_8UC1,HLS_8UC1,MAX_HEIGHT,MAX_WIDTH>(img_1,img_2);

	//���Ҷ�����ת��������ͨ���ĻҶ�ͼ��
	hls::CvtColor<HLS_GRAY2RGB,HLS_8UC1,HLS_8UC3>(img_2,img_3);

	//�� hls::mat ��ʽ����ת���� AXI4 Stream ��ʽ
	hls::Mat2AXIvideo(img_3,OUTPUT_STREAM);
}
