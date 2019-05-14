function allvals = caller(x,y)
% Caller function for running cell_.m with different pH values
% x is pH of ocean
% y is pH of vent
% Settings
tmax = 2000;
% time = 0 :0.1:20;

% Parameters
% pH of ocean, e.g. pH 5
global pH_ocean
% pH insie vent, e.g. pH 9
global pH_vent
% radius of the cell, e.g. 50 microns (5/10^5)
global r

% Initial conditions
r                    = 5*10^-5;  %in decimetres, test where radius = 5 microns

allvals = zeros(tmax+1, length(x));

for j = 1:length(x)
    
    % Initial conditions
    pH_ocean             = x(j);       % pH of ocean
    pH_vent              = y(j);       % pH inside vent

    H_cell_ini              = 10^-(pH_vent);
    OH_cell_ini             = 10^-(14-pH_vent);


    pH_vals = zeros(tmax,2);
    pH_vals(1,:) = [H_cell_ini, OH_cell_ini];


    dx_vector = zeros(tmax,2);

    for i =1:tmax

        dx_vector(i,:) = cell_(pH_vals(i,:));

        pH_vals(i+1,:)= pH_vals(i,:) + dx_vector(i,:);

        pH_vals(i+1,:)= eqFunc(pH_vals(i+1,:),r);

    end
    
    allvals(:,j) = pH_vals(:,1);

end

% figure;
% subplot(2,1,1);
% plot(-log10(x));
% hold on
% ylim([6.999 7.0001]);
% xlim([0 tmax]);
% text(1600, 5.5, strcat({'final pH '}, num2str(-log10(x(tmax,1)))));
% xlabel('time');
% ylabel('pX of protocell');
% title('ocean = pH 5; vent = pH 7');
% legend('pH', 'pOH', 'location', 'northeast');
% hold off

end