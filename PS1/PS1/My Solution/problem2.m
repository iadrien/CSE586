% read image
I = imread('lenaNoise.png');

%% (a)
% fourier transformation 
ft = fft2(I);

% shift low frequency
shft = fftshift(ft);

%% (b)
% 10, 20, 40, 512 
ten = filterfreq(shft,10);
twenty = filterfreq(shft,20);
fourty = filterfreq(shft,40);
all = filterfreq(shft,512);

%% (c)
% convert to the unit8 image matrix
imten = uint8(255 * mat2gray(abs(ifft2(ten))));
imtwenty = uint8(255 * mat2gray(abs(ifft2(twenty))));
imfourty = uint8(255 * mat2gray(abs(ifft2(fourty))));
imall = uint8(255 * mat2gray(abs(ifft2(all))));

imwrite(imten,'tenbyten.png');
imwrite(imtwenty,'twentybytwenty.png');
imwrite(imfourty,'fourtybyfourty.png');
imwrite(imall,'fullimage.png');

%% ultility for part (b)
function filtered = filterfreq(transformed,number)
    filtered = zeros(512,512);
    
    for i = (512-number)/2+1:(512+number)/2
        for j = (512-number)/2+1:(512+number)/2
            filtered(i,j)=transformed(i,j);
        end
    end
end


