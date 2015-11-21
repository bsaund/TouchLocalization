function plotEdge(part, edgeIndex, varargin)
p.edges = part.edges(edgeIndex);
plot2Dpart(p,  varargin{:});
end