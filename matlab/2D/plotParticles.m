function plotParticles(p, varargin)

defaultPlot = ~numel(varargin);

for i = 1:numel(p)
    if defaultPlot
        plot2Dpart(p{i}, 'k')
    else
        plot2Dpart(p{i}, varargin{:})
    end

end
axis equal
end