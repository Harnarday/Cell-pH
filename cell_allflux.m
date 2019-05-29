function dx = cell_allflux(x)

dx = zeros(1,2);

% Parameters
% pH of ocean, e.g. pH 5
global pH_ocean
% pH insie vent, e.g. pH 9
global pH_vent


% Concentrations
% Ocean
H_ocean               = 10^-(pH_ocean);
OH_ocean                = 10^(14-pH_ocean);
OH_vent               = 10^-(14-pH_vent);
H_vent                = 10^-(pH_vent);


% Constants
AVO.N                   = 6.022e+23;    % Avogardro's number
KW                      = 1e-14;        % Water equilibrium constant,(mol/L)^2

% % Ratio of ocean/ vent distribution
% ocean_side              = 0.3;       % random figures  
% vent_side               = 0.7;       
% 
% %Permeability constants
% perm_H                     = 0.4;
% perm_OH                    = 0.2;

%Variables
H_cell = x(1);
OH_cell = x(2);

% Protocell
% r                       = 5/10^5;           %  radius = 50 microns
% cell_SA                 = 4*pi*(r^2);       % surface area
% cell_volume             = (4/3)*pi*(r^2);   % volume



%% Dynamic Equations

% will need equation for influx of H+ & OH- (& efflux?)
% these values stored in a matrix

% Rates of reaction, constants for now
global phi_H
global phi_OH
% phi_H           = 1*10^-2;
% phi_OH          = 1*10^-2;


% Change in H inside the cell
dx(1) = (phi_H * (H_ocean - H_cell)) + (phi_H * (H_vent - H_cell));
% here we are now including the efflux of H into the vent
% current unit is mol/ dm^3

%change in OH
dx(2) = (phi_OH * (OH_vent - OH_cell)) + (phi_OH * (OH_ocean - OH_cell));


% dx(1) = (phi_H * (H_ocean - H_cell)) + (phi_H * (H_vent - H_cell));
% % here we are now including the efflux of H into the vent
% % current unit is mol/ dm^3
% 
% %change in OH
% dx(2) = (phi_OH * (OH_vent - OH_cell)) + (phi_OH * (OH_ocean - H_cell));
% % We do not consider the efflux of OH into the ocean, as we are assuming
% % that the barrier will not permit diffusion of OH

end