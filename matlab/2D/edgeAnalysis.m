function analysis = edgeAnalysis(particles)
analysis = struct('avg',[], ...
    'edgeOffset', cell(1),...
    'edgeDist', []);
analysis.avg.edges = edgeAverages(particles);

for i = 1:numel(analysis.avg.edges)
    edgeAvg = analysis.avg.edges{i};
    
    %normal
    v = edgeAvg(1,:) - edgeAvg(2,:);
    v = v/norm(v);
    normal = [v(2), -v(1)];
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
        
        e =edge(1,:) - edge(2,:);
        
%         alpha = - offset dot v / e dot v
        
        alpha = - (offset * v')  / (e*v');
        
        
        alignedOffset = offset +  alpha * e;
        analysis.alignedEdgeOffset{i}.particle{j} = alignedOffset;
        analysis.alignedEdge{i}.particle{j} = alignedOffset + edgeAvg;
        
        nDist = (normal * alignedOffset')'; 
        analysis.edgeNormalDist{i}.particle{j} = nDist;
        
        analysis.edgeSlope{i}.particle{j} = nDist(2) - nDist(1);

    end
    
    b = cell2mat(analysis.edgeNormalDist{i}.particle);
    b = b(1,:)';
    
    m = cell2mat(analysis.edgeSlope{i}.particle)';
    
    analysis.maxEdgeDist{i} = @(t) max(m*t + b);
    analysis.minEdgeDist{i} = @(t) min(m*t + b);
    
    
    
    
    
%             
    
end

analysis.edgeLength = analysis.edgeLength';

end