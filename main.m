
iterations_limit = 2;
learning_rate = 0.01;
initial_vector = [5 7 6 10];

optimal_vector = estimation_policy(iterations_limit, learning_rate, initial_vector);

disp('initial_vector');
disp(initial_vector);

disp('optimal_vector');
disp(optimal_vector);