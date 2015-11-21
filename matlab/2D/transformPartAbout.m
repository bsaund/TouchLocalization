function rPart = transformPartAbout(part, xtr, ytr, thtr, rOrigin)
%%Transforms part with rotations about the point rOrigin

rPart = transformPart(part, -rOrigin(1), -rOrigin(2), 0);
rPart = transformPart(rPart, xtr, ytr, thtr);
rPart = transformPart(rPart, rOrigin(1), rOrigin(2), 0);

end