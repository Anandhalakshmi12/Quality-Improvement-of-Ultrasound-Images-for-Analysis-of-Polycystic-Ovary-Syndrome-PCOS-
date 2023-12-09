A = imread("D:\SEM 2\IVA\testing\pco\pco_11.jpg");
B = imadjust(A,stretchlim(A));
%% method1
subplot(2,2,1),imshow(A);
subplot(2,2,2),imshow(B);

%% method2
C = imadjust(A,[0.1 0.7],[]);
subplot(2,2,3),imshow(C);

%% method3
D = imadjust(A,stretchlim(A,[0.05 0.95]),[]);
subplot(2,2,4),imshow(D);

[peaksnr, snr] = psnr(B, A); 
fprintf('\n The Peak-SNR value for METHOD 1 is %0.4f', peaksnr);

err = immse(B, A);
fprintf('\n The mean-squared error for METHOD 1 is %0.4f', err);

re = rmse(double(B(:)), double(A(:)));
fprintf('\n The root mean-squared error for M1 is %0.4f\n', re);

[peaksnr, snr] = psnr(C, A); 
fprintf('\n The Peak-SNR value for METHOD 2 is %0.4f', peaksnr);

err = immse(C, A);
fprintf('\n The mean-squared error for METHOD 2 is %0.4f', err);

re = rmse(double(C(:)), double(A(:)));
fprintf('\n The root mean-squared error for M2 is %0.4f\n', re);

[peaksnr, snr] = psnr(D, A); 
fprintf('\n The Peak-SNR value for METHOD 3 is %0.4f', peaksnr);

err = immse(D, A);
fprintf('\n The mean-squared error for METHOD 3 is %0.4f', err);

re = rmse(double(D(:)), double(A(:)));
fprintf('\n The root mean-squared error for M3 is %0.4f\n', re);



