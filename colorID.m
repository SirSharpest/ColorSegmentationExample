
function colorID(image)

image = imresize(image, [500, NaN]);

load regioncoordinates; 

nColors = 6; 

sample_regions = false([size(image,1) size(image,2) nColors]); 

for count = 1:nColors
    sample_regions(:,:,count) = roipoly(image, region_coordinates(:,1,count),...
        region_coordinates(:,2,count));
end

labimage = rgb2lab(image);

a = labimage(:,:,2);
b = labimage(:,:,3);
color_markers = zeros([nColors, 2]);

for count = 1:nColors
  color_markers(count,1) = mean2(a(sample_regions(:,:,count)));
  color_markers(count,2) = mean2(b(sample_regions(:,:,count)));
end

color_labels = 0:nColors-1;

a = double(a);
b = double(b);
distance = zeros([size(a), nColors]);

for count = 1:nColors
  distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
                      (b - color_markers(count,2)).^2 ).^0.5;
end

[~, label] = min(distance,[],3);
label = color_labels(label);
clear distance;

rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(image), nColors],'uint8');

for count = 1:nColors
  color = image;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end


imshow(segmented_images(:,:,:,3)), title('Red objects');

figure;

imshow(segmented_images(:,:,:,4)), title('Yellow');

figure; 

imshow(segmented_images(:,:,:,6)), title('Green');

figure;

imshow(image);


i = (segmented_images(:,:,:,6));
j = (segmented_images(:,:,:,3));
k = (segmented_images(:,:,:,4));

countCircles(i);
figure;
countCircles(j);
figure;
countCircles(k);

%countCircles(segmented_images(:,:,:,6), title('Green'));

end