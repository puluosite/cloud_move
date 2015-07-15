function [ opt_index ] = findOptPosHex( value )
%FINDOPTPOSHEX Summary of this function goes here
%   Detailed explanation goes here

[m ,n] = size(value);
assert( (m == 1) && (n >= 1) );

possible_opt = find(value == min(value));

[m_p, n_p] = size(possible_opt);

if (n_p == 1)
    opt_index = possible_opt;
else
    % multiple minimum opts, find the one closest to the center
    % the center position is 1
    
    for i = 1: m_p
        dist(i) = abs(possible_opt(i) - 1);
    end
    
    opt_index = find(dist == min(dist));
end


end

