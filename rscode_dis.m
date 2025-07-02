function dist = rscode_dis(code1, code2)
    dist = 0;
    for i = 1:7
        dist = dist + gf_dis(code1(i), code2(i));
    end
end