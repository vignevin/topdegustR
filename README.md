# topdegustR

Basic functions to access [TopDegust](https://topdegust.trydea.fr/app) API from R. 
This R package was developped as part of the VITIS DATA CROP project 2021-2023 (France), with the support of the French Ministry of Agriculture and Food, and the financial contribution of the special allocation account for agricultural and rural development (CASDAR). The responsability of the French Ministry of Agriculture and Food cannot be engaged.

## Installation

To install the latest version of topdegustR

```         
library(remotes)
install_github("vignevin/topdegustR")
```

## Example of use

```         
library(topdegustR)

## token given by administrator

# to load all tasting organized in 2022
allTasting2022 <- getTasting(token=token,year=2022)
```

## Contribution

You can contribute to this projetc project by creating a pull request, or use issues to track bugs or suggest ideas in a repository.
