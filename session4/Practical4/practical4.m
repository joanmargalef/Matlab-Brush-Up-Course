
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  MATLAB Brush Up Course: Solution Practice Set 4  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   by JOAN MARGALEF   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DATA IMPORT, DATA EXPORT & PLOTTING


%% PROBLEM 1

% Complex Function Plot
x = linspace(0, 2*pi, 100);
f = exp(-x) .* sin(10*x);
figure;
plot(x, f, 'r--');
title('Complex Function Plot');
xlabel('x');
ylabel('f(x)');

% Multi-Distribution Histogram
normalData = normrnd(0, 1, [1000, 1]);
uniformData = unifrnd(-2, 2, [1000, 1]);
figure;
histogram(normalData, 'FaceColor', 'blue');
hold on;
histogram(uniformData, 'FaceColor', 'green');
hold off;
title('Histogram of Two Distributions');
legend('Normal Distribution', 'Uniform Distribution');
xlabel('Value');
ylabel('Frequency');

% Economic Growth Scatter Plot
gdpGrowthA = normrnd(2, 0.5, [100, 1]);
gdpGrowthB = unifrnd(1, 3, [100, 1]);
figure;
scatter(gdpGrowthA, gdpGrowthB);
title('GDP Growth Rates Comparison');
xlabel('Country A Growth Rate (%)');
ylabel('Country B Growth Rate (%)');

%% PROBLEM 2


% Comparative GDP Analysis

% Importing a CSV file (FOCUS ON THIS)
dataCSV = readtable('WBdata.csv'); % Reads data from a CSV file into a table

% Rename long column names to simpler ones
dataCSV.Properties.VariableNames{'GDP_constant2015US___NY_GDP_MKTP_KD_'} ...
    = 'GDP';
dataCSV.Properties.VariableNames{'InterestRateSpread_lendingRateMinusDepositRate____FR_INR_LNDP_'} ...
    = 'InterestRateSpread';
dataCSV.Properties.VariableNames{'Battle_relatedDeaths_numberOfPeople__VC_BTL_DETH_'} ...
    = 'BattleDeaths';


% Update the numericColumns array with the new simplified names
str2numColumns = {'InterestRateSpread', 'BattleDeaths'};

% Loop over each specified numeric column
for columnName = str2numColumns
    % Convert the entire column
    dataCSV.(columnName{1}) = cellfun(@(x) str2double(regexprep(x, '\.\.', 'NaN')), dataCSV.(columnName{1}), 'UniformOutput', true);
end


% If we want to go out from table, and have matrices, In MATLAB, a matrix 
% cannot contain both numeric and string values.
% One alternative is spliting the data
numeric = table2array(dataCSV(1 : end, [3 5 6 7]));
names = table2array(dataCSV(1 : end, [1 2 4]));

% Finding indices for United States and China
indexUS = find(strcmp(names(:, 1), 'United States'));
indexChina = find(strcmp(names(:, 1), 'China'));


% Calculate mean GDP growth rate
meanGdpUS = mean(numeric(indexUS, 2), 'omitnan');
meanGdpChina = mean(numeric(indexChina, 2), 'omitnan')


% Plotting GDP trends
figure;
plot(numeric(indexUS, 1), numeric(indexUS, 2), 'b');
hold on;
plot(numeric(indexChina, 1), numeric(indexChina, 2), 'r');
hold off;
legend('United States', 'China');
title('GDP Comparison: United States vs China');
xlabel('Year');
ylabel('GDP (constant 2015 US$)');



% Calculating correlation coefficient between year and interest rate spreads
correlationYearInterestRate = corrcoef(numeric(:, 1), numeric(:, 3), 'Rows', 'complete');

% Scatter plot showing interest rate spreads over the years
figure;
scatter(numeric(:, 1), numeric(:, 3));
title('Interest Rate Spread Over the Years');
xlabel('Year');
ylabel('Interest Rate Spread (%)');
ylim([-20 30]); 

