function plotProbe(pos, dir)

scatter(pos(1), pos(2), 25, 'k', 'filled')
% dir = dir/norm(dir);
probeLine = [pos; pos - dir];
plot(probeLine(:,1), probeLine(:,2), 'k')

end