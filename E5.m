% P=imread('cameraman.tif');
% angle=linspace(0,179,360);
% R=radon(P,angle);
% I1=iradon(R,angle, 'linear');
% I2=iradon(R,angle,'linear','none');
% subplot(2,2,1),imshow(P),title('Original');
% subplot(2,2,2),imshow(R,[]),title('Projection Result');
% subplot(2,2,3),imshow(I1,[]),title('Filtered Backprojection');
% subplot(2,2,4),imshow(I2,[]),title('Unfiltered Backprojection');
% 
% 
% 
% filename = '心脏-投影重建图像.jpg'; %输入正确的文件路径及文件名
% imag = imread(filename);
% P = rgb2gray(imag);
% angle = linspace(0,179,720); 
% R = radon(P, angle);
% I1 = iradon(R, angle,'linear',570);
% I2 = iradon(R, angle,'linear','none');
% subplot(2,2,1), imshow(P), title('Original');
% subplot(2,2,2), imshow(R,[]), title('Projection Result');	
% subplot(2,2,3), imshow(I1,[]), title('Filtered Backprojection');
% subplot(2,2,4), imshow(I2,[]), title('Unfiltered Backprojection');


% P=phantom('Modified Shepp-Logan',128);
% angle1=linspace(0,170,18);
% angle2=linspace(0,175,36);
% angle3=linspace(0,178,90);
% R1=radon(P,angle1);
% R2=radon(P,angle2);
% R3=radon(P,angle3);
% I11=iradon(R1,angle1,'linear');
% I12=iradon(R1,angle1,'linear','none');
% I21=iradon(R2,angle2,'linear');
% I22=iradon(R2,angle2,'linear','none');
% I31=iradon(R3,angle3,'linear');
% I32=iradon(R3,angle3,'linear','none');
% figure(1);
% subplot(1,3,1),imshow(P),title('Original');
% subplot(1,3,2),imshow(I11,[]),title('Filtered Backprojection-18');
% subplot(1,3,3),imshow(I12,[]),title('Unfiltered Backprojection-18');
% figure(2);
% subplot(1,3,1),imshow(P),title('Original');
% subplot(1,3,2),imshow(I21,[]),title('Filtered Backprojection-36');
% subplot(1,3,3),imshow(I22,[]),title('Unfiltered Backprojection-36');
% figure(3);
% subplot(1,3,1),imshow(P),title('Original');
% subplot(1,3,2),imshow(I31,[]),title('Filtered Backprojection-90');
% subplot(1,3,3),imshow(I32,[]),title('Unfiltered Backprojection-90');

clear;
imag = imread('sherlock.jpg'); %导入图片
P = rgb2gray(imag); % 转为灰度图像
angle = linspace(0,179,180); %Sampling angles
R = radon(P, angle); %Generate the Radon transform over 180??
I1 = iradon(R, angle,'linear',570); %Inverse Radon transform, i.e., FBP reconstruction,通过插值函数滤波
I2 = iradon(R, angle,'linear','none'); %backprojection without ramp-filtering
subplot(2,2,1), imshow(imag), title('Original')
subplot(2,2,2), imshow(R,[]), title('Projection Result')
subplot(2,2,3), imshow(I1,[]), title('Filtered Backprojection')
subplot(2,2,4), imshow(I2,[]), title('Unfiltered Backprojection')

