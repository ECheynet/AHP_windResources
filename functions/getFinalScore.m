function [finalScore] = getFinalScore(data, Criteria)
% getFinalScore Calculates the final score for a wind energy project using AHP
%
% This function computes the final score for evaluating wind energy projects
% based on various criteria and subcriteria including wind resources,
% environmental considerations, and geographical constraints. It uses the
% Analytic Hierarchy Process (AHP) for aggregating weighted criteria into a
% comprehensive assessment score.
%
% Syntax:
%   finalScore = getFinalScore(data, Criteria)
%
% Parameters:
%   data - Structured array containing normalized data for each criterion
%          and subcriterion. It matches the AHP criteria hierarchy.
%   Criteria - Structured array representing the hierarchy of criteria and
%              subcriteria, including their weights for the AHP analysis.
%
% Output:
%   finalScore - Structured array with the final aggregated score for the
%                project, reflecting the comprehensive assessment based on
%                the weighted evaluations of all considered factors.
%
% Algorithm Overview:
%   1. Extract hierarchical criteria names from the Criteria structure.
%   2. Re-order criteria from deepest (subcriteria) to shallowest (main criteria).
%   3. For each criterion/subcriterion, normalize weights, retrieve corresponding
%      data, and calculate weighted scores.
%   4. Aggregate scores for all criteria/subcriteria to compute the final score.
%
% Example Usage:
%   finalScore = getFinalScore(data, Criteria);
% 
% Author: E Cheynet - UiB - last modified 09/02/2024 

% Extract hierarchical criteria names
fi = fieldnamesr(Criteria);

% Re-order fields from deeper to shallower
level = count(fi,'.');
[level_sorted,indsubf] = sort(level,'descend');
subf = fi(indsubf);

% Compute the weight and data for score for each subfield
for jj=1:numel(subf),
    % Get weight
    M = eval(['Criteria.',subf{jj}]);
    [newM,~] = normalizeWeight(M);
    % Get data
    f = ['data.',subf{jj}];
    f = strrep(f,'.weight','');
    D = eval(f);
    if isnumeric(D)
        score = multiprod(newM,D,1,3);
        eval([f ' = score;']);
    else
        % Compute new score based on upper level
        subscenario = fieldnames(D);
        M = eval(['Criteria.',subf{jj}]);
        [newM,~] = normalizeWeight(M);
        Np = numel(subscenario);
        dummy = zeros([size(D.(subscenario{1})) Np]);
        for kk=1:Np,
            dummy(:,:,kk)  = newM(kk).*D.(subscenario{kk});
        end
        score = sum(dummy,3,'omitnan');
        eval([f ' = score;']);
    end
end

% Modify the variable data inside the function
finalScore = data;

end
