function [probePoint, probeDir] = findProbePoint(spreadF, bounds, edgeStart, edgeV, edgeN, edgeMax)
range = getRobotRange();

% start + t*v + normal * maxD(t) * 1.5

% spread = [];
% for t = bounds(1):.001:bounds(2)
%     spread = [spread;
%         t, spreadF(t) + .1*(.25-(t-.5).^2)];
% end
% 
% [~,maxSpread] = max(spread(:,2));
% t = spread(maxSpread,1);

maxSpread = 0;
bestT = [];
bestDir = [];
for i=1:100
    dirAngle = rand() * 2*pi;
    probeDir = [sin(dirAngle), cos(dirAngle)];
    
    if(dot(edgeN, probeDir) > -.1)
        continue
    end
    
    
    t = (bounds(2) - bounds(1))*rand() + bounds(1);
    
    
    point = (edgeStart + t*edgeV);
    probeEnd = point - probeDir *.5 + edgeN * edgeMax(t) * 1.5;
    valid = inpolygon(point(1), point(2), range(:,1), range(:,2)) &&...
        inpolygon(probeEnd(1), probeEnd(2), range(:,1), range(:,2));
    
    if(valid)
        
        if(maxSpread < spreadF(t))
            maxSpread = spreadF(t);
            bestT = t;
            bestDir = probeDir;
        end
    end
end

t = bestT;
probePoint = edgeStart + t*edgeV + edgeN * edgeMax(t) * 1.5;
probeDir = bestDir * .5;




end