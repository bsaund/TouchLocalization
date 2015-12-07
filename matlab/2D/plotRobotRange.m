function plotRobotRange()

range = getRobotRange();
patch(range(:,1), range(:,2), [.5,1,.2], 'FaceAlpha', .1,'EdgeAlpha', 0)
end