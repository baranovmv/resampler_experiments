function [S, f] = Freqs(sig, Fs)

S = 20*log(fftshift(abs(fft(sig))));
S = S(1:floor(length(S)/2)) - max( S );
f = linspace(0,Fs/2, length(S));
