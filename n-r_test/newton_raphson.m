function [x, x_v, fx_v] = newton_raphson(f, f_d, x0)

	x = x0;
	goal = 0;
	x_v = [x];
	fx_v = [f(x)];
	i = 0;
	while (abs(goal - f(x)) >= 0.5e-5 || i == 20)
		x = x - f(x)/f_d(x);
		x_v = [x_v x];
		fx_v = [fx_v f(x)];
		i = i + 1;
	end
end
