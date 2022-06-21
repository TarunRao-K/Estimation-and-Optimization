function p = equation_88(p_i, c, phi)
    limit_a = sqrt(c/((1-phi)*(1-p_i)));
    limit_b = inf;

    p = 2 * integral(@(x) normpdf(x, 0, 1), limit_a, limit_b);
end
