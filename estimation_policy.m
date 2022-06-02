function [xhat] = estimation_policy(limit, step, iv)

    syms xhat10 xhat11 xhat20  xhat21
    xhat = iv;
    for iterations = 1:limit
        fn = compute_fn(xhat);
        slope = [subs(diff(fn, xhat10),{xhat10 xhat11 xhat20  xhat21}, {xhat}), ...
            subs(diff(fn, xhat11),{xhat10 xhat11 xhat20  xhat21}, {xhat}), ...
            subs(diff(fn, xhat20),{xhat10 xhat11 xhat20  xhat21}, {xhat}), ...
            subs(diff(fn, xhat21),{xhat10 xhat11 xhat20  xhat21}, {xhat})];
        xhat = xhat - (step * slope);
    end
    %xhat = double(xhat);
    xhat(1)
end