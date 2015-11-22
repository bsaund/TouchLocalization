function particles = makePartParticles(xerr, yerr, therr, center, rPoint, numParticles)
%%Constructs a set of size numParticles of parts with gaussian-normal error
%%centered about center and rotations about points
%%rPoint.

n = numParticles;

p = get2Dpart();

xerr = randn(n,1) * xerr + center(1);
yerr = randn(n,1) * yerr + center(2);
therr = randn(n,1) * therr + center(3);

particles = cell(n,1);

for i = 1:n
    particles{i} = transformPartAbout(p, xerr(i), yerr(i), ...
        therr(i), rPoint - [xerr(i), yerr(i)]);
end


end