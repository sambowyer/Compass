#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector metrop_Rcpp(Function lik, double init, int n, double scale){
    double proposal;

    NumericVector samples(n);    
    NumericVector alpha(n);

    samples[0] = init;

    for(int i=1; i<n; i++){
        proposal = R::rnorm(samples[i-1], sqrt(scale));

        alpha[i] = as<double>(lik(proposal))/as<double>(lik(samples[i-1]));

        if(R::runif(0,1) < alpha[i]){
            samples[i] = proposal;
        }
        else {
            samples[i] = samples[i-1];
        }
    }

    return samples;
}