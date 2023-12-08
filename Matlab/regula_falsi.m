% 试错法非线性方程求根
%--------------------------------------------------------------------------
% 输入：目标函数f(x), 求解精度epsilon>0, 初始端点a, b
% 输出：迭代次数k, 迭代点向量x
%--------------------------------------------------------------------------
function [k, x] = regula_falsi(f,epsilon,a,b)
ak = a;bk = b;
x=[];
for k=1:1000
    xk=ak-feval(f,ak)*(bk-ak)/(feval(f,bk)-feval(f,ak));
    x=[x xk];
    if feval(f,xk)==0 || (bk-ak)<epsilon || abs(feval(f,xk))<epsilon
        break
    end

    if feval(f,ak)*feval(f,xk) < 0
        bk=xk;
    else
        ak=xk;
    end
end
end

