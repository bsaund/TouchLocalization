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


particles = makePartParticles(0,.01,.05,[0,0,0], [1,0], 10);
plotParticles(particles,'color',[.1,.1,.1, .1]);
plotEdges(particles, 2, 'k')


end