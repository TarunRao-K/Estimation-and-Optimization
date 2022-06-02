function [fn] = compute_fn(xhat)

    mu1 = 0;
    mu2 = 0;
    sigma1 = 1;
    sigma2 = 1;

    syms x c d phi beta1 beta2 xhat10 xhat11 xhat20  xhat21

    expr_trans1 = (1-phi)*(x-xhat10)^2 == (1-phi)*beta2*(x-xhat11)^2 + c;
    expr_trans2 = (1-phi)*(x-xhat20)^2 == (1-phi)*beta1*(x-xhat21)^2 + c;

    expr_trans1_eval = subs(expr_trans1, {c phi beta1 beta2 xhat10 xhat11 xhat20  xhat21
}, {1 0.5 0.5 0.5 xhat(1) xhat(2) xhat(3) xhat(4)});

    expr_trans2_eval = subs(expr_trans2, {c phi beta1 beta2 xhat10 xhat11 xhat20  xhat21
}, {1 0.5 0.5 0.5 xhat(1) xhat(2) xhat(3) xhat(4)});

    thresholds_trans1 = solve(expr_trans1_eval);
    thresholds_trans2 = solve(expr_trans2_eval);

    fn = int(phi*(x - xhat11)^2*normpdf(x, mu1, sigma1), x, -inf, inf) ...
        + int(phi*(x - xhat21)^2*normpdf(x, mu2, sigma2), x, -inf, inf)...
        - d*phi ...
        + int((c + (1-phi)*beta2*(x-xhat11)^2)*normpdf(x, mu1, sigma1), x, -inf, thresholds_trans1(1))...
        + int((1-phi)*(x-xhat10)^2*normpdf(x, mu1, sigma1), x, thresholds_trans1(1), thresholds_trans1(2))...
        + int((c + (1-phi)*beta2*(x-xhat11)^2)*normpdf(x, mu1, sigma1), x, thresholds_trans1(2), inf)...
        + int((c + (1-phi)*beta1*(x-xhat21)^2)*normpdf(x, mu2, sigma2), x, -inf, thresholds_trans2(1))...
        + int((1-phi)*(x-xhat20)^2*normpdf(x, mu2, sigma2), x, thresholds_trans2(1), thresholds_trans2(2))...
        + int((c + (1-phi)*beta1*(x-xhat21)^2)*normpdf(x, mu2, sigma2), x, thresholds_trans2(2), inf);

    fn = subs(fn, {c phi beta1 beta2}, {1 0.5 0.5 0.5});
end