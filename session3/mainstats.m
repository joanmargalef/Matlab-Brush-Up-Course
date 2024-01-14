% Local Functions are used to be saved 

function mainstats(dataVector)
  
    % Calculate statistics
    minValue = min(dataVector);
    maxValue = max(dataVector);
    averageValue = mean(dataVector);
    stdDevValue = std(dataVector);

    % Display the results
    disp('Statistics of the given data vector:');
    disp(['Minimum: ', num2str(minValue)]);
    disp(['Maximum: ', num2str(maxValue)]);
    disp(['Average: ', num2str(averageValue)]);
    disp(['Standard Deviation: ', num2str(stdDevValue)]);
end
