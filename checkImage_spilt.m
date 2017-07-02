function [s1 , s2 , s3 , s4 ] = checkImage_spilt(bw)

s1 = bw(: ,   2 : 12);
s2 = bw(: , 12 : 22);
s3 = bw(: , 22 : 32);
s4 = bw(: , 32 : 42);

s1 = reshape(s1 , 1 , 11*16);
s2 = reshape(s2 , 1 , 11*16);
s3 = reshape(s3 , 1 , 11*16);
s4 = reshape(s4 , 1 , 11*16);

end