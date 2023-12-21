function [delay] = find_opt_tau(data, param, options)
%   dataset, param, options: phi_dalay
    delay = zeros(1, 250);
    for i = 1 : 250
        param.tau = i;
        [~, phi_MIP]  = MIP_search(data, param, options);
        delay(i) = phi_MIP;
    end
end

