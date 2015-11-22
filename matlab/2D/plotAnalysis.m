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
%     edge = analysis.
    
    for particleIndex = 1:numel(edge)
        point = edge{particleIndex};
%         scatter(point(:,1), point(:,2),'filled', 'k')
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
    
    b = analysis.safeEdgeBounds{i};
    
    for t = b(1):.001:b(2)
        p = [p; start + t*v + normal * maxD(t)];
    end
    
    for t = b(2):-.001:b(1)
        p = [p; start + t*v + normal * minD(t)];
    end
    
    patch(p(:,1), p(:,2), [1,0,0], 'FaceAlpha', .2,'EdgeAlpha', 0)
    
    spreadF = analysis.spread{i};
    spread = [];
    for t = b(1):.001:b(2)
        spread = [spread;
            t, spreadF(t) + .1*(.25-(t-.5).^2)];
    end
    
    [~,maxSpread] = max(spread(:,2));
    t = spread(maxSpread,1);
    plotProbe(start + t*v + normal * maxD(t) * 1.5, -normal * .5);
    
end
    
axis off
    

end













