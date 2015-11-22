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

edge = 2;

particles = makePartParticles(0.1,.05,.05,[0,0,.1], [.3,0], 10);
plotParticles(particles,'color',[.2,.1,.1, .05]);
plotParticleEdges(particles, edge, 'color', [.1,.1,.1,.3])

analysis = edgeAnalysis(particles);
plotAnalysis(analysis, edge, 'b', 'LineWidth',2)


end