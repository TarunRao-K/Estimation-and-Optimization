error_tolerance = 1;
x_0  = 0;

x_i = x_0;
x_f = g(x_i);
error = x_f - x_i;
while error^2 > error_tolerance^2
    x_i = x_f;
    x_f = g(x_i);
    error = x_f - x_i;
end
