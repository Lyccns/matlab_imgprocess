% clear;
% 
% iname={
%     '01.bmp';'02.bmp';'03.bmp';'04.bmp';'05.bmp';'06.bmp';'07.bmp';'08.bmp';
%     '09.bmp';'10.bmp';'11.bmp';'12.bmp';'13.bmp';'14.bmp';'15.bmp';'16.bmp';
%     '17.bmp';'18.bmp';'19.bmp';'20.bmp';'21.bmp';'22.bmp';'23.bmp';'24.bmp';
%     '25.bmp';'26.bmp';'27.bmp';'28.bmp';'29.bmp';'30.bmp';'31.bmp';'32.bmp';
%     '33.bmp';'34.bmp';'35.bmp';'36.bmp';'37.bmp';'38.bmp';'39.bmp';'40.bmp';
%     '41.bmp';'42.bmp';'43.bmp';'44.bmp';'45.bmp';'46.bmp';'47.bmp'};%47*6 char
% img = zeros(788,1033,47);
% imagename = string(iname);
% 
% for i=1:47
%     img(:,:,i) = imread(imagename(i));
%     img(:,:,i) = imbinarize(double(img(:,:,i))./255);
% end
% 
% [x,y,z,img]=reducevolume(img,[10,10,10]);%减少数据量，xyz轴十倍缩放1033=》104，788=》79
% img = smooth3(img);
% equal=isosurface(x,y,z,img,0.5);%三维矩阵等势面
% patch=patch(equal,'Facecolor','green','Edgecolor','blue');%画笔
% colormap(gray);
% view(3);%三维视图
% % axis tight;%贴近图形边缘的轴
% % daspect([1,1,0.25]);%视角方向[dx dy dz]
% % colormap(gray(100));
% % camlight;
% % lighting gouraud;%flat gouraud none
% % isonormals(x,y,z,img,patch);

clear;
img = zeros(2016,3024,44);
fd = 'xxxxx';
for i=1:44
    fn = num2str(i);
    f = strcat(fd,fn,'.bmp');
    img(:,:,i) = imread(f);
    img(:,:,i) = imbinarize(double(img(:,:,i))./255);
end
[x,y,z,img]=reducevolume(img,[10,10,10]);%减少数据量，xyz轴十倍缩放1033=》104，788=》79
img = smooth3(img);
equal=isosurface(x,y,z,img,0.5);%三维矩阵等势面
patch=patch(equal,'Facecolor','green','Edgecolor','blue');%画笔
colormap(gray);
view(3);%三维视图