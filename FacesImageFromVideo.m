a1=imread('ip1.png');
a2=imread('ip2.png');
a3=im2bw(a1); 
a4=im2bw(a2);
a5=detectSURFFeatures(a3); 
a6=detectSURFFeatures(a4);
imshow (a3);
hold on
plot(a5.selectStrongest(10000))
figure;
imshow (a4);
hold on;
plot (a6.selectStrongest (10000))
[a7, a5]=extractFeatures(a3, a5); 
[a8, a6]=extractFeatures(a4, a6);
a9=matchFeatures (a7, a8);
imshow (a9);