# Sample Configuration Files

These GCAM configuration files provide templates for running scenarios that exclude BECCS and/or fossil fuel CCS from each of the five Shared Socioeconomic Pathways (SSPs).

If you have copied the files from the [xml/input/](../../input) folder of this repository into the `/input/gcamdata/xml` files of your GCAM installation, the configuration files in this folder will run scenarios that (1) use the GCAM quantification of the SSP identified in the file name, (2) use target finder to set a radiative forcing target of 2.6 W/m2, and (3) exclude either BECCS or fossil CCS from your scenario, as specified in the file name. Note that GCAM 5.2 will be unable to solve for such a deep decarbonization scenario in SSP3 or SSP4 given these particular inputs.

To use a different forcing target, simply change the file name of the `policy-target-file` on line 6 of the configuration file.

**IMPORTANT:** These configuration files are set to output results to separate databases for each SSP (e.g., `database_SSP5`). If you wish to output all results to a single database, change the `xmldb-location` on line 8 of each configuration file. To output results to GCAM's default database, set that value to `../output/database_basexdb`

To use these files in GCAM, you will need to either rename them `configuration.xml` or pass the name of the configuration file to GCAM (e.g., by editing the `run-gcam.bat` file in the `/exe` folder of your GCAM installation).  
