function code = rs_rscode(msg)
    % 系统码生成矩阵 (3×7)
    g_matrix = [1 3 1 2 1 0 0; 
                0 1 3 1 2 1 0; 
                0 0 1 3 1 2 1]; % 完整系统码矩阵
    
    g = gf(g_matrix, 3); % GF(2^3)域
    code = msg * g;      % 矩阵乘法编码
end