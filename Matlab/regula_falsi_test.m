clear;clc;
[k, x] = regula_falsi(@dichotomyfun,1e-10,0,1);
% 绘制迭代过程图图像
ite = linspace(1,k,k);

semilogy(ite,abs(x-x(end)),'--x',LineWidth=1.5,Color=[140 80 90]/255)
title('试错法求解过程','FontSize',16)
xlabel('迭代次数','FontSize',14)
ylabel('log(|x_i-x^*|)','FontName','Cambria','FontSize',14)