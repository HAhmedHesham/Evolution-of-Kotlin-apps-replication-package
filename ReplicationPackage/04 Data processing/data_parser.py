import os

import numpy as np
import pandas as pd

measurements_folder_relative_path = ''
experiment_id = ''
data_subfolder = ''

output_folder_relative_path = ''

browsers = ['chrome', 'firefox']

columns = ['site', 'crit', 'browser', 'i', 'lt', 'fp', 'fcp', 'e']

result = pd.DataFrame(columns=columns)

# This is the list of measurement folders we get, for each site
folders = os.listdir(measurements_folder_relative_path + experiment_id + data_subfolder)
for i, folder in enumerate(folders):
    site = folder.split('-')[5]
    critical = 1 if folder.count('critical') > 0 else 0

    for j, browser in enumerate(browsers):
        wdr = measurements_folder_relative_path + experiment_id + data_subfolder + folder + '/' + browser + '/'

        perfume_csvs = os.listdir(wdr + 'perfume_js')
        trepn_csvs = os.listdir(wdr + 'trepn')
        trepn_csvs = [x for x in trepn_csvs if 'joule' in x]

        num_trials = len(perfume_csvs) // 3

        for k in range(num_trials):
            result.loc[f'{i}_{j}_{k}', ['site', 'crit', 'browser', 'i']] = [site, critical, browser, k]

        for k, perfume_csv in enumerate(sorted(perfume_csvs)):
            iteration = k % num_trials
            var = perfume_csv.split('_')[0]
            var = 'lt' if var == 'loadTime' else var

            value = pd.read_csv(wdr + 'perfume_js/' + perfume_csv).iloc[0, 0]
            # Tmp because loadtime is wrong
            if type(value) == str:
                value = value.split('}')[0]
            result.loc[f'{i}_{j}_{iteration}', var] = value

        for k, trepn_csv in enumerate(trepn_csvs):
            value = pd.read_csv(wdr + 'trepn/' + trepn_csv).iloc[0, 0]
            result.loc[f'{i}_{j}_{k}', 'e'] = value

result.to_csv(f'{output_folder_relative_path}/parsed_{experiment_id}.csv')
