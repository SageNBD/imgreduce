f = fopen("image_out.bin", 'r')
it = fread(f);
fclose(f);

for i = 1:120
  for j = 1:160
    if(!(i == 120 && j == 160))
      ik(i,j) = it(160*(i-1) + j);
    endif
  endfor
endfor

##for i = 1:240
##  for j = 1:320
##    if(!(i == 240 && j == 320))
##      ik(i,j) = it(320*(i-1) + j);
##    endif
##  endfor
##endfor

imshow(uint8(ik));
imwrite(uint8(ik), "crocodilefinal.jpg");