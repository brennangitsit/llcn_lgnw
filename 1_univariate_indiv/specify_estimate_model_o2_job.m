% Function to specify the model for the first level analysis
function specify_estimate_model_o2_job(subject)

disp(['Processing subject ' subject]);
    
% Step 1: Choose files
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 's4war_runs';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/s4war' subject '_print1.nii']}
                                                                     {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/s4war' subject '_print2.nii']}
                                                                     {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/s4war' subject '_fs1.nii']}
                                                                     {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/s4war' subject '_fs2.nii']}
                                                                     }';

% Step 2: Specify first-level model
matlabbatch{2}.spm.stats.fmri_spec.dir = {['/Volumes/BTShack/LGNW/data/' subject '/stats/uni_4fwhm']};
matlabbatch{2}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{2}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{2}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{2}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('Named File Selector: rd_runs(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).name = 'semFS';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).onset = [190
                                                            392];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).name = 'semASL';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).onset = [72
                                                            240];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).name = 'phon';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).onset = [38
                                                            122
                                                            274
                                                            426];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).name = 'ff';
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).onset = [4
                                                            156
                                                            308
                                                            358];
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(1).multi_reg = {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/rp_' subject '_print1.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('Named File Selector: rd_runs(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).name = 'semFS';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).onset = [156
                                                            358];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).name = 'semASL';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).onset = [72
                                                            274];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).name = 'phon';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).onset = [4
                                                            122
                                                            308
                                                            426];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).name = 'ff';
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).onset = [38
                                                            190
                                                            240
                                                            392];
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(2).multi_reg = {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/rp_' subject '_print2.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('Named File Selector: rd_runs(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).name = 'asl';
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).onset = [30
                                                            166
                                                            212
                                                            348
                                                            424];
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).name = 'fs';
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).onset = [0
                                                            106
                                                            242
                                                            378
                                                            484];
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).name = 'still';
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).onset = [60
                                                            136
                                                            272
                                                            318
                                                            454];
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(3).multi_reg = {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/rp_' subject '_fs1.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('Named File Selector: rd_runs(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).name = 'asl';
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).onset = [30
                                                            166
                                                            212
                                                            348
                                                            484];
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).name = 'fs';
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).onset = [60
                                                            106
                                                            242
                                                            318
                                                            453];
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).name = 'still';
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).onset = [0
                                                            136
                                                            272
                                                            378
                                                            424];
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).duration = 30;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).tmod = 0;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).cond(3).orth = 1;
matlabbatch{2}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{2}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{2}.spm.stats.fmri_spec.sess(4).multi_reg = {['/Volumes/BTShack/LGNW/data/' subject '/orig/processed/rp_' subject '_fs2.txt']};
matlabbatch{2}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{2}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{2}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{2}.spm.stats.fmri_spec.volt = 1;
matlabbatch{2}.spm.stats.fmri_spec.global = 'Scaling'; % 'None' for no global mean scaling
matlabbatch{2}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{2}.spm.stats.fmri_spec.mask = {''};
matlabbatch{2}.spm.stats.fmri_spec.cvi = 'AR(1)';

% Step 3: Estimate the model
matlabbatch{3}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{3}.spm.stats.fmri_est.method.Classical = 1;

% Step 4: Specify contrasts
matlabbatch{4}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.' ,'val', '{}',{2}, '.' ,'val', '{}',{1}, '.' ,'val', '{}',{1}), substruct('.' ,'spmmat'));
matlabbatch{4}.spm.stats.con.consess{1}.tcon.name = 'asl-still';
matlabbatch{4}.spm.stats.con.consess{1}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -1 0 0 0 0 0 0 1 0 -1 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{2}.tcon.name = 'fs-still';
matlabbatch{4}.spm.stats.con.consess{2}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{3}.tcon.name = 'asl-fs';
matlabbatch{4}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{4}.tcon.name = 'fs-asl';
matlabbatch{4}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 1 0 0 0 0 0 0 0 -1 1 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{5}.tcon.name = 'sem-phon';
matlabbatch{4}.spm.stats.con.consess{5}.tcon.weights = [-1 0 0 0 0 0 0 0 0.5 0.5 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{5}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{6}.tcon.name = 'phon-sem';
matlabbatch{4}.spm.stats.con.consess{6}.tcon.weights = [1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{6}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{7}.tcon.name = 'sem-ff';
matlabbatch{4}.spm.stats.con.consess{7}.tcon.weights = [0 -1 0 0 0 0 0 0 0.5 0.5 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{7}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{8}.tcon.name = 'phon-ff';
matlabbatch{4}.spm.stats.con.consess{8}.tcon.weights = [1 -1 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{8}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{9}.tcon.name = 'semASL-semFS';
matlabbatch{4}.spm.stats.con.consess{9}.tcon.weights = [0 0 0 0 0 0 0 0 -1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{9}.tcon.sessrep = 'none';
matlabbatch{4}.spm.stats.con.consess{10}.tcon.name = 'semFS-semASL';
matlabbatch{4}.spm.stats.con.consess{10}.tcon.weights = [0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
matlabbatch{4}.spm.stats.con.consess{10}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;

% Run the job for this subject
spm_jobman('run', matlabbatch);

% Clear matlabbatch to prevent issues in the next iteration
clear matlabbatch;

end