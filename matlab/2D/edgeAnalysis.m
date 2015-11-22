function analysis = edgeAnalysis(particles)
analysis = struct('avg',[], ...
    'edgeOffset', cell(1),...
    'edgeDist', []);
analysis.avg.edges = edgeAverages(particles);

for i = 1:numel(analysis.avg.edges)
    edgeAvg = analysis.avg.edges{i};
    
    %normal
    v = edgeAvg(2,:) - edgeAvg(1,:);
%     v = v/norm(v);
    normal = [-v(2), v(1)];
    normal = normal/norm(normal);
    analysis.avg.normals{i} = normal;
    
    
    %center
    analysis.avg.centers{i} = (edgeAvg(1,:) + edgeAvg(2,:))/2;
    
    %edge length
    analysis.edgeLength(i) = pdist(edgeAvg);
    
    %offset from average
    for j = 1:numel(particles)
        edge = particles{j}.edges{i};
        offset = edge - edgeAvg;
        analysis.edgeOffset{i}.particle{j} = offset;
        
        e =edge(2,:) - edge(1,:);
        
%         alpha = - offset dot v / e dot v
        
        alpha = - (offset * v')  / (e*v');
        
        %Align offset 
        alignedOffset = offset +  alpha * e;
        analysis.alignedEdgeOffset{i}.particle{j} = alignedOffset;
        analysis.alignedEdge{i}.particle{j} = alignedOffset + edgeAvg;
        
        nDist = (normal * alignedOffset')'; 
        
        %normal dist from end of average edge to particle edge
        analysis.edgeNormalDist{i}.particle{j} = nDist;
        
        %tangent distance from the end of the edge to the average edge, in
        %a frame where the average edge is horizontal and scaled to length
        %1        
        analysis.edgeTanDist{i}.particle{j} = (offset * v')/ (norm(v)^2);
        
        %Slope of the edge, in a frame where the average edge is horizontal
        %and scaled to length 1.
        analysis.edgeSlope{i}.particle{j} = nDist(2) - nDist(1);

    end
    
    %Bounds where all particles have an edge in the region, again the
    %average edge is horizontal and scaled to length 1.
    tDists = cell2mat(analysis.edgeTanDist{i}.particle)';
    lb = max(tDists(:,1));
    ub = 1 + min(tDists(:,2));
    analysis.safeEdgeBounds{i} = [lb, ub];
    
    
    b = cell2mat(analysis.edgeNormalDist{i}.particle);
    b = b(1,:)';
    
    m = cell2mat(analysis.edgeSlope{i}.particle)';
    
    analysis.maxEdgeDist{i} = @(t) max(m*t + b);
    analysis.minEdgeDist{i} = @(t) min(m*t + b);
    
    analysis.spread{i} = @(t) max(m*t+b) - min(m*t + b);
    
    
    
    
    
%             
    
end

analysis.edgeLength = analysis.edgeLength';

end