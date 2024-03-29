x = [5 5 5 8 8];
y = [7 9 11 10 12];

% x = [5 8];
% y = [7 10];

% Define & assign globals
global phi_H
global phi_OH
phi_H           = 1*10^-2;
phi_OH          = 1*10^-2;
phi_OH          = 1*10^-3;

all_data = caller_af(x,y);
all_data = caller(x, y);

% plot(-log10((all_data)))
% xlabel("Time");
% ylabel("pH of cell");
% xlim([0 2000]);
% legend("pH 5 -> pH 7", "pH 5 -> pH 9", "pH 5 -> pH 11", "pH 8 -> pH 10", "pH 8 -> pH 12", "pH 5 -> pH 12", 'Location', 'East');
% legend('boxoff');

final_pH = all_data(length(all_data),:);

% [5.00092317269265e-06]
% [5.00092317269265e-06]

% Ocean_pH = reshape(x, [length(x),1]);
% Vent_pH = reshape(y, [length(y),1]);
% Ocean_pH = x';
% Vent_pH = y';
all_flux_eq_flux = round(-log10(final_pH))'; % don't have to reshape, can transpose. 
all_flux_slow_OH = round(-log10(final_pH))';
no_OH_eq_flux = round(-log10(final_pH))';
no_OH_slow_OH = round(-log10(final_pH))';

T = table(Ocean_pH, Vent_pH, all_flux_eq_flux, all_flux_slow_OH, no_OH_eq_flux, no_OH_slow_OH);

writetable(T,'20190530-results.txt');
% 
% import mlreportgen.report.*
% import mlreportgen.dom.*
% 
% rpt = Report('tables');
% chapter = Chapter();
% chapter.Title = 'Table example';
% add(rpt,chapter);
% 
% tab_test = BaseTable(T);
% % tab_test = BaseTable([[Ocean_pH], [Vent_pH], [internal_cell_pH]]);
% add(rpt,tab_test);
% 
% rptview(rpt);
