function y = sinc_good(t)

if abs(t) < 1e-10
    y = 1;
else
    y = sin(pi * t)/pi/t;
end
end