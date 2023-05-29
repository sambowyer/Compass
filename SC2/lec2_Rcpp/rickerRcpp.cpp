#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector rickerSimul_Rcpp(const int n, const int nburn, const double r, const double y0){
    // vector to return
    NumericVector y(n);

    double yx = y0;

    // burn-in
    if(nburn > 0){
        for(int i=0; i<=nburn; i++){
        yx = r * yx * exp(-yx);
        }
    }

    // run simulation and store values
    y[0] = yx;
    for(int i=1; i<n; i++){
        yx = r * yx * exp(-yx);
        y[i] = yx;
    }

    return y;
}

// [[Rcpp::export]]
NumericVector synllk_Rcpp(const double logr, const int nsim, const NumericVector yobs){
    NumericVector ysim;
    NumericVector s1(nsim), s2(nsim);
    NumericVector y0(nsim);
    NumericVector out;

    double r = exp(logr);

    y0 = runif(nsim, 0, 10);
    for(int i=0; i<nsim; i++){
        // assume we know sd = 0.1
        ysim = rickerSimul_Rcpp(50, 100, r, y0[i]) * exp(rnorm(50, 0, 0.1));
        s1[i] = mean(ysim);
        s2[i] = sd(ysim);
    }

    // add log-likelihoods of our two summary statistics
    out = R::dnorm(mean(yobs), mean(s1), sd(s1), true) + R::dnorm(sd(yobs), mean(s2), sd(s2), true);
    
    return out;
}