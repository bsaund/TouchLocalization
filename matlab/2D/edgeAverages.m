function avg = edgeAverages(particles)

avg = particles{1}.edges;

for i = 2:numel(particles)
    edges = particles{i}.edges;
    
    for j = 1:numel(edges)
        avg{j} = avg{j} + edges{j};
    end
end

for i = 1:numel(avg)
    avg{i} = avg{i} / numel(particles);
end

end