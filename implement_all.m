%this is the main function 
clear,clc
fprintf(' 从数据库中随机抽取一张验证码,请按Enter继续\n');
pause();
number = randi(9999 , 1 ,1 ) + 1;
im_raw = imread( ['e:\\matlabdig\RawDataBase\CheckImage_' , int2str(number) , '.png'] );
imshow(im_raw,[ ]);

fprintf(' 将该验证码进行二值化和滤波,请按Enter继续\n');
pause();
im_pre = rgb2gray(im_raw);
im_pre = im2bw(im_pre);
im_pre = uint8(im_pre);

im_pre( 1 , : ) = [ ];
im_pre(  end , :) = [ ];
im_pre(: , 1) = [ ];
im_pre(: , end - 1 : end) = [ ];

im_sp = medfilt2(im_pre,[1 3]);
im_sp = medfilt2(im_sp,[2 1]);
im_sp = im_sp * 255;
close all;
imshow(im_sp,[])

fprintf(' 将该验证码进行切割,请按Enter继续\n');
pause();
[s1,s2,s3,s4] = checkImage_spilt(im_sp);
x = [s1;s2;s3;s4]./255;

fprintf('导入BP神经网络训练模型,请按Enter继续\n');
pause();
load('e:\\matlabdig\PreProcessed DataBase\BP network\BP_1.mat');

fprintf('进行识别,请按Enter继续\n');
pause();
x = double(x);
y = net(x');
y = uint8(y);
fprintf('预测结果为 %d %d %d %d\n',y(1),y(2),y(3),y(4));

