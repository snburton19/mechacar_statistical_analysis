### Module 16 Challenge

## Deliverable 1: Linear Regression to Predict MPG
# 3. Use the library() function to load the dyplyr package.
library(dplyr)

# 4. Import and read in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mecha_mpg <- read.csv(file="resources/MechaCar_mpg.csv")

# 5. Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e. columns), and add the dataframe you created in Step 4 as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

# 6. Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg))


## Deliverable 2: Create Visualizations for the Trip Analysis
# 2. Import and read in the Suspension_Coil.csv file as a table.
suspension_coil <- read.csv(file="resources/Suspension_Coil.csv")

# 3. Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column.
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

# 4. Create a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column.
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")


## Deliverable 3: T-Tests on Suspension Coils
# 1. Use the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(suspension_coil$PSI, mu=1500)

# 2. Use the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
# Lot 1
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)

# Lot 2
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)

# Lot 3
t.test(subset(suspension_coil, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)
