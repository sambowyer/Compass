#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>

SEXP rickerLLK(SEXP observed, SEXP simulated, SEXP sigma){
    double *yobs, *ysim, sig, *lik;
    int n;

    SEXP LLK;
    
    yobs = REAL(observed);
    ysim = REAL(simulated);
    sig  = REAL(sigma)[0];
    n = length(observed);

    LLK = PROTECT(allocVector(REALSXP, 1));
    
    lik = REAL(LLK);
    lik[0] = 0;
    
    for (int i = 1; i < n; i++){
        lik[0] = lik[0] + dnorm(log(yobs[i]/ysim[i]), 0, sig, 1);
    }
    
    UNPROTECT(1);
    return LLK;
}