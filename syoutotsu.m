function [s,v3,v4,E] = syoutotsu(v1,v2,e) %物体1,2の速度と反発係数を入力
dt = 0.05;
x01 = -15;%物体1の初期値
x02 = 15;%物体2の初期値
x1 = x01;
x2 = x02;
m1 = 3;%物体1の質量
m2 = 2;%物体2の質量
t = abs(x01-x02)/abs(v1-v2); % 物体が衝突した時間
s = x01 + v1*t;%物体が衝突した位置
v3 = (v1*(m1-m2*e)+v2*m2*(1+e))/(m1+m2);%物体1の衝突後の速度
v4 = (v1*m1*(1+e)+v2*(m2-m1*e))/(m1+m2);%物体2の衝突後の速度
E = (1/2)*m1*v3*v3+(1/2)*m2*v4*v4 ...
    - ((1/2)*m1*v1*v1+(1/2)*m2*v2*v2);%力学的エネルギーの変化
y=0;
a = 0;
plotsize = [-20 20 -10 10];
    hold on
while  x1 > -20 && x1 < 20 || x2 > -20 && x2 < 20 %両者の物体が画面外にでると処理を修了
    plot(x1,y,'o','MarkerSize',30)  
    axis(plotsize);
    xlabel('Position')
    hold off
    hold on
    plot(x2,y,'o','MarkerSize',20)
    pause(0.001);
    if x1>=s %物体1が衝突した位置を超えたらaを1にする
        a = 1;
    end
    if a == 0%物体が衝突するまでの処理
    x1 = x1 + v1*dt; 
    x2 = x2 + v2*dt;
    elseif a == 1%物体が衝突した後の処理
    x1 = x1 + v3*dt;
    x2 = x2 + v4*dt;
    end
    hold off
end
end

    
