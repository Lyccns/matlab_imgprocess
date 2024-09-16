% figure(1)
% imshow pout.tif;
% info=imfinfo('pout.tif')
% I=imread('pout.tif');
% figure(2)
% imhist(I);
% J=imadjust(I,[0.3,0.7],[]);
% figure(3);
% imhist(J);
% figure(4);
% imshow(J);

% figure(5);
% imshow tire.tif;
% info=imfinfo('tire.tif')
% I=imread('tire.tif');
% figure(6);
% imhist(I);
% J=histeq(I);
% figure(7);
% imhist(J);
% figure(8);
% imshow(J);

% figure(9)
% imshow alumgrns.tif;
% I=imread('alumgrns.tif');
% BW1=edge(I,'roberts');
% figure(10);
% imshow(BW1);



% I=imread('eight.tif');
% figure(11)
% imshow(I);
% J=imnoise(I,'salt & pepper',0.02);
% figure(12);
% imshow(J);
% 
% K=medfilt2(J);
% figure(13);
% imshow(K);




G=imread('saturn.tif');
H=imnoise(G,"salt & pepper",0.02);
figure(14);
imshow(G);
figure(15);
imshow(H);
G=im2double(G);
figure(16);
imshow(G);
H1=fspecial("average",5);
G1=filter2(H1,G,"same");
figure(17);
imshow(G1);