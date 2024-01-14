
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  MATLAB Brush Up Course: Solution Practice Set 1  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   by JOAN MARGALEF   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  INTRODUCTION TO MATLAB & MATRICES

clc;clear

%% PROBLEM 1

% Define two 3x3 matrices A and B
A = [1,2,3; 4,5,6; 7,8,9];
B = [9,8,7; 6,5,4; 3,2,1];

% Display a message
disp('Do some matrix exercise')

% Element-wise addition of A and B
S = A + B; 

% Matrix multiplication of A and B
P = A * B; 

% Element-wise multiplication of A and B
PA = A .* B; 

% Multiplying row 2 of A with column 3 of B
P15 = A(2,:) * B(:,3); 

% Multiplying row 1 of A with the transpose of row 1 of B
P16 = A(1,:) * B(1,:)'; 

% Change entries a11 and a13 in A to NaN
A(1,[1,3]) = NaN; 

% Replace lower right 2x2 block in B with a 2x2 identity matrix
B([2:end],[2:end]) = eye(2);
display(['Replaces the 2 × 2 matrix block in south-east of B by identity matrix of dimensions 2 × 2.'])

% Create a 6x7 matrix with first three columns as 1s and next four columns as 2s
C = [ones(6,3), 2*ones(6,4)];

% Is the command feasible?
display('No, because [1:0.1:2] is a 1 × 11 vector, but linspace(1,2,10) is a 10 × 1 column vector.')


%% PROBLEM 2

% Define a vector x
x = [0:0.1:1];

% Outer product of x with itself
y = x'*x; 

% Inner product of x with itself
y = x*x'; 

% Display results of multiplication types
display(['By multiplying a column by a row of same size we get a Matrix: Outer Product'])
display(['By multiplying a row by a column of same size we get a Scalar: Inner Product'])


%% PROBLEM 3 

% Define a vector x
x = [0:0.1:1];

% Extract the last 6 elements of x into a 2x3 matrix
x1 = reshape(x(6:11),2,3);

% Extract specific elements of x
x2 = x([1,3,4,11]);

% Construct a vector containing every second element of x
x3 = x(2:2:11);

%% PROBLEM 4

% Define a 3x3 matrix A
A = [100 90 80; 70 60 50; 40 30 20];

% Extract all row entries of column 2
a1 = A(:,2);

% Extract all column entries of row 3
a2 = A(3,:);

% Extract all columns of rows 2 and 3
a3 = A(2:3,:);

% Extract row 2 and 3 in columns 1 and 3
a4 = A(2:3, [1 3]);

%% PROBLEM 5

% Define a 3x3 Pascal matrix and vector b
A = pascal(3);
b = [2;5;4];

% Solve for x in Ax = b using inverse
x_solution = A^(-1) * b;

% Alternative way to solve using the inv() function
x_solution_alternative = inv(A) * b;


%% PROBLEM 6

% Define the vector b
b = [1, 4, 1];

% Sorting elements of b
sorted_b = sort(b);

% Define the matrix B
B = [1 2 3; 6 5 4; 8 7 9];

% Size of matrix B
size_B = size(B);
rows_B = size(B, 1);
cols_B = size(B, 2);

% Reshaping matrix B
reshaped_B = reshape(B, 1, 9);

% Summing elements
sum_B_col1 = sum(B(:,1));
sum_B_col2 = sum(B(:,2));
sum_B_col3 = sum(B(:,3));


% Minimum and maximum values
min_B = min(B);
max_B = max(B);

% Determinant and trace
det_B = det(B);
trace_B = trace(B);

% Eigenvalues
eig_B = eig(B);

% Rank
rank_B = rank(B);

% Lower and upper triangular parts
tril_B = tril(B);
triu_B = triu(B);