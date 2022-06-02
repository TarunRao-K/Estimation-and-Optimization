
iterations_limit = 100;
learning_rate = 0.01;
initial_vector = [5 7 6 10];

syms x10 x11 x20 x21;
objective_function = x10^2 + x11^2 + x20^2 + x21^2 + 10;


optimal_vector = gradient_descent(iterations_limit, learning_rate, ...
    initial_vector, objective_function, x10, x11, x20, x21);

disp('initial_vector');
disp(initial_vector);

disp('optimal_vector');
disp(optimal_vector);