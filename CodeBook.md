
#Data Source
The data for this repo comes from here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This is data from experiments done with a smartphone. The experimenters used the accelerometer and gyroscope on the phone to get the below data from a set of subjects while walking, walking upstairs, walking downstairs, sitting, standing and laying.

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

These signals produced estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

#Our manipulation of the data:
In RunAnalysis.R we do the following with the day:
<ol>
<li>Pull out only the mean and standard deviation values on these estimate variables.</li>
<li>Combine the test and train estimate data into one dataset</li>
<li>Combine the subject ids with the estimate data into one dataset</li>
<li>Combine the acitivy data with the other data points and convert the activity id into the friendly name for the activity in the dataset</li>
<li>Calculate the mean of every set of data by activity and user</li>
<li>Return a tidy set from step 5</li>
</ol>
