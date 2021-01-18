
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

