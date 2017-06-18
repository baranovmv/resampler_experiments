function [out, out_idx] = resample(sig, Fs_from, Fs_to)

out_step = Fs_from / Fs_to ;
filt_step = min( Fs_to/Fs_from, 1.0 );
out_t_begin = 0 ; % Increments by out_step.
out_t = out_t_begin ; % Increments by out_step.

snc_interp = 64;
snc_steps = 512;
snc = min( 1, Fs_to/Fs_from )*sinc(0:1/snc_interp:snc_steps-1/snc_interp);
w = kaiser(length(snc)*2, 2.0);
snc = snc' .* w(length(w)/2+1:end) ;
fprintf( 'Gain: %f\n', sum( snc ) );
% snc = snc / sum( snc );


sig_index = 1;
out_sz = ceil(length(sig)/out_step);
out = zeros(out_sz, 1);
out_idx = zeros(out_sz, 1);
for out_i = 1:out_sz
    % Go through whole signal, sinc_* themself decide where the boundaries of 
    % the window are.
    acc = 0;

    % t_sinc = t_sample - ceil( t_sample - st_Nwindow + 1/st_Nwindow_interp )
    filt_t = (out_t_begin - out_t) * filt_step;
    for j = 1:length(sig)
        acc = acc + sinc_good( filt_t, snc, snc_interp ) * sig( j );
        filt_t = filt_t + filt_step ;
    end
    out( out_i ) = acc ;
    out_idx( out_i ) = out_t/Fs_from ;
    out_t = out_t + out_step;
end
end