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
pH_ocean             = 5;       % pH of ocean
pH_vent              = 9;       % pH inside vent
r                    = 5*10^-5;  %in decimetres, test where radius = 5 microns

% tmax = 100;
% dt = 10e-6;

H_cell_ini              = 10^-(pH_vent);
OH_cell_ini             = 10^-(14-pH_vent);


x = zeros(tmax,2);
x(1,:) = [H_cell_ini, OH_cell_ini];


dx_vector = zeros(tmax,2);

for i =1:tmax
    
    dx_vector(i,:) = cell_07(x(i,:));
    
    x(i+1,:)= x(i,:) + dx_vector(i,:);
    
    x(i+1,:)= eqFunc(x(i+1,:),r);
    
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