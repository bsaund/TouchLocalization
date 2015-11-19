function plot2Dpart(part, varargin)

hold on


for i = 1:numel(part.edges)
    edge = part.edges{i};
    plot(edge(:,1), edge(:,2), varargin{:});
end

% setAxes()

end

function setAxes()
axis equal


ax = axis();
axRange = ax(2) - ax(1);
axExp = axRange * .1;
axis(ax + [-axExp, axExp, -axExp, axExp]);
end