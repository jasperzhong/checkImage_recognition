%this is the main function 
clear,clc
fprintf(' �����ݿ��������ȡһ����֤��,�밴Enter����\n');
pause();
number = randi(9999 , 1 ,1 ) + 1;
im_raw = imread( ['e:\\matlabdig\RawDataBase\CheckImage_' , int2str(number) , '.png'] );
imshow(im_raw,[ ]);

fprintf(' ������֤����ж�ֵ�����˲�,�밴Enter����\n');
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

fprintf(' ������֤������и�,�밴Enter����\n');
pause();
[s1,s2,s3,s4] = checkImage_spilt(im_sp);
x = [s1;s2;s3;s4]./255;

fprintf('����BP������ѵ��ģ��,�밴Enter����\n');
pause();
load('e:\\matlabdig\PreProcessed DataBase\BP network\BP_1.mat');

fprintf('����ʶ��,�밴Enter����\n');
pause();
x = double(x);
y = net(x');
y = uint8(y);
fprintf('Ԥ����Ϊ %d %d %d %d\n',y(1),y(2),y(3),y(4));

