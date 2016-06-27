
function countCircles(img)

img = imresize(img,[200,NaN]);

imgNoRedBW = img;
imgNoRedBW(:,:,1) = 0; 
imgNoRedBW = im2bw(imgNoRedBW);


imgNoGreenBW = img; 
imgNoGreenBW(:,:,2) = 0; 
imgNoGreenBW = im2bw(imgNoGreenBW,0.3);


imgFuse = imfuse(imgNoRedBW, imgNoGreenBW, 'blend', 'Scaling', 'joint');

imgFuse = (im2bw(imgFuse));

[c, r, ~] = imfindcircles(imgFuse, [6 50]); 


imshow(img);
viscircles(c, r, 'EdgeColor','b');


size(c,1)

end 