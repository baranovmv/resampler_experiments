function [out, out_idx] = resample(sig, Fs_from, Fs_to)

out_step = Fs_to / Fs_from ;
filt_step = min( out_step, 1.0 );
out_t_begin = 0 ; % Increments by out_step.
out_t = out_t_begin ; % Increments by out_step.

sig_index = 1;
out_sz = ceil(length(sig)/filt_step);
out = zeros(out_sz, 1);
out_idx = zeros(out_sz, 1);
for out_i = 1:out_sz
    % Go through whole signal, sinc_* themself decide where the boundaries of 
    % the window are.
    acc = 0;

    % t_sinc = t_sample - ceil( t_sample - st_Nwindow + 1/st_Nwindow_interp )
    filt_t = (out_t_begin - out_t) * filt_step;
    for j = 1:length(sig)
        acc = acc + sinc_good( filt_t ) * sig( j );
        filt_t = filt_t + filt_step ;
    end
    out( out_i ) = acc ;
    out_idx( out_i ) = out_t/Fs_from ;
    out_t = out_t + out_step;
end
end