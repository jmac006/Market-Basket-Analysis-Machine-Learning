% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907
function candidateSets = apriori_gen(L)
%Subroutine for Apriori function, generates candidate sets for each level
    candidateSets = {};
    for j = 1:size(L,2)
        for k = j+1:size(L,2)
            %generate subsets of 2 if there are only subsets of size 1 in L
            if size(L{j},2) == 1
                s = union(L{j}, L{k});
                candidateSets = [candidateSets s];
            %if L[j] and L[k] agree on all but their last elements
            elseif isequal(L{j}(:,1:end-1),L{k}(:,1:end-1))
                s = union(L{j}, L{k});
                candidateSets = [candidateSets s];
            else
                break
            end
        end
    end
    
end

