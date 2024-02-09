function [newY] = normalizeVar(y)
% normalizeVar Normalizes a variable to a 0-1 scale
%
% This function normalizes the input variable 'y' to a scale of 0 to 1,
% transforming the data such that the minimum value becomes 0 and the
% maximum value becomes 1. This normalization is useful for preparing
% variables for analysis, ensuring that they are on a comparable scale.
%
% Syntax:
%   newY = normalizeVar(y)
%
% Parameters:
%   y - The input variable array that needs to be normalized. It can be a
%       vector, matrix, or multi-dimensional array.
%
% Output:
%   newY - The normalized version of the input variable 'y', scaled to
%          the range [0, 1].
%
% The function first replaces any infinite values in 'y' with 0 to avoid
% potential issues with data extremes. Then, it subtracts the minimum value
% of 'y' from all elements, ensuring that the transformed minimum value is
% 0. Finally, it divides each element by the maximum value of this
% transformed array, resulting in a normalized array where values range
% from 0 to 1.
%
% Example Usage:
%   normalizedData = normalizeVar(data);
% 
% Author: E Cheynet - UiB - last modified 09/02/2024 

% Replace infinite values with 0
y(isinf(y)) = 0;

% Subtract the minimum and divide by the range
newY = y - min(y(:));
newY = newY ./ max(newY(:));

end
