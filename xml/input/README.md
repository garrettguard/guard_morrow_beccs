# Input files used to exclude BECCS or Fossil CCS from GCAM 5.2

These XML input files for GCAM v5.2 were used to create scenarios that selectively exclude BECCS or fossil fuel CCS. To use these files, place them in the `/input/gcamdata/xml` folder of your GCAM installation. See the sample configuration files in this repository to see how to configure a scenario that uses these files.

The purpose of each file is briefly summarized in the table below. **IMPORTANT:** The `no_ff_ccs.xml` and `no_beccs.xml` files will only work if the first seven files are included as ScenarioComponents as well.

Note that if you just want to exclude _all_ CCS from a scenario, you do not need to include any of these files. You can simply include the `high_cost_ccs.xml` file that comes with GCAM 5.2, which will set the cost of carbon storage so high that CCS will never be used. 

File Name | Purpose
----------|--------
`en_transformation_separate_bio.xml` | Excludes bioenergy inputs from the default energy transformation sectors after the end of the calibration period. (Note: the final calibration period in GCAM 5.2 is 2010.) 
`en_transformation_biogas.xml` | Create a parallel set of energy transformation supply sectors for biogas.
`en_transformation_bioliquids.xml` | Create a parallel set of energy transformation supply sectors for bioliquids.
`en_distribution_biogas.xml` | Create a parallel set of energy distribution supply sectors for biogas.
`en_distribution_bioliquids.xml` | Create a parallel set of energy distribution supply sectors for bioliquids.
`industry_bioenergy.xml` | Enable the industrial sectors to use both conventional gas and liquids or biogas and bioliquids as inputs.
`electricity_water_bioenergy.xml` | Enable the gas and refined liquids subsectors of the electricity sector to use both conventional gas/liquids or biogas/bioliquids as inputs.
`no_ff_ccs.xml` | Delete/disable technologies that use CCS to capture emissions from fossil fuels, as well as disabling CCS on cement process emissions. **Including this file as a ScenarioComponent will disable all fossil fuel CCS.**
`no_ff_ccs.xml` | Delete/disable technologies that use CCS to capture emissions from biofuels, as well as disabling CCS on cement process emissions. **Including this file as a ScenarioComponent will disable all BECCS (bioenergy with CCS).**


