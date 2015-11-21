function plotEdges(particles, edgeIndex, varargin)

for i = 1:numel(particles)
    part = particles{i};
    plotEdge(part, edgeIndex, varargin{:});
end

end