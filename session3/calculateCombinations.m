function combinations = calculateCombinations(n, k)
    % calculateCombinations: Calculate the number of combinations (n choose k)
    % Input: n - the set size, k - the number of elements to choose
    % Output: combinations - the number of combinations

   
    % Calculate combinations using the factorial function
    combinations = factorial(n) / (factorial(k) * factorial(n - k));
end