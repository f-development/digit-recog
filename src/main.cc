#include "handwritten_digit_analyzer.h"

int main() {
	double learningRate = 10;

	digit_recognizer::handwritten_digits_analyzer analyzer({ 100, 30 }, learningRate);

	size_t numEpochs = 30;

	analyzer.trainWithBinaryFile(numEpochs,
    "./data/mnist/train-images.idx3-ubyte",
		"./data/mnist/train-labels.idx1-ubyte",
		"./data/mnist/t10k-images.idx3-ubyte",
		"./data/mnist/t10k-labels.idx1-ubyte");

	//analyzer.trainWithTextFile(numEpochs, "../../../data/mnist/mnist_train.csv",
		//"../../../data/mnist/mnist_test.csv");

}