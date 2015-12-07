function rangePolygon = getRobotRange()
ang = 0:2*pi/100:2*pi;
center = [2,0];
r = 2;

x = r*cos(ang) + center(1);
y = .3*r*sin(ang) + center(2);

rangePolygon = [x', y'];

end