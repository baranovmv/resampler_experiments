clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 1024*8 ;
Fs = 44100 ;
Fs_out = 96000 ;
F = 100 ;
t = (0 : (N-1)) / Fs;
sig = sin( 2*pi* t * F );
[sig_out, sig_out_t] = resample( sig, Fs, Fs_out );
sig_out = sig_out(512:end-512);
sig_out_t = sig_out_t(512:end-512);

figure;
subplot(211);
plot( t, sig, '-x' );
hold on;
plot( sig_out_t, sig_out, '-o' );
axis tight ;
grid on;
xlim([0.042,0.0445]);

subplot(212);
[F, f] = Freqs(sig, Fs);
semilogx( f, F );
hold on;
[F_out, f2] = Freqs(sig_out, Fs_out);
semilogx( f2, F_out );
grid on;
axis tight;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% snc_interp = 64;
% snc_steps = 64;
% % snc_t = (0:1/snc_interp:snc_steps-1/snc_interp);
% % snc = sin(pi * snc_t)/pi./snc_t;
% snc = sinc(0:1/snc_interp:snc_steps-1/snc_interp);
% w = kaiser(length(snc)*2, 2);
% % snc = snc' .* w(length(w)/2+1:end) ;
% % plot( snc )


% y = zeros(1024,1);
% x = linspace(-128,128,1024);
% for i = 1:1024
%     y(i) = sinc_good(x(i), snc, snc_interp );
% end
% figure
% plot(x,20*log(abs(fft(y))))
