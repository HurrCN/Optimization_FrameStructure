model coeff_areaToCost_Hurricane

//input the cross-sectional area catalog in m^2
parameter Real Area[6]={0.000141, 0.000171, 0.000231, 0.000304, 0.000375, 0.000425};
//input the pricing catalog in Rupiah
parameter Real Cost[6]={135579, 162261, 217278, 287191, 358322, 410269};

//Output : The coefficient
Real Coeff[3];

equation

Coeff=CurveFit_Hurricane(Area,Cost,2); //sorted by input list in the function

end coeff_areaToCost_Hurricane;
