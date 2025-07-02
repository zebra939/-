function dist = gf_dis(a, b)
    % 二进制表示差异计算
    a_bin = de2bi(double(a.x), 3, 'left-msb');
    b_bin = de2bi(double(b.x), 3, 'left-msb');
    dist = sum(a_bin ~= b_bin, 'all');
end