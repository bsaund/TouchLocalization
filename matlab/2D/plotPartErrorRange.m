function plotPartErrorRange()
close all
p = get2Dpart();

numFigs = 6;

xerr = randn(10,1) * .06;
yerr = randn(10,1) * .1;
therr = randn(10,1) * .03;


figure()
for i = 1:numFigs
    rp = transformPart(p, xerr(i), yerr(i), therr(i));
    plot2Dpart(rp,'r');
end
plot2Dpart(p,'k','LineWidth',3)
axis off


for i = -1:.25:1
    plotProbe([i, .4], [0,-.5]);
end

for i = -.5:.25:.5
    plotProbe([-1.3, i], [.5,0]);
end


axis equal


end