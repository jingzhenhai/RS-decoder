function [ corrected ] = correct_errors( err_locs, err_magn )
%   Corrects the corrupted code by adding
%   the error magnitudes at the precomputed
%   locations.
%   c(x) = r(x) + e(x)
    global recievedword;
    corrected = recievedword;
    for i = 1 : length(err_locs)
        location = err_locs(i);
        magnitude = err_magn(i);
        
        if corrected(location+1) == -1
            corrected(location+1) = magnitude;
        else
            now = corrected(location+1);
            new = sum_gf(now, magnitude);
            corrected(location+1) = new;
        end
    end
end

