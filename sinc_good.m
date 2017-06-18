function y = sinc_good(t, snc, interp_step)

x = abs(t)*interp_step;
if x >= length(snc)
    y = 0;
    return;
end

x1 = floor(x);
x2 = ceil(x);
ratio = x - x1;
if x2+1 > length(snc)
    f2 = 0;
else
    f2 = snc(x2+1);
end
f1 = snc(x1+1);
y = (f2 - f1)*ratio + f1;
return;

if abs(t) > 64
    y = 0;
    return;
end

if abs(t) < 1e-12
    y = 1;
else
    y = sin(pi * t)/pi/t;
end
end