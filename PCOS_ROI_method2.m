X = imread("D:\SEM 2\IVA\testing\pco\pco_11.jpg");
X = rgb2gray(X);
im0=X;
X1=double(X);
h_im = imshow(im0);title('Choose ROI from the figure');
%helpdlg('Choose ROI from the figure','Point Selection');
h = imfreehand;
position = wait(h);
e = impoly(gca,position);
BW = createMask(e,h_im);
ROI=X1.*BW;
figure,imshow(ROI,[]);
im_DIF=X1-ROI;
X1=X1-ROI;
figure,imshow(im_DIF,[]);
ROI=uint8(ROI);im_DIF=uint8(im_DIF);
imwrite(ROI,'Region of interest.bmp','bmp');
imwrite(im_DIF,'Image difference.bmp','bmp');

%subplot(1,2,1);imshow(X);title('original');
subplot(1,2,1);imshow(ROI); title('roi');

C = imadjust(ROI,[0.1 0.7],[]);
%H = histeq(ROI);
%B = imadjust(ROI,stretchlim(ROI));
subplot(1,2,2);imshow(C); title('C');

% roi = im2double(ROI);

[peaksnr, snr] = psnr(C, ROI); 
fprintf('\n The Peak-SNR value for METHOD 4 is %0.4f', peaksnr);

err = immse(C, ROI);
fprintf('\n The mean-squared error for METHOD 4 is %0.4f', err);

re = rmse(double(C(:)), double(ROI(:)));
fprintf('\n The root mean-squared error for M4 is %0.4f\n', re);

