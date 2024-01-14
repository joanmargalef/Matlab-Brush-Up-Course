
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  MATLAB Brush Up Course: Solution Practice Set 2  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   by JOAN MARGALEF   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LOGICAL/RELATIONAL OPERATORS, CONDITIONAL STATEMENTS, LOOPS & RAND. VARS




clc;clear

%% PROBLEM 1

% 1. 
M = [3, 7, 2; 8, 5, 6; 1, 4, 9];
M(M < 4) = 0;    
disp('Elements in M greater than or equal to 6:');
disp(M(M >= 6));


% 2.
A = [2, 4, 6, 8, 10];
B = [1, 3, 5, 7, 9];
greaterThanB = A(A > B);


% 3.
N = [-3, 5, -1; 2, -8, 7; -4, 6, -2];
sumPositiveElements = sum(N(N > 0));



%% PROBLEM 2

%  Number Categorization
number = 15;
lowThreshold = 10;
highThreshold = 20;

if number < lowThreshold
    disp('low');
elseif number >= lowThreshold && number <= highThreshold
    disp('medium');
else
    disp('high');
end



% BMI Categorization
weight = 70; % in kilograms
height = 1.75; % in meters
bmi = weight / height^2;

if bmi < 18.5
    disp('Underweight');
elseif bmi >= 18.5 && bmi < 25
    disp('Normal weight');
elseif bmi >= 25 && bmi < 30
    disp('Overweight');
else
    disp('Obese');
end



%% PROBLEM 3


% Hilbert Matrix
n = 4;
HilbertMatrix = zeros(n);

for i = 1:n
    for j = 1:n
        HilbertMatrix(i, j) = 1 / (i + j - 1);
    end
end
disp(HilbertMatrix);



% Dice Roll Simulation
count = 0;
diceRoll=0;
while diceRoll ~= 6
    diceRoll = randi(6);
    count = count + 1;
    
end
disp(['Number of rolls to get a six: ', num2str(count)]);



% Investment
investment = 1000;
years = 10;
numSimulations = 100;
capital=zeros(100,10);

for sim = 1:numSimulations
    capital(sim,1)=investment;
    for t = 2:years
        annualReturn = normrnd(0.05, 0.02);
        capital(sim, t) = capital(sim, t-1) * (1 + annualReturn);
    end
    
end

averageFinalInvestment = mean(capital(:,10));
disp('Average final investment values after 100 simulations:');
disp(averageFinalInvestment);



% Temperature

hours = 24;
initialTemperature = 50; % in degrees Celsius
temperature = initialTemperature;

for hour = 1:hours
    % Random temperature change
    change = randi([-30, 30]);
    temperature = temperature + change;

   
    % Determine the state of the substance
    if temperature < 0
        state = 'solid';
    elseif temperature <= 100
        state = 'liquid';
    else
        state = 'gas';
    end

    % Prepare the display string
    text = ['Hour ' int2str(hour) ': Temperature = ' num2str(temperature) '°C, State = ' state];

    % Display the information using disp
    disp(text);
end


%% PROBLEM 4

% Parameters for the AR(2) process
numSteps = 100;
alpha_1 = 0.5; % Coefficient alpha_1 for the AR(2) model
alpha_2 = -0.2; % Coefficient alpha_2 for the AR(2) model
sigma = 1; % Standard deviation of the random step

% Initialize the array to store the values at each step
arProcess = zeros(numSteps, 1);

% Start the process with the first two values set to 0
arProcess(1:2) = [0, 0];

% Generate the AR(2) process
for t = 3:numSteps
    arProcess(t) = alpha_1 * arProcess(t-1) + alpha_2 * arProcess(t-2) + normrnd(0, sigma);
end


mean(arProcess)
