
## skestimate package

This package is used to fit and get various metrics for a multi class classifier. It is based on scikit-learn library and uses the methods from that library.

fit_est module inside the package has a class named Xest(self, estimator, data, target_label, ts).
* estimator: A piplined classifier that encodes all the categorical features.
* data: Raw dataset including the target label
* target_label: A string type representing the name of the target label
* ts: A number between 0 and 1 that specifies the test portion of the data.

Below is an example of how to use the class methods on the CoverType data set from UCI repository.
```
$ data = pd.read_csv("https://github.com/skhabiri/PredictiveModeling-CoverType-u2build/blob/master/data/train.csv?raw=true")
rfc = make_pipeline(
    RandomForestClassifier(bootstrap=True, ccp_alpha=0.0, class_weight=None,
                           criterion='entropy', max_depth=14, max_features=20,
                           max_leaf_nodes=None, max_samples=None,
                           min_impurity_decrease=0.0, min_impurity_split=None,
                           min_samples_leaf=2, min_samples_split=10,
                           min_weight_fraction_leaf=0.0, n_estimators=10, n_jobs=-1,
                           oob_score=False, random_state=42, verbose=0,
                           warm_start=False)
                    )
xest = skestimate.Xest(rfc, data, "Cover_Type", 0.2)
```

For local testing we can use the example() function in fit_est.py.
```
>>> import skestimate	
>>> myest = skestimate.example()
>>> myest.xskew(0.9)
```

**Available methods associated with Xest class:**
* xunique():
Reports counts of unique values in each column of data

* xskew(imb=0.99):   
Returns a pandas Series of the sorted column with skewness more than imb. imb is between 0 and 1

* xfit():    
Fits the pipeline estimator and returns fitted estimator, training score, and test score

* xscore(fit=True):   
Calculates accuracy, recall and precision of a classifier and plots the confusion matrix


###  Docker Container
An axample of how to test the sketimate package in a debian OS through docker image.
Here are the steps:
* Create the Dockerfile in project (repository) directory. The specific instructions in Dockerfile includes:
    * Based in”debian” image in dockerhub
    * bash shell
    * Python3 and pip3 installed
    * numpy, pandas, scikit-learn,  and matplotlib all installed
    * skestimate package installed
* Build the image on local machine with `docker build . -t skestimate_di`
* Very the existence of the new package with `docker image ls`
* Create and enter a fresh container with `docker run -it skestimate_di’
* Test the package with:
   * python3
   * import skestimate
   * est = skestimate.example()
   * est.xscore(fit=True)
   * exit()        #exit the python repl
* Exit the container with `exit`

**Dockerfile**
```
## Image to base ours on
## docker run debian
FROM debian

## Environment variables to configure things
## Setting shell so pipenv shell works
ENV SHELL=/bin/bash

## Update and install dependencies
## Running them in pipeline. \ is for continue into a new line
## update, updates the list of packages available for install
## and install all the security packages to have an up to date OS.
RUN apt update && \
  ## Yes to possible questions as it is not running interactively
  ## upgrade potentially installs new versions of outdated packages
  apt upgrade -y && \
  ## install python3 and pip3 at the same time
  apt install python3-pip -y && \
  pip3 install pandas numpy scikit-learn matplotlib && \
  pip3 install skestimate

## In command prompt:
## docker build . -t skestimate_di
## docker run -it skestimate_di
```

### Unit Testing
You can test the individual methods in command line with `python test_skestimate.py --verbose`