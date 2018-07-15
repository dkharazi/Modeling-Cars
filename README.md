## Overview

The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). For more details about the data, refer to the [R documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html).

In this analysis, we want to better understand the relationship between the given set of variables and miles per gallon. We also want to be able to answer a set of more specific questions, such as the following:

  1. Is an automatic or manual transmission better for MPG.
  2. Quantify the MPG difference between automatic and manual transmissions.
  
Research has shown that there is a correlation between a car's type of transmission and its fuel consumption. A simple linear regression model comparing the am (transmission) with the mpg (miles/gallon) demonstrates an increase of 7.25 miles per gallon for cars with a manual transmission, in comparison to cars with an automatic transmission. However, the inclusion of additional variables in the model can help us understand the reason for this difference in means. For example, automatic cars are heavier than manual cars in our dataset, which could possibly make them less efficient. Additionally, automatic cars tend to have a faster quarter mile time, which could imply that they have more horsepower, as well. A simple linear regression model that includes a car's transmission type, quarter mile time, and weight seems to performs well initially, but we should review the residual diagnostics to make sure.

## Variable Descriptions

- `mpg:` The miles per gallon (US) of a car.
- `cyl:` The number of cylinders of a car.
- `disp:` The	displacement (cu.in.) of a car.
- `hp:` The	gross horsepower of a car.
- `drat:`	The rear axle ratio of a car.
- `wt:` The weight (1000 lbs) of a car.
- `qsec:` The	1/4 mile time of a car.
- `vs:`	The engine (0 = V-shaped, 1 = straight) of a car.
- `am:` The	transmission (0 = automatic, 1 = manual) of a car.
- `gear:`	The number of forward gears of a car.
- `carb:`	The number of carburetors of a car.
