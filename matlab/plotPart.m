function plotPart(part)
close all
figure()
hold on
for plane = part.planes
patch(plane1(:,1), plane1(:,2), plane1(:,3), [1,1,1])
end