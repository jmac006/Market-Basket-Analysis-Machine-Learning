% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907

function findrules(D, smin, amin)
	%Input: Dataset, minimum support, minimum confidence
	I = items(D); %returns vector of all items in D in sorted order
	%str = rule2str(0,[1 2],D)
	%num = getcount(set, D); %returns the number of transactions in set are present in D
    
	%str = rule2str(X,Y,D) %returns rule represented as string
    
    L = apriori(I,D,smin) %contains a11ll the large subsets to generate candidate rules
    for i = 1:size(L,2)
        L{i}
    end
    
    %Testing apriori
    str = rule2str([5 43],11,D) %good
    str = rule2str([17 43],11,D) %good
    str = rule2str([11 61],7,D) %good
    %find the association rules based on minimum confidence
    
    
        
end