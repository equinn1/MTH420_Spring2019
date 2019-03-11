library(brms)

N = 120
a = 10
b = 1.5
sigma_e = 8
x = seq(1:N)/10
y = a + b*x + rnorm(N,0,sigma_e)
df = data.frame(y,x)

fit1 <- brm(y ~ 1 + x, data = df)

summary(fit1)

plot(fit1)

summary(lm(y~x,data=df))
