# 数值分析2 算法1 二分法求根

import matplotlib.pyplot as plt
import time
import math

start_time = time.time()


# 首先定义目标求根函数
def fun(x):
    return x ** 3 + math.sin(2*x) - math.cos(1.5*x) + math.sqrt(x)


# 定义二分法求根函数
def dichotomy(fun, a, b, c=10 ** (-10), k=1000):
    # fun即目标求根函数
    # a,b表示求根区间为[a,b]
    # c为误差限
    # k为迭代上限

    # 初始化区间
    A = [a]  # 记录区间左限
    B = [b]  # 记录区间右限
    X = [(a + b) / 2]  # 记录可能零点
    Fun = [fun(X[0])]  # 记录每次迭代fun值

    # 循环寻找零点
    for i in range(k):
        if fun(X[i]) * fun(B[i]) < 0:
            A.append(X[i])
            B.append(B[i])
        else:
            B.append(X[i])
            A.append(A[i])

        X.append((A[i + 1] + B[i + 1]) / 2)  # 记录X[i+1]
        Fun.append(fun(X[i + 1]))

        # 停止准则
        if abs(Fun[i + 1]) < c:
            break

    print('共迭代', len(X), '次，寻找到的零点为', X[-1], '，此时原函数值为', Fun[-1])

    return X, X[-1], Fun


X, x, Fun1 = dichotomy(fun, a=0, b=4)

end_time = time.time()
print("耗时: {:.2f}秒".format(end_time - start_time))

# X = np.linspace(1, 10, 1024)

Fun2 = [abs(x - Fun1[-1]) for x in Fun1]
plt.rcParams['font.sans-serif'] = ['Microsoft YaHei']  # 中文显示
plt.yscale('log')
plt.plot(Fun2, lw=2., c='dodgerblue')
plt.xlabel('迭代次数', fontsize=18)
plt.ylabel('$log f(x)$', fontsize=18)
plt.title('对数误差限随迭代次数变化情况', fontsize=18)
plt.tick_params(labelsize=18)
plt.show()
