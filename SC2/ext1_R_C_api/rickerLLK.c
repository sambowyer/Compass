#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>

SEXP rickerLLK(SEXP observed, SEXP simulated, SEXP sigma){
    double *yobs, *ysim;
    double sig;
    
    SEXP LLK = PROTECT(allocVector(REALSXP, 1));
    
    yobs = REAL(observed);
    ysim = REAL(simulated);
    sig  = REAL(sigma)[0];
    
    int n = length(observed);
    
    double result = 0;
    
    for (int i = 0; i < n; i++){
        result += dnorm(yobs - ysim, 0, sig, TRUE);
    }
    
    UNPROTECT(1);
    
    REAL(LLK)[0] = result;
    
    return LLK;
}