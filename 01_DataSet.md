This app will demonstrate simple, additive and interactive regression. It will use the dataset Salaries, (from Fox J. and Weisberg, S. (2011) An R Companion to Applied Regression, Second Edition Sage).

The data set contains 397 observations containing 6 variables, shown further below. 

The data investigates whether there is a correlation between various explanatory variables and professors' salaries. We will investigate this while demonstrating various methods of regression.

Variable Name          | Description           
--------------------   | ------------------------------------------------
Rank 			       | a factor with levels {AssocProf, AsstProf, Prof}
Discipline	           | a factor with department levels {A = "theoretical", B = "applied"}
YearsPhd               | years since receiving PhD                                                       
YearsService           | years of service                                                                
Gender 			       | a factor with levels {Female, Male}                                             
Salary		           | nine-month salary, in dollars        

--------------------------------------

Call:
lm(formula = Salary ~ YearsPhd, data = sData)

Residuals:
   Min     1Q Median     3Q    Max 
-84171 -19432  -2858  16086 102383 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  91718.7     2765.8  33.162   <2e-16 ***
YearsPhd       985.3      107.4   9.177   <2e-16 ***

Signif. codes:  0 <U+0091>***<U+0092> 0.001 <U+0091>**<U+0092> 0.01 <U+0091>*<U+0092> 0.05 <U+0091>.<U+0092> 0.1 <U+0091> <U+0092> 1

Residual standard error: 27530 on 395 degrees of freedom
Multiple R-squared:  0.1758,	Adjusted R-squared:  0.1737 
F-statistic: 84.23 on 1 and 395 DF,  p-value: < 2.2e-16


