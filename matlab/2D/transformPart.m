function rPart = transformPart(part, xtr, ytr, thtr)

rPart.edges = cell(size(part.edges));

for i = 1:numel(part.edges)
    edge = part.edges{i};
    R = [cos(thtr), sin(thtr); -sin(thtr), cos(thtr)];
    rPart.edges{i} = (R*edge')' + [xtr, ytr; xtr, ytr]; 
end

end

