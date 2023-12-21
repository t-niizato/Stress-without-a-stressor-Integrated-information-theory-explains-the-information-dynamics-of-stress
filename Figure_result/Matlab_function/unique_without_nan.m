function [y] = unique_without_nan(x)
  y = unique(x);
  if any(isnan(y))
    y(isnan(y)) = []; % remove all nans
  end

end