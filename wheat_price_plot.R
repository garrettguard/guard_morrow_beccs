# DOCUMENTATION
# The R commands in this file will take the output from a "prices of all markets" query from rgcam
# and plot the percent change in wheat prices by region from 2010 to a specific year for a specific scenario.
# You can adjust the scenario name and the year by changing the variables on lines 30 and 31.

# Load required libraries
library(dplyr)
library(ggplot2)
library(gcammaptools)

############### BE SURE TO SET THE PROJECT VARIABLE (e.g., SSP1) ON THE NEXT LINE #########################
prices <- getQuery(SSP1, 'prices of all markets')
############### DID YOU SET THE PROJECT VARIABLE ON THE PREVIOUS LINE? ####################################

# Filter the results down to price for regional wheat after 2005 and break up the market column into region and good columns
wheat <- prices  %>% filter(grepl('regional wheat', market))   %>% filter(year > 2005)  %>% separate(market, c("region", "good"), -14)

# Remove the full prices query, since we don't need it anymore
remove(prices)

# Define a function to calculate the percent change
calcChange <- function(x) (x/first(x) - 1) * 100

# Spread the data into a "wide" with a column for each region, convert prices to percent changes from 2010, and then pivot back into a "long" tibble
wheat <- wheat %>% spread(region, value) %>% mutate_if(names(.) == 'year', as.integer) %>% mutate_if(is.double, calcChange) %>% pivot_longer(Africa_Eastern:USA) %>% rename(region=name)  

# Add the numeric region IDs for gcammaptools to use; ignore the warning message
wheat <- add_region_ID(wheat) 

# Construct the map plot
############### BE SURE TO SET THE VARIABLES BELOW TO GET THE MAP YOU WANT! ###############################
scenario_name <- "SSP5_RCP_1p9_"           # SET THE SCENARIO NAME HERE ###################################
comparison_year <- 2100                    # SET THE YEAR HERE ############################################
lower_limit <- -50                         # SET THE LOWEST VALUE THAT CAN BE PLOTTED #####################
upper_limit <- 600                         # SET THE HIGHEST VALUE THAT CAN BE PLOTTED ####################
############### ARE YOU SURE YOU'RE MAPPING THE SCENARIO AND YEAR THAT YOU WANT? ##########################
wheat_plot <- plot_GCAM(map.rgn32, col='value', gcam_df=subset(wheat, (scenario==scenario_name & year==comparison_year)), title='Percent Change in Wheat Prices', legend=TRUE) + scale_fill_gradient2(low='blue', mid='white', high='red', midpoint=0, limits=c(lower_limit, upper_limit), breaks=c(0, 200, 400, 600))

# Show the plot
wheat_plot

# When you're satisfied with your graph, uncomment and run the following lines to automatically create separate image files for every scenario for each selected year. 
#scenarios <- listScenarios(prj) # BE SURE TO REPLACE prj WITH THE PROJECT VARIABLE NAME (e.g., SSP1) #####################################
#years <- c(2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090, 2100)
#for (scenario_name in scenarios) {
# for (yr in years) {
#    plot_GCAM(map.rgn32, col='value', gcam_df=subset(wheat, (scenario==scenario_name & year==yr)), title=yr, legend=TRUE) + scale_fill_gradient2(low='blue', mid='white', high='red', midpoint=0, limits=c(lower_limit, upper_limit), breaks=c(0, 200, 400, 600))
#    ggsave(paste(scenario_name,'_',yr,'.jpg',sep=''), width=3, height=2, device='jpg')
#  }
#}

# IF YOU WANT TO SAVE THE VARIABLES AS DISTINCT VARIABLES FOR DIFFERENT SSPs, UNCOMMENT THE FOLLOWING LINES AND SET THE VARIABLES NAMES
# SSP1_wheat <- wheat
# SSP1_wheat_plot <- wheat_plot

