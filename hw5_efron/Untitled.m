for n=1:numel(filenames)
file = filenames{n};
extension = file((end-3):end);
file = file(1:(end-4));
newfilename = strcat(file, '_efron', extension)
movefile(filenames{n}, newfilename)
end