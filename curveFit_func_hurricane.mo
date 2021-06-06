// Developed by Muhammad Hurricane
// Finalized in May 30, 2021
function CurveFit_Hurricane

input Real X[:]; //adapting dimension (nDim)
input Real Y[size(X,1)]; //follows nDim of X
input Integer eqOrder = 2;  //2nd order
// if we have second order, we will need A,B,C for Ax2+Bx+C. Therefore, we put:
output Real Coefficient[eqOrder+1];

protected
Real Z[size(X,1),(eqOrder+1)];
Real ZTr[(eqOrder+1),size(X,1)];
Real A[(eqOrder+1),(eqOrder+1)];
Real B[eqOrder+1];

algorithm
for i in 1:size(X,1) loop
  for j in 1:(eqOrder+1) loop
    Z[i,j]:=X[i]^(eqOrder+1-j);
  end for;
end for;
ZTr:=transpose(Z);
A:=ZTr*Z;
B:=ZTr*Y;
Coefficient:=gaussJordan_func_Hurricane(A,B);

end CurveFit_Hurricane;
