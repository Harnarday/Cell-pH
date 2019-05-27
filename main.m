x = [5 5 5 8 8 5];
y = [7 9 11 10 12 12];

% x = [5 8];
% y = [7 10];

all_data = caller(x,y);

plot(-log10((all_data)))
xlabel("Time");
ylabel("pH of cell");
xlim([0 2000]);
legend("pH 5 -> pH 7", "pH 5 -> pH 9", "pH 5 -> pH 11", "pH 8 -> pH 10", "pH 8 -> pH 12", "pH 5 -> pH 12", 'Location', 'East');
legend('boxoff');

test = all_data(length(all_data),:);

% [5.00092317269265e-06]
% [5.00092317269265e-06]

Ocean_pH = reshape(x, [length(x),1]);
Vent_pH = reshape(y, [length(y),1]);
internal_cell_pH = round(-log10(test))'; % don't have to reshape, can transpose. 

T = table(Ocean_pH, Vent_pH, internal_cell_pH)
