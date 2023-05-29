#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
  
SEXP rickerSimul(SEXP num, SEXP numburn, SEXP rate, SEXP initialPop){
    double *xys;
    int n, nburn;
    double r, y0;
    SEXP ys;
    
    n = INTEGER(num)[0];
    ys = PROTECT(allocVector(REALSXP, n));
    xys = REAL(ys);
    
    nburn = INTEGER(numburn)[0];
    r = REAL(rate)[0];
    y0 = REAL(initialPop)[0];
    
    double yx = y0;
    
    // Burn in phase
    if(nburn > 0){
      for(int i = 0; i < nburn; i++){ 
        yx = r * yx * exp(-yx);
      }
    }
    
    // Simulating and storing
    for(int i=1; i < n; i++){
      yx = r * yx * exp(-yx);
      xys[i] = yx;
    }
    
    UNPROTECT(1);
    
    return ys;
  }