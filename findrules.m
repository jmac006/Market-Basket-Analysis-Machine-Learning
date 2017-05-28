% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907
function findrules(D, smin, amin)
	%Input: Dataset, minimum support, minimum confidence (alpha min)
	I = items(D); %returns vector of all items in D in sorted order
    
    %find the association rules based on minimum confidence
    Rules = table;
    L = apriori(I,D,smin); %contains all the large subsets to generate candidate rules
    
    for i = 1:size(L,2)
        subset = powerset(L{i}); %finds the subsets for that vector in L
        for x = 1:size(subset,2) %for all x in the power set
            confidence = getcount(L{i},D) / getcount(subset{x},D);
            if confidence >= amin
                support = getcount(L{i},D) / numexamples(D);
                str = rule2str(subset{x},setdiff(L{i},subset{x}),D);
                row = {confidence, support, str};
                Rules = [Rules; row];
            end
        end
    end
    
    Rules.Properties.VariableNames = {'Confidence','Support','Rules'};
    Rules = sortrows(Rules,[1],{'ascend'})
    
end