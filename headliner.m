% Headliner script to run other scripts

% Run first script
run('0_preprocessing/LGNW_preprocess_r_c_s_n_s7.m');

% Run second script
run('1_univariate_indiv/LGNW_firstlevel_jobs_call.m');