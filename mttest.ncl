
; Tests for Differences of Mean under Independence
; Input variables: var1, var2
; Output variables: P_var_ano 
; P_var_ano: the statistical confidence level 

undef("mttest")
function mttest(var1,var2)
begin
  var_ano=dim_avg_n(var1, 0)-dim_avg_n(var2, 0)
  
  ; Get the input array's dimension sizes
  dim_var1=dimsizes(var1)
  dim_var2=dimsizes(var2)

  n1=dim_var1(0)
  n2=dim_var2(0)
  df=n1+n2-2
  n11 = 1.0 / n1
  n22 = 1.0 / n2
  m   = sqrt(n11 + n22)
  s1=dim_variance_n_Wrap(var1, 0)
  s2=dim_variance_n_Wrap(var2, 0)
  s=sqrt(((n1-1) * s1 + (n2-1) * s2) / (n1 + n2 - 2.0))
  z=var_ano/(s*m)
  P_var_ano=student_t(z, df)
  P_var_ano=1-P_var_ano

  return(P_var_ano)

end
