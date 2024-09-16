% clear;
% imfinfo('cameraman.tif');
% % imshow('cameraman.tif')
% I=imread('cameraman.tif');
% fftI=fft2(I);
% Re=real(fftI);
% Im=imag(fftI);
% A=sqrt(Re.^2+Im.^2);
% A=(A-min(min(A)))/(max(max(A))-min(min(A)))*255;
% figure(1);
% imshow(A);
% sfftA=fftshift(A);
% figure(2);
% imshow(sfftA);
% figure(3);
% imshow(log(1+sfftA),[]),colormap(jet(64));
% colorbar;


% flower=imread('flower.jpg');
% imshow(flower);
% dctF=dct2(flower);
% figure;
% imshow(log(abs(dctF)),[]);
% colormap(jet);colorbar;
% threshold=10;
% dctF(abs(dctF)<threshold)=0;
% flower1=idct2(dctF);
% figure;
% imshow(flower1,[0,255]);


% f0=imread('tire.tif');
% figure(1);
% imshow(f0);
% f1=imnoise(f0,'speckle',0.01);
% f1=im2double(f1);
% figure(2);
% imshow(f1);
% h1=[-1 -1 -1;-1 9 -1;-1 -1 -1];
% h2=1/10.*[1 1 1;1 2 1;1 1 1];
% h3=1/9.*[1 1 1;1 1 1;1 1 1];
% h4=[-1 -1 -1 ;-1 8 -1;-1 -1 -1];
% f2=conv2(f1,h1,'same');
% figure(3);
% imshow(f2);
% f3=conv2(f1,h2,'same');
% figure(4);
% imshow(f3);
% f4=conv2(f1,h3,'same');
% figure(5);
% imshow(f4);
% f5=conv2(f1,h4,'same');
% figure(6);
% imshow(f5);


% rat=1/4;
% I=imread('LENA.bmp');
% I=double(I)/255;
% figure(1);
% imshow(I);
% FCoe=blkproc(I,[16 16],'fft2(x)');
% CoeVar=im2col(FCoe,[16 16],'distinct');
% Coe=CoeVar;
% [Y,Ind]=sort(CoeVar);
% [m,n]=size(CoeVar);
% snum=256-256*rat;
% for i=1:n
%     Coe(Ind(1:snum),i)=0;   
% end
% B2=col2im(Coe,[16 16],[256 256],'distinct');
% I2=blkproc(B2,[16 16],'ifft2(x)');
% figure(2);
% imshow(I2);



% rat=1/4;
% I=imread('lena.bmp');
% I=double(I)/255;
% figure(1);
% imshow(I);
% T=hadamard(8);
% HCoe=blkproc(I,[8 8],'P1*x*P2/8',T,T);
% CoeVar=im2col(HCoe,[8 8],'distinct');
% Coe=CoeVar;
% [Y,Ind]=sort(Coe);
% [m,n]=size(Coe);
% snum=64-64*rat;
% for i=1:n
%     Coe(Ind(1:snum),i)=0;
% end
% B2=col2im(Coe,[8 8],[256 256],'distinct');
% I2=blkproc(B2,[8 8],'P1*x*P2/8',T,T);
% figure(2);
% imshow(I2);
% title('HT4:1');


rat=1/8;
%说明：设置压缩比
I=imread('lena.bmp');
I=double(I)/255;
%说明：读取图像数据并转换成双精度
figure(1);
imshow(I);
%说明：显示原图像
HCoe= blkproc(I,[8 8],'dct2(x)');
%说明：对图像I的每个不同的8×8大小的块进行二维余弦变换变换
CoeVar=im2col(HCoe,[8 8],'distinct');
%说明：重排图像HCoe中的不同8×8块为CoeVar的列
Coe=CoeVar;
[Y,Ind]=sort(Coe);
%说明：系数矩阵以方差上升的顺序排序
[m,n]=size(Coe);
%说明：确定矩阵Coe的维数
snum=64-64*rat;
%说明：按压缩比确定欲舍去的系数数
for i=1:n
    Coe(Ind(1:snum),i)=0;
end
%说明：舍去低位次数
B2=col2im(Coe,[8 8],[256 256],'distinct');
%说明：重排矩阵列为图像块
I2=blkproc(B2,[8 8],'idct2(x)');
%说明：对图像块实行反离散余弦变换
figure(2);
imshow(I2);
title('DCT8:1');
%说明：显示压缩后的图像及图像标题

