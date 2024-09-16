% figure(1)
% imshow ('cameraman.tif');
% info=imfinfo('cameraman.tif');
% I=imread('cameraman.tif');
% size(I)
% figure(2)
% image(I);
% figure(3)
% imshow(I);
% figure(4);
% imshow(I,[100,250]);

% figure(5)
% imshow forest.tif;
% info=imfinfo('forest.tif');
% [X,map]=imread('forest.tif');
% size(X)
% size(map)
% figure(6)
% image(X)
% colormap(map)
% figure(7);imshow(X,map);

% imshow 'flower.jpg';
% info=imfinfo('flowers.tif');
% RGB=imread('flowers.tif');
% size(RGB);
% figure(8)
% image(RGB);
% figure(9);imshow(RGB);


% clear
% load clown;
% whos
% figure(10)
% imshow(X,map);
% I=ind2gray(X,map);
% figure(11);imshow(I);
% RGB=ind2rgb(X,map);
% figure(12);imshow(RGB);
% BW=im2bw(X,map,0.6);
% figure(13);imshow(BW)
clear

% figure(14)
% imshow forest.tif;
% [X,map]=imread('forest.tif');
% imwrite(X,map,'newforest1.jpeg');
% imwrite(X,'newforest2.bmp');
% imfinfo('newforest1.jpeg')
% imfinfo('newforest2.bmp')
% figure(15)
% imshow newforest1.jpeg;
% figure(16)
% imshow newforest2.bmp;

% figure(17)
% imshow saturn.tif;
% I=imread('saturn.tif');
% save newsaturn I;
% clear;
% load newsaturn;
% I
% figure(18)
% imshow(I)



I=imread('flowers.tif');
figure(19)
imshow(I);
info=imfinfo('flowers.tif')

RGB=imread('flowers.tif');
I=rgb2gray(RGB);
figure(20)
imshow(I)

[X,map]=rgb2ind(RGB,128);
figure(21)
imshow(X,map)

BW=im2bw(X,map,0.6);
figure(22)
imshow(BW);

imwrite(X,'flower.jpeg');
imfinfo('flower.jpeg')
figure(23)
imshow flower.jpeg;

RGB=imread('flowers.tif');
save flowerRGB


