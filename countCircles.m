
function countCircles(img)

%img = imresize(img,[200,NaN]);

imgNoRedBW = img;
imgNoRedBW(:,:,2) = 0; 
imgNoRedBW = im2bw(imgNoRedBW);

%imshow(img);


imgNoGreenBW = img; 
imgNoGreenBW(:,:,3) = 0; 
imgNoGreenBW = im2bw(imgNoGreenBW,0.25);

%imshow(imgNoGreenBW);

imgFuse = imfuse(imgNoRedBW, imgNoGreenBW, 'blend', 'Scaling', 'joint');

imgFuse = (im2bw(imgFuse));


[c, r, ~] = imfindcircles(imgFuse, [10 20]); 

hold on;
%imshow(img);
viscircles(c, r, 'EdgeColor','b');



hold off;
size(c,1)

end 