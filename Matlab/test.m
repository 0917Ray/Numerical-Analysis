clear;clc;
format rat
x1=[1;-1];
H1=[2 1;1 1];
g1=[2;-6];
d1=-H1*g1;
a1=-(d1(1)*x1(1)+3*d1(2)*x1(2))/(d1(1)^2+3*d1(2)^2)

x2=x1+a1*d1
s1=x2-x1
g2=[2*x2(1);6*x2(2)]
y1=g2-g1

H2=H1+(s1*s1')/(s1'*y1)-(H1*y1*y1'*H1)/(y1'*H1*y1)
d2=-H2*g2
a2=-(d2(1)*x2(1)+3*d2(2)*x2(2))/(d2(1)^2+3*d2(2)^2)
x3=x2+a2*d2
%%
clear;clc;
format rat
x1=[1;-1];
H1=[2 1;1 1];
g1=[2;-6];
d1=-H1*g1;
a1=-(d1(1)*x1(1)+3*d1(2)*x1(2))/(d1(1)^2+3*d1(2)^2)

x2=x1+a1*d1
s1=x2-x1
g2=[2*x2(1);6*x2(2)]
y1=g2-g1

H2=H1+(1+(y1'*H1*y1)/(y1'*s1))*((s1*s1')/(y1'*s1))-(H1*y1*y1'*H1)/(y1'*H1*y1)
d2=-H2*g2
a2=-(d2(1)*x2(1)+3*d2(2)*x2(2))/(d2(1)^2+3*d2(2)^2)
x3=x2+a2*d2


