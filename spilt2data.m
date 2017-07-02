%change image into matrix
%each image is a line of the matrix
clear,clc
File = dir('e:\\matlabdig\PreProcessed DataBase\Spilt_Image\9');
FileLength = length(File);
data = [ ];
for i = 3 : FileLength % except . and ..
    name = File(i).name;
    bw = imread ( ['e:\\matlabdig\PreProcessed DataBase\Spilt_Image\9\' , name ]);
    bw = reshape( bw,  1 , 11*16);  %change it to a line
    data = [ data ; bw ];
end
