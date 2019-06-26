%Implementation of Sobel filter in order to detect edges on image
%Sobel filter are kind of 2D derivative function that highlight sharp 
%variation on pixels values on the 2 axis.
%Based on Wikipedia article "Sobel Operator"

img=imread('test images\imagenb.png'); 
img=rgb2gray(img);
img=img(:,:,1);

threshold = 255;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Z = img;   
    
Gcx = [ -1 0 1];

Gcy = [ 1; 0; -1];

Gpx = [ -1 0 1;
        -1 0 1;
        -1 0 1;];
    
Gpy = [ 1 1 1;
        0 0 0;
        -1 -1 -1;];
    
Gsx = [ -1 0 1;
        -2 0 2;
        -1 0 1;];
    
Gsy = [ 1 2 1;
        0 0 0;
        -1 -2 -1;];    

Gx = conv2(Z,Gsx,'same');    
Gx1= conv2(Z,Gpx,'same');
Gx2= conv2(Gcx,Gcy,Z);

Gy = conv2(Z,Gsy, 'same');    
Gy1 = conv2(Z,Gpy, 'same');
Gy2 = conv2(Gcy,Gcx,Z);

G = sqrt(Gx.^2 + Gy.^2);
G1 = sqrt(Gx1.^2 + Gy1.^2);
G2 = sqrt(Gx2.^2 + Gy2.^2);

result = zeros(size(G1))

%G1 is a combination of the result of the convolution between the x-axis 
%and y-axis sobel filter and the image
result( G1 > threshold ) = 1;
G1 = result; 

%colormap(gray)
%imagesc(Z)
figure
colormap(gray)
subplot(1, 2, 1)
imagesc(Z)
subplot(1, 2, 2)
imagesc(G1)


  
 
    
 
 
 
 
        