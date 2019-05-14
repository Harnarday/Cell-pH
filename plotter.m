% plotting

figure()
caller_pH5to7_06
plot(-log10(x(:,1)), 'Linewidth', 2);
hold on
caller_pH5to9_06
plot(-log10(x(:,1)), 'Linewidth', 2);
caller_pH5to11_06
plot(-log10(x(:,1)), 'Linewidth', 2);
caller_pH8to10_06
plot(-log10(x(:,1)), 'Linewidth', 2);
caller_pH8to12_06
plot(-log10(x(:,1)), 'Linewidth', 2);
hold off
legend('5-7', '5-9', '5-11','8-10','8-12', 'location', 'east');
xlim([0 500]);
xlabel('time');
ylabel('pH');