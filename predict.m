
clear,clc
load('e:\\matlabdig\PreProcessed DataBase\Split_Data\data_total_random.mat');

X = data_rand ( : , 1 : end - 1)';
T = data_rand ( : , end)';
X = double(X);

net = feedforwardnet(20);
net = train(net,X,T);

Y = net(X);
Y =uint8(Y);
pref = perform(net,T,Y)


