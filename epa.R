library(brms)

df = read.csv("epa.csv")

fit1 = brm(mpg ~ 1 + C.H + car.truck,data=df)

summary(fit1)

lm1 <- lm(mpg ~ C.H+car.truck,data=df)
summary(lm1)
