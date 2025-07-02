function count = same(msg1, msg2)
    count = sum(msg1 == msg2, 'all');
end