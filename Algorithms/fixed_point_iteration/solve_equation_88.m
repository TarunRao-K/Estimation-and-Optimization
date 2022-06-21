ERROR_TOLERANCE = 0.001;
MAX_ITERATIONS = 30;
p_0  = 0.5;
c = 1;
phi = 0.5;

p_i = p_0;
p_f = equation_88(p_i, c, phi);
error = p_f - p_i;
iterations = 0;

while or(error^2 > ERROR_TOLERANCE^2, iterations > MAX_ITERATIONS)
    p_i = p_f;
    p_f = equation_88(p_i, c, phi);
    error = p_f - p_i;
    iterations = iterations + 1;
end

disp('p initial');
disp(p_0);
disp('p final');
disp(p_f);
disp('p previous');
disp(p_i);
disp('error');
disp(error);
disp('iterations');
disp(iterations);