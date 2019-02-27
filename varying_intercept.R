library(rethinking)

epa <- read.csv("epa.csv")

epa$wtk = (epa$etw - mean(epa$etw))/1000

lm1 <- lm(mpg~mfr.name+wtk,data=epa)
summary(lm1)

boxplot(lm1$fitted.values~lm1$model$mfr.name)

plot(lm1$fitted.values~lm1$model$wtk)

dat <- list(
  y = epa$mpg,
  mfix = as.integer(epa$mfr.name),
  wt = epa$wtk )
# varying intercept model
rstan_options(auto_write = TRUE)
m13.1 <- ulam(
  alist(
    y ~ dnorm( mu , sigma ) ,
    mu <- a[mfix] + b*wt,
    a[mfix] ~ dnorm( 0 , 75 ),
    b ~ dnorm( 0, 3),
    sigma ~ dunif(0,30)
  ), data=dat , chains=4 , cores=4,  log_lik=TRUE )

precis(m13.1,depth=2)

m13.2 <- ulam(
  alist(
    y ~ dnorm( mu , sigma ) ,
    mu <- a[mfix] + b*wt,
    a[mfix] ~ dnorm( 0 , 2.5 ),
    b ~ dnorm( -5, 1),
    sigma ~ dunif(0,8)
  ), data=dat , chains=4 , cores=4,  log_lik=TRUE )

precis(m13.2,depth=2)