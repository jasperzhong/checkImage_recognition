%implement spilt 
clear , clc
for i = 1 : 250
    im = imread([ 'E:\\matlabdig\PreProcessed DataBase\Pre_Image\Pre_CheckImage_' , int2str(i) , '.png'] );
    for j = 1 : 4
        s = im(:  ,   2 + 10 * (j -1 ) : 12 + 10 * (j - 1 ) ); 
        imwrite(s , [ 'E:\\matlabdig\PreProcessed DataBase\Spilt_Image\Pre_CheckImage_',  int2str(i) , '_Spilt_' , int2str(j) , '.png'  ],'png' );
    end
    
end