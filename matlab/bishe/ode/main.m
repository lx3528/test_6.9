
dy = @(t,y) [y(2);y(1) + 1];
options=odeset('events',@events1);
[t,y,ai,bi,ci] = ode45(dy,[0 12],[0 1],options);
plot(t,y)