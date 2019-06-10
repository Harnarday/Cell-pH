function dx = cell_flux_cments(x)

% dx = zeros(1,2);
dx = {[], [], []};

% Parameters
% pH of ocean, e.g. pH 5
global pH_ocean
% pH insie vent, e.g. pH 9
global pH_vent
global r


% Concentrations
% Ocean
H_ocean               = 10^-(pH_ocean);
OH_ocean              = 10^-(14-pH_ocean);
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

% Diffusion constants in water;
% 
dH              = 9 * 10^-9; % m^2/s
dOH             = 5 * 10^-9; % m^2/s

%%% First compartment
% H+ flux
dx{1,1}(1) = (phi_H * (H_ocean - 'compartment1')) + ...
    (((dH)*(pi* r^2)) * (compartment_2_H - 'compartment1'));

% OH- flux
dx{1,1}(2) = (phi_OH * (OH_ocean - 'compartment1')) +...
    (((dOH)*(pi* r^2)) * (compartment_2_H - 'compartment1'));

%%% Second compartment
% H flux
dx{1,2}(1) = (((dH)*(pi* r^2)) * ('compartment_1_H' - 'compartment_2_H'))...
    + (((dH)*(pi* r^2)) * ('compartment_3_H' - 'compartment_2_H'));
% OH- flux
dx{1,2}(2) = (((dOH)*(pi* r^2)) * ('compartment_1_OH' - 'compartment_2_OH'))...
    + (((dOH)*(pi* r^2)) * ('compartment_3_OH' - 'compartment_2_OH'));

%%% Third compartment
dx{1,3}(1) = (phi_H * (H_vent - 'compartment_3_H')) + ...
    (((dH)*(pi* r^2)) * (compartment_2_H - 'compartment_3_H'));
dx{1,3}(2) = (phi_OH * (OH_vent - 'compartment_3_OH')) +...
    (((dOH)*(pi* r^2)) * (compartment_2_OH  - 'compartment_3_OH'));

% % current unit is mol/ dm^3

end