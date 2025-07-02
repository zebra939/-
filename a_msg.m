function all_comb = a_msg()
    [X, Y, Z] = meshgrid(0:7, 0:7, 0:7);
    all_comb = [X(:) Y(:) Z(:)];
end