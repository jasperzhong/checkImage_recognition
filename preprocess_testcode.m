clear, clc
%get image
for i = 1 : 10000
    
im = imread([ 'E:\\matlabdig\RawDataBase\CheckImage_' , int2str(i) , '.png'] );
im = rgb2gray(im);
im = im2bw(im);
im = uint8(im);

%get rid of bence
im( 1 , : ) = [ ];
im(  end , :) = [ ];
im(: , 1) = [ ];
im(: , end - 1 : end) = [ ];

%filter
im_sp = medfilt2(im,[1 3]);
im_sp = medfilt2(im_sp,[2 1]);

im_sp = im_sp * 255;
%write into png
imwrite(im_sp , [ 'E:\\matlabdig\PreProcessed DataBase\Pre_Image\Pre_CheckImage_',  int2str(i)  ,'.png'  ],'png' );

end
