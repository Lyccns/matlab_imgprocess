clear;
close all;
%清除变量；
[name,path] = uigetfile('*.bmp','选择图像');
%弹出选择文件窗口；
file = sprintf('%s%s',path,name);
%将被选择图像的路径和文件名拼接成字符串
X = imread(file);
%读入图像
if size(X,3) == 3
    X = rgb2gray(X);
end
%将rgb图像转换成灰度图像；
figure(1);
imshow(X);
title('原始图像');
%显示灰度图像；
f_high = 1.0;
f_low = 0.6; 
%构造一个高斯滤波器
gauss_low_filter = fspecial('gaussian',[7 7],0.114);
matsize = size(gauss_low_filter); 
%得到一个高斯低通滤波器
gauss_high_filter = zeros(matsize);
gauss_high_filter(ceil(matsize(1,1)/2),ceil(matsize(1,2)/2)) = 1.0;
gauss_high_filter = f_high*gauss_high_filter-(f_high-f_low)*gauss_low_filter;
%由于同态滤波是要滤除高频部分，所以得把这个低通滤波器转换成一个高通滤波器
%f_high和f_low是控制这个高通滤波器形态的参数
log_img = log(double(X)+eps);
%利用对数转换将入射光和反射光部分分开
high_log_part = imfilter(log_img, gauss_high_filter, 'replicate','conv');
%将高斯高通滤波器与对数转换后的图像卷积
high_part = exp(high_log_part);
minv = min(min(high_part));
maxv = max(max(high_part));
%再用幂变换将图像恢复过来
temp = (high_part-minv)/(maxv-minv);
%得到结果图像
figure(2);
imshow(temp);
title('同态滤波图像');
%显示滤波后图像；
