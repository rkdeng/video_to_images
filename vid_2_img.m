% turn video into image files

% step 1, load video

% change the video file location
filename = 'C:\Users\ASUS\Desktop\motion tracking example data\4d_cell_ring\1.mp4';

vidObj = VideoReader(filename);
vidframes = read(vidObj);
clear vidObj

%%
% step 2, adjust window/level if the brightness/contrast is not optimal

% visualize the histogram
figure,histogram(vidframes(:))

% hand pick the min and max of the new window.
new_min = 30;
new_max = 70;

% transform 
b = double(vidframes);
a = (b-new_min)/(new_max-new_min)*255;
vidframes_new = uint8(a);

%%
% step 3, export each frame as images

% change it to your image folder
export_folder = 'C:\desktop-everything\dataAnalysis\rnd_script\img_export';

[m1 m2 m3 m4] = size(a);

for n = 1:m4
    
    % sprintf('%06i',n) is hard-coded in here, if your frame number is more
    % than 6 digits, increase the number in here
    
    % tif
    fname = ['f' sprintf('%06i',n) '.tiff'];
    imwrite(vidframes_new(:,:,:,n),fullfile(export_folder,fname))
    
    % jpeg
%     fname = ['f' sprintf('%06i',n) '.jpeg'];
%     imwrite(vidframes_new(:,:,:,n),fullfile(export_folder,fname),'BitDepth',8)    
    
    
end