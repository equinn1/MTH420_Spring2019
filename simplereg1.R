## Simple regression
#  using artificial data

rm(list = ls())        # clear the workspace

N = 50                 # sample size
a = 10                 # intercept
b = 1                  # slope
sigma_e = 5            # residual standard error

x = seq(1:N)/5         # x values
e = rnorm(N,0,sigma_e) # residuals
y = a + b*x + e        # y values

y[20] = NA             # set one missing value

df = data.frame(x,y)   # create a dataframe with x and y

summary(df)            # inspect the values in df

boxplot(df)            # show boxplots

plot(y~x,data=df)      # scatterplot of y against x

lm1 = lm(y~x,data=df)  # run the simple regression
summary(lm1)           # show the results

lines(lm1$model$x, fitted(lm1), col="green") #show fitted

plot(lm1$residuals~lm1$model$x)  # plot the residuals
abline(h=0)                      # add line at zero

sum(lm1$residuals)     # the residuals add to zero
lm1$residuals%*%lm1$fitted.values  # fitted dot residuals=0

sum(y^2)               # squared length of y vector

sum(y^2, na.rm=TRUE)   # this works

sum(lm1$model$y^2)     # this is better

sum(lm1$residuals^2)        # squared length of residuals
sum(lm1$fitted.values^2)    # squared length of fitted

sum(lm1$residuals^2)+sum(lm1$fitted.values^2)  # sum

sum((lm1$model$y-mean(lm1$model$y))^2)  # ss y-mean(y)

(sum((lm1$model$y-mean(lm1$model$y))^2)-
    sum(lm1$residuals^2))     #reduction in squared length

(sum((lm1$model$y-mean(lm1$model$y))^2)-
    sum(lm1$residuals^2))/
  sum((lm1$model$y-mean(lm1$model$y))^2)  # multiple R^2

lm1$df.residual                # residual DF

sqrt(sum(lm1$residuals^2)/lm1$df.residual)  # Residual SE





