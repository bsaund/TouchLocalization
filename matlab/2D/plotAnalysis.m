function plotAnalysis(analysis, edges, varargin)

numE = numel(analysis.avg.edges);

plotEdge(analysis.avg, edges, varargin{:});

%centers
c = cell2mat(analysis.avg.centers.');
scatter(c(edges,1), c(edges,2), 'filled')

%normals
n = cell2mat(analysis.avg.normals.');
d = analysis.edgeLength;
quiver(c(edges,1), c(edges,2), ...
    n(edges,1).*d(edges)/4, n(edges,2).*d(edges)/4, varargin{:});


for edgeIndex = edges
    edge = analysis.alignedEdge{edgeIndex}.particle;
    
    for particleIndex = 1:numel(edge)
        point = edge{particleIndex};
        scatter(point(:,1), point(:,2),'filled', 'k')
    end
end
    


for i = edges
    maxD = analysis.maxEdgeDist{i};
    minD = analysis.minEdgeDist{i};
    p = [];
    start = analysis.avg.edges{i};
    v = start(2,:) - start(1,:);
    start = start(1,:);
    normal = analysis.avg.normals{i};
    
    for t = 0:.01:1
        p = [p; start + t*v + normal * maxD(t)];
    end
    
    for t = 1:-.01:0
        p = [p; start + t*v + normal * minD(t)];
    end
    
    patch(p(:,1), p(:,2), [1,0,0], 'FaceAlpha', .2,'EdgeAlpha', 0)
    
end
    
    

end