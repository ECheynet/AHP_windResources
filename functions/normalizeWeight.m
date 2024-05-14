function [newM,M] = normalizeWeight(M)


if numel(find(M(:)==0)) == size(M,1)
    N = size(M,2);

    M_lower=M';M_lower(M_lower~=0) = 1./M_lower(M_lower~=0);

    M = M_lower + M - eye(N);

end

    newM = geomean(M,2);
    newM = newM./sum(newM);
end