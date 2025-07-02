function decoded_msg = rs_interpret(received_codeword, all_codewords, all_messages)
    % RS_INTERPRET - 基于最小距离准则的RS码译码器
    %
    % 输入:
    %   received_codeword: 接收到的码字 (1x7 gf对象)
    %   all_codewords: 所有可能的正确码字 (Nx7 gf数组)
    %   all_messages: 对应的原始消息 (Nx3 数组)
    %
    % 输出:
    %   decoded_msg: 译码后的消息 (1x3 数组)
    
    % 验证输入参数
    validate_inputs(received_codeword, all_codewords, all_messages);
    
    % 获取码本大小
    num_codewords = size(all_codewords, 1);
    
    % 预分配距离数组
    distances = zeros(num_codewords, 1);
    
    % 计算与所有码字的距离
    for idx = 1:num_codewords
        distances(idx) = rscode_dis(received_codeword, all_codewords(idx, :));
    end
    
    % 找到最小距离的索引
    [min_distance, min_idx] = min(distances);
    
    % 检查是否有多个最小距离（模糊情况）
    min_indices = find(distances == min_distance);
    if numel(min_indices) > 1
        warning('rs_interpret:AmbiguousDecoding', ...
                '多个候选消息 (%d) 具有相同距离 %d', ...
                numel(min_indices), min_distance);
    end
    
    % 返回第一个最小距离对应的消息
    decoded_msg = all_messages(min_indices(1), :);
end

% 辅助函数：输入验证
function validate_inputs(rcv_cw, all_cws, all_msgs)
    if ~isa(rcv_cw, 'gf')
        error('rs_interpret:InvalidInput', '接收码字必须是gf对象');
    end
    
    if size(all_cws, 1) ~= size(all_msgs, 1)
        error('rs_interpret:SizeMismatch', ...
              '码字和消息数组的行数不一致');
    end
    
    if size(rcv_cw, 2) ~= size(all_cws, 2)
        error('rs_interpret:DimensionMismatch', ...
              '接收码字与码本维度不一致');
    end
end