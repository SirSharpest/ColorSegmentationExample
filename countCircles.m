
function countCircles(img)

img = imresize(img,[200,NaN]);

imgNoRedBW = img;
imgNoRedBW(:,:,2) = 0; 
imgNoRedBW = im2bw(imgNoRedBW);

imshow(img);


imgNoGreenBW = img; 
imgNoGreenBW(:,:,2) = 0; 
imgNoGreenBW = im2bw(imgNoGreenBW,0.02);

imgFuse = imfuse(imgNoRedBW, imgNoGreenBW, 'blend', 'Scaling', 'joint');

imgFuse = (im2bw(imgFuse));

[c, r, ~] = imfindcircles(imgFuse, [15 30]); 

hold on;
imshow(imgFuse);
viscircles(c, r, 'EdgeColor','b');

hold off;
size(c,1)

end 