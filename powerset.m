% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907

function subsets = powerset(P)
    %Returns the subsets of P based on the power set
    L = length(P)
    subsets = cell(1,2^L -2); 
    index = 1;

    for i = 1:length(P)
        permutation = nchoosek(P,i);
        for j = 1:size(permutation,1)
            subsets{index} = permutation(j,:);
            index = index + 1;
        end
    end
    subsets = subsets(:,1:end-1) %get rid of the set = subset
end

