function testing()
close all
% 
% p = get2Dpart();
% 
% figure();
% plot2Dpart(p, 'k')
% 
% pr = transformPartAbout(p, 0,0,.1, [-1, -.1]);
% plot2Dpart(pr, 'r')
% 
% axis equal

edge = 3;

particles = makePartParticles(.1,0.0,0,[0,0,.1], [-.7,.1], 10);
save('particles3','particles');
% load('particles.mat')

plotParticles(particles,'color',[.2,.1,.1, .1]);
plotParticleEdges(particles, edge, 'color', [.1,.1,.1,.4])

analysis = edgeAnalysis(particles);
plotAnalysis(analysis, edge, 'b', 'LineWidth',2)


end