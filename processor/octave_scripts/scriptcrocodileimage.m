im = imread('crocodileoriginal.jpg');
ig = rgb2gray(im);
igt = transpose(ig);

imWidth = 320;
imHeight = 240;

%for file_num = 1:10
%  filename = sprintf("in%.2d.txt", file_num);
%
%  file = fopen(filename,'w');
%
%  for i = ((file_num-1)*(imHeight/10) + 1):(file_num*imHeight/10)
%    for j = 1:imWidth
%      fprintf(file, "%s\n", dec2bin(ig(i,j), 8));
%    endfor
%  endfor
%
%  fclose(file);
%endfor

filebin = "in.bin";
bin = fopen(filebin, 'w');
fwrite(bin, igt);
fclose(bin);

