---
title       : Titanic Survival Predictor
subtitle    : A Naive Bayes Demo
author      : Moaeed Sajid
job         : Coursera - Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : bootstrap     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
<style>
.title-slide {
  background-color: #FFFFFF; /* #EDE0CF; ; #CA9F9D*/
}
</style>

## Project Introduction

In this project I have used a Naive-Bayes ML model on the Titanic dataset built into the R datasets package  

This dataset shows the survival rates of passengers by

- Class
- Sex 
- Age

Using these three pieces of information we can calculate the chances of survival by the three features of each passenger.

--- .class #id

## Naive-Bayes

Naive Bayes is a family of classification algorithms based on Bayes Theorem, They all share a common principle, that every feature being classified is independent of the value of any other feature.  

For example, a fruit may be considered to be an apple if it is 

1. Red
2. Round
3. About 3″ in diameter  

A Naive Bayes classifier considers each of these “features” (red, round, 3” in diameter) to contribute 
independently to the probability that the fruit is an apple, regardless of any correlations between features.  

Features, however, aren’t always independent which is often seen as a shortcoming of the Naive Bayes
algorithm and this is why it’s labeled “naive"

--- .class #id
## Titanic Prediction

```r
library(e1071)
nbModel <- naiveBayes(Survived ~ ., data = Titanic)
predict(nbModel, data.frame(Class = "2nd", Sex = c("Male","Female"), Age = "Child"))
```

```
## [1] No  Yes
## Levels: No Yes
```

```r
predict(nbModel, data.frame(Class = "2nd", Sex = c("Male","Female"), Age = "Child"),
        type = "raw")
```

```
##              No       Yes
## [1,] 0.52213519 0.4778648
## [2,] 0.09721354 0.9027865
```
We have then run a prediction for both Male and female 2nd Class passengers.  We have then calculated the chance of
survivability for a Male and Female child situated in 2nd Class.  This output simply shows that it's unlikely that the male
child would have survived.

Using type = raw we get the actual numbers which shows that the male child actually has an almost 50% chance of survival
and the female around double at over 90%

--- .class #id
## Future Use Cases

Naive Bayes Machine learning projects can also be used for...

1. Spam/ham detection
2. Classifying documentation
3. Weather Prediction
4. Image classification



