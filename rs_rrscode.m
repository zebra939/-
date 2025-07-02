function decoded_msg = rs_rrscode(in_msg, all_code_msg, all_msg)
    % 预计算距离矩阵
    distances = zeros(1, 512);
    for i = 1:512
        distances(i) = rscode_dis(in_msg, all_code_msg(i, :));
    end
    
    % 找到最小距离索引
    [~, min_idx] = min(distances);
    
    % 返回对应消息
    decoded_msg = all_msg(min_idx, :);
end