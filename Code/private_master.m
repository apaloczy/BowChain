% Process all InnerShelf deployments and save .mat files locally
clear all, close all
overwrite = false;
for i = 1:10
    dep = sprintf('deployment%d',i);
    f_out = sprintf('../private/Data/innerShelf/innerShelf_d%d.mat',i);
    if overwrite || ~exist(f_out,'file')
        gridded = BowChain_master('InnerShelf',dep);
        save(f_out,'-struct','gridded')
        disp(['Saved ' f_out])
    else
        disp([f_out ' already exists, skipping.'])
    end
end
