directory = './data/topToFront/';
files = dir(directory);

% fig = figure();


F = [];
for imgNum = 1:size(files,1)-2
    data =csvread(['./data/topToFront/', files(imgNum+2).name]);
    x = data(:,1);
    y = data(:,2);
    z = data(:,3);
    
    x = x(1:numel(unique(x)));
    y = y(1:numel(unique(y)));
    
    % imagesc(x,y,z)
    img = reshape(z, size(y,1), size(x,1))';
    img = flipud(img);
    img = fliplr(img);
    F(:,:,imgNum) = img;
%     iHd = imshow(img,'InitialMagnification','fit')
    
%     truesize(fig, [size(x,1) size(y,1)]*2);
%     colormap('hot');
%     colorbar
%     set(gca,'dataAspectRatio',[1 1 1])
%     drawnow
end


F = F/max(max(max(F)));
implay(F)
% immovie(F)


% size(data)
% 
% minx = min(x);
% maxx = max(x);
% miny = min(y);
% maxy = max(y);
% meanValue = mean(z);
% imgSize = 160;
% heatMapImage = meanValue  * ones(imgSize, imgSize);
% for k = 1 : length(x)
%   column = round( (x(k) - minx) * imgSize / (maxx-minx) ) + 1; 
%   row = round( (y(k) - miny) * imgSize / (maxy-miny) ) + 1;
%   heatMapImage(row, column) = z(k);
% end
% heatMapImage = flipud(heatMapImage);
% imshow(heatMapImage, []);
% colormap('hot');
% colorbar;