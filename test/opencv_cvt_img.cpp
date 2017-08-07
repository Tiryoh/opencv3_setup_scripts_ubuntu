#include <opencv2/opencv.hpp>

int main(int argc, const char* argv[])
{
    cv::Mat src_img;
    src_img = cv::imread("lena.jpg", cv::IMREAD_COLOR);

    if(!src_img.data) {
        std::cerr << "NO IMAGE DATA" << std::endl;
        return -1;
    }

    cv::Mat gray_img;
    cv::cvtColor(src_img, gray_img, CV_BGR2GRAY);
    cv::imwrite("gray_image.jpg", gray_img);

    return 0;
}
