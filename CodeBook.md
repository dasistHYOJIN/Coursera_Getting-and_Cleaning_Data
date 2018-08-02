### Coursera - Getting and Cleaning Data
# Code Book
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.


## Data Source
As you read README.md, input data can be downloaded at **[HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)**

And brief description of the variables at **[HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)**


## Tidy Data
The aim of the project is to provide clean valuable data. Through the run_analysis.R script, the input data is cleaned and the result is tidy_data.txt file. 


## Data Variables
**Files what we need :**
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

**There are 3 types of data.**
1. **```features``` **
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

2. **```labels``` **
The labels mean activity. Each datasets in test and train folder, there's a ```y_xxxx.txt``` file including the type of activity. You will need to match this file with ```activity_lables.txt``` to see what this integer values exactly mean.

3. **```sets``` **
The sets mean exact result of measured value. Each datasets in test and train folder, there's a ```x_xxxx.txt``` file.





