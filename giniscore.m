% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907

function score = giniscore(matrix)
	score = 0;
	for i = 1:size(matrix)
		score = score + (matrix(i) * (1 - matrix(i)));
	end
end