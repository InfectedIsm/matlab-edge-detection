img=imread('legumesnb.png'); 
img=rgb2gray(img);
img=img(:,:,1);

%These matrix are only for test purpose

A = [   1 15 15 2 3 0 1 2 0 0 1 0;
        4 2 15 15 2 0 1 3 0 0 0 1;
        0 2 3 4 15 15 0 0 1 0 0 2;
        5 0 1 0 4 15 15 1 1 1 0 0;
        2 0 3 0 2 15 15 4 0 0 0 0;
        0 1 4 0 3 15 15 3 1 0 0 0;
        0 0 1 0 4 12 15 2 0 0 1 0; 
        3 0 5 0 3 13 15 1 1 0 0 0];

AA = [   15 15 15 15 15 15 15 15 15 15  15 15;
        4 15 15 15 14 15 15 15 15 15 15 15;
        0 2 3 3 15 15 15 14 15 15 15 15;
        5 0 1 0 4 15 15 15 15 15 15 15;
        2 0 3 0 2 15 15 15 15 15 15 15;
        0 1 4 0 3 15 15 15 15 15 15 15;
        0 0 1 0 4 14 15 15 15 15 15 15;
        3 0 5 0 3 13 15 15  15 15  15 15];
    
    
B =  [  195 195 195 195;
        195 195 195 195;
        104 104 104 104;
        195 195 195 195;]

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
 
 seuil = 150;
 
 result = zeros(size(G1))
result( G1 > seuil ) = 1;
G1 = result; 

colormap(gray)
 imagesc(Z)
 figure
 colormap(gray)
 subplot(1, 3, 1)
 imagesc(G2)
 subplot(1, 3, 2)
 imagesc(G)
 subplot(1, 3, 3)
 imagesc(G1)

  
 
    
 
 
 
 
        