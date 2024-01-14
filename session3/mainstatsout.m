function [minValue, maxValue, averageValue, stdDevValue] = mainstatsout(dataVector)
        %OUTPUT                         = name(INPUT)
    % Calculate statistics
    minValue = min(dataVector);
    maxValue = max(dataVector);
    averageValue = mean(dataVector);
    stdDevValue = std(dataVector);
end