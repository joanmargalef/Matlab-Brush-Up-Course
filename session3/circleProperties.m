function [area, perimeter] = circleProperties(radius)
    % circleProperties: Calculate area and perimeter of a circle
    % Input: radius of the circle
    % Output: area and perimeter of the circle

    area = pi * radius^2;       % Area of the circle
    perimeter = 2 * pi * radius; % Perimeter (circumference) of the circle
end