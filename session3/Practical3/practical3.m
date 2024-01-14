
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  MATLAB Brush Up Course: Solution Practice Set 3  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   by JOAN MARGALEF   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SIMBOLIC MATH, FUNCTION & OPTIMIZATION


%% PROBLEM 1

syms x
f = cos(x) - x^3;

% Differentiation and Evaluation
diffF = diff(f, x);
evaluatedDiffF = subs(diffF, x, pi/4);
disp('Differentiated f(x) evaluated at x = pi/4:');
disp(evaluatedDiffF);

% Integration
integratedF = int(f, x, 0, pi);
disp('Integrated f(x) from 0 to pi:');
disp(integratedF);

% Solving Symbolic Equations 

equationEx1 = x^3 - 3*x^2 + 2 == 0;
solutionEx1 = solve(equationEx1, x);
disp('Solution to the equation x^3 - 3x^2 + 2 = 0:');
disp(solutionEx1);

syms x y z
eq1Ex2 = 2*x + 3*y - z == 1;
eq2Ex2 = -x + y + z == 3;
eq3Ex2 = x - 2*y + 3*z == -1;
solutionsSystemEx2 = solve([eq1Ex2, eq2Ex2, eq3Ex2], [x, y, z]);
disp('Solutions to the system of equations:');
disp([solutionsSystemEx2.x, solutionsSystemEx2.y, solutionsSystemEx2.z]);



%% PROBLEM 2

% Utility Function Evaluation and Optimization
% Define the utility function
U = @(c) sqrt(c);

% Evaluate at c = 25
evaluatedValue = U(25);



% Unconstrained Utility Maximization 

% Define the utility function
U = @(xy) 2*sqrt(xy(1)) + 3*sqrt(xy(2));

% Optimize the utility function
initialGuess = [1, 1];
[optimalXY, optimalValue] = fminunc(@(xy) -U(xy), initialGuess) % Negating U for maximization
maxUtility = -optimalValue % Negating back to get maximum utility


% Is something weird happening?
display('YES, the maximization problem is not well definied. It would give infinity.')




% Constrained Minimization

% Cost function
costFunc = @(x) 2*x(1)^2 + 3*x(2)^2 + x(3)^2 + 4*x(4) + 5*x(5);

% Inequality constraints (A*x <= b)
A = [1, 2, 1, 0, 0; 0, 0, 0, 2, 3];
b = [50; 40];

% Equality constraint (Aeq*x = beq)
Aeq = [1, 1, 1, 1, 1];
beq = 60;

% Lower bounds and upper bounds
lb = zeros(1, 5);
ub = [20, 20, 20, 15, 10];

% Initial guess
x0 = [10, 10, 10, 5, 5];

% Minimize the cost function under constraints
[optimalX, minimalCost] = fmincon(costFunc, x0, A, b, Aeq, beq, lb, ub);

% Display results
disp('Optimal inputs:');
disp(optimalX);
disp(['Minimal cost: ', num2str(minimalCost)]);



%% PROBLEM 3

% Temperature Conversion Function
tempFtoC = convertTemperature(32, 'F', 'C');
disp(['32°F in Celsius is ', num2str(tempFtoC), '°C']);

tempCtoF = convertTemperature(100, 'C', 'F');
disp(['100°C in Fahrenheit is ', num2str(tempCtoF), '°F']);

% Test case for the calculatePresentValue function
cashFlows = [100, 200, 300]; % Future cash flows
interestRate = 0.05;         % Annual interest rate as a decimal
periods = 3;                 % Number of periods

presentValue = calculatePresentValue(cashFlows, interestRate, periods);
disp(['Present Value of cash flows: $', num2str(presentValue)]);




%% FUNCTIONS
% Local function definition
function convertedTemp = convertTemperature(temp, currentScale, targetScale)
    if currentScale == 'F' && targetScale == 'C'
        convertedTemp = (temp - 32) * 5/9;
    elseif currentScale == 'C' && targetScale == 'F'
        convertedTemp = temp * 9/5 + 32;
    else
        error('Invalid scale conversion.');
    end
end



function pv = calculatePresentValue(cashFlows, rate, n)
    pv = 0;
    for i = 1:n
        pv = pv + cashFlows(i) / (1 + rate)^i;
    end
end


