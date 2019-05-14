% Settings
tmax = 2000;

% Parameters
% pH of ocean, e.g. pH 5
global pH_ocean
% pH insie vent, e.g. pH 9
global pH_vent
% radius of the cell, e.g. 50 microns (5/10^5)
global r

% Initial conditions
pH_ocean             = 5;       % pH of ocean
pH_vent              = 11;       % pH inside vent
r                    = 5*(10-6);  % test where radius = 50 microns


H_cell_ini              = 10^-(pH_vent);
OH_cell_ini             = 10^-(14-pH_vent);


x = zeros(tmax,2);
x(1,:) = [H_cell_ini, OH_cell_ini];


dx_vector = zeros(tmax,2);

for i =1:tmax
    
    dx_vector(i,:) = cell_04(x(i,:));
    
    x(i+1,:)= x(i,:) + dx_vector(i,:);
    
    x(i+1,:)= eqFunc(x(i+1,:),r);
    
    % keep concentrations from falling below 0
    if x(i,:) + dx_vector(i,:) < 0 
        % x(i+1,:) = 0;
        % don't actually think this is neccessary because of eqFunc
        uiwait(warnglg('Wrong parameters...'));
    end 
       
end

% figure;
% subplot(2,1,1);
plot(-log10(x));
xlim([0 tmax]);
text(1600, 5.5, strcat({'final pH '}, num2str(-log10(x(tmax,1)))));
xlabel('time');
ylabel('pX of protocell');
title('ocean = pH 5; vent = pH 11');
legend('pH', 'pOH', 'location', 'northeast');