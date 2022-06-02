function [x] = gradient_descent(limit, step, x, fn, x10, x11, x20, x21)

    for iterations = 1:limit
        slope = [subs(diff(fn, x10),{x10, x11, x20, x21}, {x}), ...
            subs(diff(fn, x11),{x10, x11, x20, x21}, {x}), ...
            subs(diff(fn, x20),{x10, x11, x20, x21}, {x}), ...
            subs(diff(fn, x21),{x10, x11, x20, x21}, {x})];
        x = x - (step * slope);
    end
    x = double(x);
end