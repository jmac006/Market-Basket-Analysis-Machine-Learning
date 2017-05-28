% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907
function largeSubsets = apriori(I,D,minSupport)
%Apriori algorithm finds the large subsets with minimum support
    largeSubsets = {}; %candidate subsets
    individualSubsets = {}; %individual subsets that meet minimum support
    numTransactions = numexamples(D); %returns the number of transactions in D
    [m,numItems] = size(I)
    
    %find the support for individual itemsets, check if they match the
    %minimum support
    for i = 0:numItems-1
        support = getcount(i,D) / numTransactions;
        if support > minSupport
            individualSubsets = [individualSubsets i];
        end
    end
    
    largeSubsets = individualSubsets;
    %A = [1, 3, 5]
    %largeSubsets = [largeSubsets A];
    %largeSubsets{89}
    
    F = individualSubsets;
    while ~isempty(F)
        candidateSets = apriori_gen(F);
        F = {};
        for c = 1:size(candidateSets,2)
            support = getcount(c,D) / numTransactions;
            if support > minSupport
                F = [F candidateSets{c}] %add the candidate to F
            end
        end
        %L = union(L,F) or L = [L F]
        %largeSubsets = union(largeSubsets, F);
    end
    
end

