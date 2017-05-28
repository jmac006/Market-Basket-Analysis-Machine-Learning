% CS171 Problem Set 4
% Name: Justin Mac
% Date: 5/25/17
% SID: 861086907

function [Y, dt] = runq1()

	bankTrain = load('banktrain.data', '-ascii');
	bankTrainX = bankTrain(:, 1:end-1);
	bankTrainY = bankTrain(:, end);

	%Using 65% of the data as training data
	trainX = bankTrainX(1: .65*size(bankTrainX),:);
	trainY = bankTrainY(1: .65*size(bankTrainY),:);
	%Use 35% of the data as the pruning set
	pruneX = bankTrainX(.65*size(bankTrainX):end,:);
	pruneY = bankTrainY(.65*size(bankTrainY):end,:);

	%attribute information for 19 features (categorical or numerical=0)
	ftypes = [0, 12, 4, 8, 3, 3, 3, 2, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0]

	dt = learndt(trainX, trainY, ftypes, @giniscore);
	dt = prunedt(dt, pruneX, pruneY);

	drawdt(dt); %draw decision tree

	bankTest = load('banktestX.data', '-ascii');
	Y = predictdt(dt, bankTest)

end