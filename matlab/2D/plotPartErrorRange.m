function plotPartErrorRange()
close all
p = get2Dpart();

numFigs = 4;

xerr = randn(10,1) * .05;
yerr = randn(10,1) * .05;
therr = randn(10,1) * .05;


figure()
for i = 1:numFigs
    rp = transformPart(p, xerr(i), yerr(i), therr(i));
    plot2Dpart(rp);
end


axis equal


end