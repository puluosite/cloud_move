function [ diff ] = MAD( seg, pixel_n, position, num)
%MAD Summary of this function goes here
%   Detailed explanation goes here
% position.segr
% position.segc
% position.dx
% position.dy
orig_row = (position.segr-1)*num+1;
orig_col = (position.segc-1)*num+1;

comp_row = orig_row + position.dx;
comp_col = orig_col + position.dy;

com_seg = pixel_n((comp_row:comp_row+num-1),(comp_col:comp_col+num-1));

real_seg = int16(seg);
real_com_seg = int16(com_seg);

msqr = true;
if (msqr == true)
    temp_matrix = abs(real_seg - real_com_seg);
    temp_matrix = temp_matrix.^2;
    % normalize the sum
    % value = sum(pix_diff^2)/Num_pix
    diff.value = sum(sum(temp_matrix))/(num*num);
    
else
    diff.value = sum(sum(abs(real_seg - real_com_seg)));
end

diff.row = position.dx;
diff.col = position.dy;

end

