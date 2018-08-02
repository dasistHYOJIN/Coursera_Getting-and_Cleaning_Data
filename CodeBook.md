### Coursera - Getting and Cleaning Data
# Code Book
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

## Source data
As you read README.md, input data can be downloaded [Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

And brief description of the variables [HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Tidy data

The aim of the project is to provide clean valuable data. Through the run_analysis.R script, the input data is cleaned and the result is a .txt file with the most representative variables. 

These variables represent the mean and standard deviation of different parameters, such as acceleration samples for each coordenate (X,Y,Z), angular speed, etc.

These variables are grouped by an activity and a subject. With this activity and subject we can differentiate the mean of the acceleration in the coordenate X when the subject 1 is walking, from the mean of the acceleration in the coordenate X when the subject 1 is laying, or the acceleration that suffers two different subjects when their are doing the same activity.

* __subject__
Subject identifier. Type: integer. Range: from 1 to 30.
* __activity__
Activity identifier. Type: string. 6 possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

### Measures

All measured parameters are floating-point values, normalised and bounded within [-1,1]. 

The measurements are classified into two different domains: time-domain and frequency-domain.

Some examples can be:
- `t.Body.Acc.mean.X`
- `f.Body.Acc.Jerk.mean.X`

Where *t.* refers to a time-domain signal and *f.* to a frequency-domain signal.

## Transformations

The performed transformations are:

1. Merge training and test sets.
2. Extract mean and standard deviation measurements.
3. Substitue activity identifier by activity description.
4. Clean variable names: remove duplicated dots, remove dots at the end of the variable name, and inside a variable name separate words with dots.
5. Calculate average value of measurements grouped by activity and subject.