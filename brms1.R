## brms example from vignette
library(brms)

N=100
a = 6
b=3
sigma_e=5
x=seq(1:N)/20
y=a+b*x+rnorm(N,0,sigma_e)
plot(y~x)

df=data.frame(y,x)

brm(y~1,data=df)

mean(df$y)

brm(y~x,data=df)

N=30
n_levels=3
alphas=rnorm(3,0,10)
sigma_e=15
lvl = as.factor(rep(seq(1:n_levels),each=N))
lvl
a = rep(alphas,each=N)
a
e = rnorm(n_levels*N,0,sigma_e)
y = a+e

df2 = data.frame(y,lvl)

boxplot(y~lvl,data=df2)

brm(y~lvl,data=df2)