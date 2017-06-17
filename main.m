clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 1024*8 ;
Fs = 44100 ;
Fs_out = 44050 ;
F = 10000 ;
t = (0 : (N-1)) / Fs;
sig = sin( 2*pi* t * F );
[sig_out, sig_out_t] = resample( sig, Fs, Fs_out );

subplot(211);
plot( t, sig, '-x' );
hold on;
plot( sig_out_t, sig_out, '-o' );
axis tight ;
grid on;
xlim([0.042,0.0445]);

[F, f] = Freqs(sig, Fs);
[F_out, f2] = Freqs(sig_out, Fs_out);

subplot(212);
semilogx( f, F );
hold on;
semilogx( f2, F_out );
grid on;
axis tight;