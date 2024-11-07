%-----------------------------------------------------------------------
% Script to preprocess LGNW data
% spm SPM - SPM12 (7771)
% Brennan Terhune-Cotter, 2024
%-----------------------------------------------------------------------

% Initialize SPM and configuration of SPM batch job manager
spm('defaults', 'FMRI');
spm_jobman('initcfg');

% array of subjects (null to prevent the last subject from being run twice, which has been an issue)
subjects = [...
    "d1" "d2" "d3" "d4" "d5" "d6" "d7" "d8" "d9" "d10" "d11" "d12" "d13" "d14" ...
    "d15" "d16" "d17" "d18" "d19" "d20" "d21" "d22" "d23" "d24" "d25" "d26" "d27" "d28" ...
    "h1" "h2" "h3" "h4" "h5" "h6" "h7" "h8" "h9" "h10" "h11" "h12" "h13" "h14" "NULL"];

for i = 1:numel(subjects)

    subject = subjects(i);
    subject_cell = {char(subject)}; % convert to cell array of character vectors

    disp(subject);
    % Step 1: Select runs and remove first 4 dummy volumes
    matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'funcRuns';
        matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
            {['/Volumes/BTCruiser/READ/data/' subject_cell{1} '/orig/processed/' subject_cell{1} '_fs1.nii']}
            {['/Volumes/BTCruiser/READ/data/' subject_cell{1} '/orig/processed/' subject_cell{1} '_fs2.nii']}
            {['/Volumes/BTCruiser/READ/data/' subject_cell{1} '/orig/processed/' subject_cell{1} '_print1.nii']}
            {['/Volumes/BTCruiser/READ/data/' subject_cell{1} '/orig/processed/' subject_cell{1} '_print2.nii']}
        };
    for sess = 1:4  % For each of 4 sessions, remove the first 4 dummy volumes
        V = spm_vol(char(matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files{sess}));
        num_vols = length(V);
        new_file = V(5:num_vols);  % Skip first 4 volumes
        
        % Get the filename and path
        [filepath, filename, ext] = fileparts(V(1).fname);
        new_filename = fullfile(filepath, ['t' filename ext]);
        
        % Copy header info for remaining volumes to new file
        spm_file_merge(char({V(5:end).fname}), new_filename);
        
        % Update the file list for subsequent processing
        matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files{sess} = {new_filename};
    end
    % Step 2: Realign functional images with each other. (prefix = r*)
    matlabbatch{2}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Named File Selector: funcRuns(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
    matlabbatch{2}.spm.spatial.realign.estwrite.data{2}(1) = cfg_dep('Named File Selector: funcRuns(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
    matlabbatch{2}.spm.spatial.realign.estwrite.data{3}(1) = cfg_dep('Named File Selector: funcRuns(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
    matlabbatch{2}.spm.spatial.realign.estwrite.data{4}(1) = cfg_dep('Named File Selector: funcRuns(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.sep = 4;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.rtm = 1; % realign to mean
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.interp = 2;
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
    matlabbatch{2}.spm.spatial.realign.estwrite.eoptions.weight = '';
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.which = [2 1];
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.interp = 4;
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.mask = 1;
    matlabbatch{2}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
    % Outputs of realignment:
        % r*.nii: realigned functional images
        % rp*.txt: realignment parameters
        % mean*.nii: mean image of realigned functional images

    % SLICE-TIME CORRECTION OF IMAGES NOT NEEDED as they were already corrected prior to creating .nii files -----------
    %matlabbatch{3}.spm.temporal.st.scans{1}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
    %matlabbatch{3}.spm.temporal.st.scans{2}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
    %matlabbatch{3}.spm.temporal.st.scans{3}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
    %matlabbatch{3}.spm.temporal.st.scans{4}(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
    %matlabbatch{3}.spm.temporal.st.nslices = 40;
    %matlabbatch{3}.spm.temporal.st.tr = 2;
    %matlabbatch{3}.spm.temporal.st.ta = 1.95;
    %matlabbatch{3}.spm.temporal.st.so = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40];
    %matlabbatch{3}.spm.temporal.st.refslice = 1;
    %matlabbatch{3}.spm.temporal.st.prefix = 'a';
    % ------------------------------------------------------------------------------------------------------------------
    
    % Step 3: Coregister anatomical image to realigned functional images. 
    matlabbatch{3}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
    matlabbatch{3}.spm.spatial.coreg.estwrite.source = {['/Volumes/BTCruiser/READ/data/' subject_cell{1} '/orig/processed/' subject_cell{1} '_anat.nii,1']};
    matlabbatch{3}.spm.spatial.coreg.estwrite.other = {''};
    matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
    matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
    matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
    matlabbatch{3}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
    matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.interp = 4;
    matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
    matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.mask = 0;
    matlabbatch{3}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';

    % Outputs of coregistration:
        % c*.nii: coregistered anatomical image
        % manat.nii: coregistered anatomical image at full resolution?
    
    % Check results:
        % SPM GUI -> Check Reg -> select a func volume for 1st image -> select the coregistered anat image for 2nd image
        % Check that the outlines of the brains and internal structures are aligned
    
    % Step 4: Segment the anatomical image into tissue priors.
        % TPM images are SPM's tissue priors, in this order:
        % 1 - GM; 2 - WM; 3 - CSF; 4 - soft tissue; 5 - bone; 6 - other
    matlabbatch{4}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Coregister: Estimate & Reslice: Coregistered Images', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
    matlabbatch{4}.spm.spatial.preproc.channel.biasreg = 0.001;
    matlabbatch{4}.spm.spatial.preproc.channel.biasfwhm = 60;
    matlabbatch{4}.spm.spatial.preproc.channel.write = [0 1];
    matlabbatch{4}.spm.spatial.preproc.tissue(1).tpm = {'/Users/bterhunecotter/Documents/MATLAB/spm12/tpm/TPM.nii,1'};
    matlabbatch{4}.spm.spatial.preproc.tissue(1).ngaus = 1;
    matlabbatch{4}.spm.spatial.preproc.tissue(1).native = [1 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(1).warped = [0 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(2).tpm = {'/Users/bterhunecotter/Documents/MATLAB/spm12/tpm/TPM.nii,2'};
    matlabbatch{4}.spm.spatial.preproc.tissue(2).ngaus = 1;
    matlabbatch{4}.spm.spatial.preproc.tissue(2).native = [1 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(2).warped = [0 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(3).tpm = {'/Users/bterhunecotter/Documents/MATLAB/spm12/tpm/TPM.nii,3'};
    matlabbatch{4}.spm.spatial.preproc.tissue(3).ngaus = 2;
    matlabbatch{4}.spm.spatial.preproc.tissue(3).native = [1 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(3).warped = [0 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(4).tpm = {'/Users/bterhunecotter/Documents/MATLAB/spm12/tpm/TPM.nii,4'};
    matlabbatch{4}.spm.spatial.preproc.tissue(4).ngaus = 3;
    matlabbatch{4}.spm.spatial.preproc.tissue(4).native = [1 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(4).warped = [0 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(5).tpm = {'/Users/bterhunecotter/Documents/MATLAB/spm12/tpm/TPM.nii,5'};
    matlabbatch{4}.spm.spatial.preproc.tissue(5).ngaus = 4;
    matlabbatch{4}.spm.spatial.preproc.tissue(5).native = [1 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(5).warped = [0 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(6).tpm = {'/Users/bterhunecotter/Documents/MATLAB/spm12/tpm/TPM.nii,6'};
    matlabbatch{4}.spm.spatial.preproc.tissue(6).ngaus = 2;
    matlabbatch{4}.spm.spatial.preproc.tissue(6).native = [0 0];
    matlabbatch{4}.spm.spatial.preproc.tissue(6).warped = [0 0];
    matlabbatch{4}.spm.spatial.preproc.warp.mrf = 1;
    matlabbatch{4}.spm.spatial.preproc.warp.cleanup = 1;
    matlabbatch{4}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{4}.spm.spatial.preproc.warp.affreg = 'mni';
    matlabbatch{4}.spm.spatial.preproc.warp.fwhm = 0;
    matlabbatch{4}.spm.spatial.preproc.warp.samp = 3;
    matlabbatch{4}.spm.spatial.preproc.warp.write = [0 1];
    matlabbatch{4}.spm.spatial.preproc.warp.vox = NaN;
    matlabbatch{4}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                                NaN NaN NaN];
    
    % Outputs of coregistration & segmentation:
        % y_anat.nii: deformation field
        % c1anat.nii: GM
        % c2anat.nii: WM
        % c3anat.nii: CSF
        % c4anat.nii: soft tissue
        % c5anat.nii: bone
    
    % Step 5: Normalize functional images (prefix n*) to MNI space using deformation field from segmentation.
    matlabbatch{5}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
    % Use resliced images instead of slice-timing corrected images, as we no longer do slice-timing correction (see above)
    %matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
    %matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 2)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{2}, '.','files'));
    %matlabbatch{6}.spm.spatial.normalise.write.subj.resample(3) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 3)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{3}, '.','files'));
    %matlabbatch{6}.spm.spatial.normalise.write.subj.resample(4) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 4)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{4}, '.','files'));
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 1)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rfiles'));
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 2)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','rfiles'));
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(3) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 3)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','rfiles'));
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample(4) = cfg_dep('Realign: Estimate & Reslice: Resliced Images (Sess 4)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','rfiles'));
    matlabbatch{5}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                            78 76 85];
    matlabbatch{5}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
    matlabbatch{5}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{5}.spm.spatial.normalise.write.woptions.prefix = 'w';
    % Outputs of normalization:
        % n*.nii: normalized functional images (normalized to template)
    
    % Check results:
        % SPM GUI -> Check Reg -> select normalized volume for 1st image -> for 2nd image, select T1 in spm12/canonical. 
        % Check that the outlines of the brains and internal structures are aligned.

    % Step 6: Smooth normalized images (prefix s*)
    matlabbatch{6}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
    matlabbatch{6}.spm.spatial.smooth.fwhm = [7 7 7]; % 7mm FWHM smoothing kernel per the 2015 paper
    matlabbatch{6}.spm.spatial.smooth.dtype = 0;
    matlabbatch{6}.spm.spatial.smooth.im = 0;
    matlabbatch{6}.spm.spatial.smooth.prefix = 's7';

    % Once matlabbatch is fully configured for the current subject, run it
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);

    % Clear matlabbatch for the next iteration
    clear matlabbatch;

end