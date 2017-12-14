function grid = cm_catenary(grid,cfg)

% A catenary chain hanging from a ship has the form x(z) = k*cosh(z/k)
% We want to solve for the k parameter and compute all sensor z positions using:
% - l: sensor distances (arclengths) along chain (known)
% - z: sensor z-positions (partially known via pressure)
% - x: Unknown sensor x-positions (unknown)

% l, x, and z are all related via the following formulas:
z2x = @(z,k) k*cosh(z/k);  % compute horizontal position using vertical position (catenary equation)
l2z = @(l,k) k*asinh(l/k); % compute arclength using vertical position
z2l = @(z,k) k*sinh(z/k);  % compute vertical position using arclength

% For each timestep...
opts = optimset('display','off'); % to reduce the verbosity of lsqnonlin

disp('Computing catenary chain shapes. This may take some time.')
k = 0.1; % initial guess
grid.info.catenary_param = nan*grid.dn;
for i = 1:length(grid.dn)
    if mod(i,floor(length(grid.dn)/50))==0
        fprintf('.')
    end
    % Compute the catenary parameter that minimizes the difference between true
    % depth and catenary-computed depth as a function of along-chain position.
    hasp = ~isnan(grid.p(:,i));
    z = grid.p(hasp,i);
    l = grid.pos(hasp);
    minfunc =@(k) z - l2z(l,k);
    k = lsqnonlin(minfunc,k,0.1,100,opts); % use previous solution as initial guess
    grid.z(:,i) = -l2z(grid.pos,k);
    grid.x(:,i) = -z2x(grid.z(:,i),k);
    grid.info.catenary_param(i) = k;
end
grid.x = grid.x - repmat(grid.x(1,:),size(grid.x,1),1);
fprintf('\nDone!\n')
