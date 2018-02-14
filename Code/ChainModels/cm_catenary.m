function gridded = cm_catenary(gridded,cfg)

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
gridded.info.catenary_param = nan*gridded.dn;
nprog = 50;
disp(repmat('.',1,nprog))
for i = 1:length(gridded.dn)
    if mod(i,floor(length(gridded.dn)/nprog))==0
        fprintf('.')
    end
    % Compute the catenary parameter that minimizes the difference between true
    % depth and catenary-computed depth as a function of along-chain position.
    hasp = ~isnan(gridded.p(:,i));
    z = gridded.p(hasp,i);
    l = gridded.pos(hasp);
    minfunc =@(k) z - l2z(l,k);
    k = lsqnonlin(minfunc,k,0.1,100,opts); % use previous solution as initial guess
    gridded.z(:,i) = -l2z(gridded.pos,k);
    gridded.x(:,i) = -z2x(gridded.z(:,i),k);
    gridded.info.catenary_param(i) = k;
end
gridded.x = gridded.x - repmat(gridded.x(1,:),size(gridded.x,1),1);
fprintf('\nDone!\n')
