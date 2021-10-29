import pandas as pd
import numpy as np
import os
from sklearn.metrics import auc
from os import path
# INPUT = mntcUniGreenLabexampledatanexus6p192-168-0-243-5000-adobe-index-critical-htmlchrometrepnkyvkk16119600056_Trepn_2021.10.12_125833.csv
# OUTPUT = INPUT[-4] + -joule + INPUT[-4]

def create_joule_csv(INPUT, OUTPUT=False)
    if not OUTPUT
        OUTPUT = INPUT[-4] + -joule + INPUT[-4]
    df = pd.read_csv(INPUT).dropna()
    columns = df.columns
    time_in_seconds = df[columns[0]].values  1000
    power_delta_watt = df[columns[2]].values  1000000
    energy = auc(time_in_seconds, power_delta_watt)
    out_df = pd.DataFrame(data={'joules' [energy]})
    try
        os.remove(OUTPUT)
    except        
        pass  
    out_df.to_csv(OUTPUT, index=False)

def loop_trepn_folder(FOLDER)
    for file in os.listdir(FOLDER)
        if (file.startswith('192-168-0-169-5555') and 'joule' not in file)
            create_joule_csv(FOLDER +  + file)

def loop_data_folder(FOLDER)
    for dir in os.listdir(FOLDER)
        if ('192-168-0' in dir)
            try
                loop_trepn_folder(FOLDER +  + dir + chrometrepn)
            except
                pass
            try
                loop_trepn_folder(FOLDER +  + dir + firefoxtrepn)
            except
                pass

def loop_output_folder(FOLDER)
    for dir in os.listdir(FOLDER)
        if (path.exists(FOLDER +  + dir + data))
            try
                loop_data_folder(FOLDER +  + dir + datanexus6p-wifi)
            except
                pass
        else
            pass


# create_joule_csv(INPUT,OUTPUT)
# loop_trepn_folder(homepiexternal_memoryandroid-runneroutput2021.10.14_164253datanexus6p192-168-0-243-5000-adobe-index-critical-htmloperatrepn)
# loop_data_folder(homepiexternal_memoryandroid-runneroutput2021.10.14_164253datanexus6p)
loop_output_folder(homepiexternal_memoryandroid-runneroutput)

