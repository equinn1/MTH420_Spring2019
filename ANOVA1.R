rm(list=ls())

n_reps = 15
n_levels = 5

lvl = vector('integer')
a   = vector('numeric')

alpha = rnorm(n_levels,0,10)

for (i in seq(1,n_levels)){
  lvl = c(lvl,rep(i,n_reps))
  a = c(a,rep(alpha[i],n_reps))
}

sigma_e = 10

e <-  rnorm(n_reps*n_levels,0,sigma_e)
mean(e)
var(e)

y = a + e

lvl = as.factor(lvl)

df = data.frame(y,lvl)

boxplot(y~lvl,data=df)

aov1=aov(y~lvl,data=df)
summary(aov1)

TukeyHSD(aov1)



