clc;
clear all;

format long;
pkg load symbolic
v = sym('v'); 
b = sym('b')                    % symbolic package is loaded and symbolic variable declared.

tol = 1e-5;                       % tolerance
dv = tol + 1;                     % dx in first iter must be higher than the threshold value.
f = v+(3.592/v)-(0.15327/v.^2)-41.06967             
b = 30;
v = b;                           % initial guess of root
iter = 0;                      
p = zeros(1,1);
while (abs(dv) > tol)             % the iteration continue within the tolerance value
    dv = eval(f/(diff(f)));    
    v = v - dv                
    iter = iter + 1;         
    p(iter) = v;
    drawnow();
    plot(abs(p),'r','linewidth',3);
    xlabel ('Iteration Count')
    ylabel ( 'Solution')

    grid;
    if (iter > 300)
        fprintf('Fail! Solution does not converge! \n');
        break;
    end
end

if (iter < 300)
    fprintf('Initial guess = ');
    b
    fprintf('The root = ');  %printing the result
    v
    fprintf('\nIteration Count = %d\n',iter);
end