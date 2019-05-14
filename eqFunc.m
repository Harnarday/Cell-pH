function x=eqFunc(x, r)


cell_V = 4/3*pi*(r^3);       % volume


AVOG = 6.022e+23; %// Avogadro's number
n_H = round(x(1)*cell_V*AVOG);
n_OH= round(x(2)*cell_V*AVOG);

eq = 10^(-14) * cell_V^2*AVOG^2;

% Balancing ions
% Formation of water
while n_H * n_OH > eq
n_H = n_H-1;
n_OH = n_OH-1;
end

% Dissociation of water
while n_H * n_OH < eq
n_H = n_H+1;
n_OH = n_OH+1;
end

x(1) = n_H/cell_V/AVOG;
x(2) = n_OH/cell_V/AVOG;

end