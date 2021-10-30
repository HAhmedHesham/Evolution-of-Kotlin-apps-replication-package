### Calc_joule.py
Is used to aggregate the output files of the energy measurement experiments. Last line in the script that calls the loop_outer_folder should be the output folder of Android-runner containing all experiment output folders.

#### Usage
```
  python3 calc_joule.py
```

### data_parser.py
Is used to aggregate the output files into a single csv file. Empty strings at the start of the file should be filled with relative path to measurements `../output/` folder, the experiment id, and the subfolder the actual measurements reside in (e.g. in our case `/data/nexus6p-wifi`). The output_folder_relative_path specifies where the final csv file should be placed. Should be run *after* Calc_joule.py, since it uses those joule aggregates in the parser.

#### Usage
```
  python3 data_parser.py
```
