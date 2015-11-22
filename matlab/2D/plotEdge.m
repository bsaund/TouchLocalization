function plotEdge(part, edgeIndex, varargin)
for i = edgeIndex
    p.edges = part.edges(i);
    plot2Dpart(p,  varargin{:});
end
end