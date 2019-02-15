## brms example from vignette
library(lme4)
library(MASS)
library(brms)

n_reps=10

n_subs=200

a=rnorm(n_subs)
b=rnorm(n_subs,2)

sub = rep(seq(1:n_subs),each=n_reps)
sub

ar = rep(a,each=n_reps)
ar
br = rep(b,each=n_reps)
x = rep(seq(1:n_reps),n_subs)
br = x*br
br
sigma_e = 1
e = rnorm(n_subs*n_reps,0,sigma_e)

y = ar+br+e

df = data.frame(sub,x,y)

str(df)

fm2 <- lmer(y ~ x + (x | sub), df)
summary(fm2)

fm3 <- brm(y ~ x + (x | sub), df, chains=4, cores=4)
summary(fm3)
