 #include "hls_opencv.h"
#include "otsu_threshold.h"

using namespace cv;

int otsu(IplImage* image)
{
	int width = image->width;
	int height = image->height;
	int pixel_count[256];

    int 		front_pixel_count;			//ǰ��ͼ�����ظ���
    int 		back_pixel_count;			//����ͼ�����ظ���
	float 		front_pixel_probability;	//ǰ��ͼ�����س��ֵĸ���
	float 		back_pixel_probability;		//����ͼ�����س��ֵĸ���
	int 		front_gray_count;			//ǰ���Ҷ��ܺ�
	int 		back_gray_count;			//�����Ҷ��ܺ�
	int 		total_gray;					//����ͼ��Ҷ��ܺ�
	float 		front_gray_average;			//ǰ��ƽ���Ҷ�
	float 		back_gray_average;			//����ƽ���Ҷ�
	float 		total_gray_average;			//����ͼ���ƽ���Ҷ�
	int 		threshold_tmp;				//��ʱ��ֵ
	int 		threshold = 0;				//��䷽��������ֵ
	float 		interclass_variance_tmp; 	//��ʱ��䷽��
	float 		interclass_variance_max; 	//�����䷽��

	uchar* data = (uchar*)image->imageData;

	//��ʼ��ÿ���Ҷȼ����ָ���
	for(int i = 0; i < 256; i++){
		pixel_count[i] = 0;
	}

	//ͳ�ƻҶȼ���ÿ������������ͼ���еĸ���
	for(int i = 0; i < height; i++){
		for(int j = 0; j < width; j++){
			pixel_count[data[i * image->widthStep + j]]++;
		}
	}

	//����otsu�㷨���õ�ǰ���ͱ����ķָ�
	//�����Ҷȼ�[0��255]��������������ĻҶ�ֵΪ�����ֵ

	 for(threshold_tmp = 0; threshold_tmp < 256; threshold_tmp++){

		front_pixel_count = back_pixel_count = 0;
		front_pixel_probability = back_pixel_probability = 0;
		front_gray_count = back_gray_count = 0;
		front_gray_average = back_gray_average = total_gray_average = 0;

		for(int j = 0; j < 256; j++){
			//ǰ������
			if(j <= threshold_tmp){
				//��threshold_tmpΪ��ֵ���࣬����ǰ��ͼ�����س��ֵĸ����ͻҶ��ܺ�
				front_pixel_count += pixel_count[j];
				front_gray_count += j * pixel_count[j];
			}
			//��������
			else{
				//��threshold_tmpΪ��ֵ���࣬���㱳��ͼ�����س��ֵĸ����ͻҶ��ܺ�
				back_pixel_count += pixel_count[j];
				back_gray_count += j * pixel_count[j];
			}
		}

		//ǰ��ͼ�����س��ֵĸ���
		front_pixel_probability = (float)front_pixel_count / (width*height);
		//����ͼ�����س��ֵĸ���
		back_pixel_probability = (float)back_pixel_count / (width*height);
		//����ͼ��Ҷ��ܺ�
		total_gray = front_gray_count + back_gray_count;
		//ǰ��ƽ���Ҷ�
		front_gray_average = (float)front_gray_count / front_pixel_count;
		//����ƽ���Ҷ�
		back_gray_average = (float)back_gray_count / back_pixel_count;
		//����ͼ��ƽ���Ҷ�
		total_gray_average = (float)total_gray / (width*height);

		//������䷽��
		interclass_variance_tmp = front_pixel_probability * (front_gray_average - total_gray_average) * (front_gray_average - total_gray_average)
								+ back_pixel_probability * (back_gray_average - total_gray_average) * (back_gray_average - total_gray_average);
		//�ҳ������䷽���Լ���Ӧ����ֵ
		if (interclass_variance_tmp > interclass_variance_max){
			interclass_variance_max = interclass_variance_tmp;
			threshold = threshold_tmp;
		}
	}
	//���������ֵ;
	return threshold;
}

int main(int argc, char* argv[])
{
	for (int i = 0; i< 2; i++){

		IplImage* src = cvLoadImage("lena.jpg");
		IplImage* src_lena = cvLoadImage("lena.jpg",0);
		IplImage* dst = cvCreateImage(cvGetSize(src), src->depth, src->nChannels);
		IplImage* threshold_Image = cvCreateImage(cvGetSize(src), 8, 1);

		AXI_STREAM  src_axi;
		AXI_STREAM 	dst_axi;
		IplImage2AXIvideo(src, src_axi);
		ov5640_otsu_threshold(src_axi, dst_axi, src->height, src->width);
		AXIvideo2IplImage(dst_axi, dst);
		cvThreshold(src_lena, threshold_Image, 100, 255, CV_THRESH_BINARY);
		cvShowImage("lena", src_lena);
		cvShowImage("lena_threshold", threshold_Image);
		cvShowImage("lena_otsu_threshold", dst);

		if(i == 1)
			waitKey(0);

		cvReleaseImage(&src);
		cvReleaseImage(&dst);
	}
}
