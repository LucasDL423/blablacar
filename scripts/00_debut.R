### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
## My compendium
##
## Set-up : load package and create folders
##
## Mary Varoux
## Octobre 2020
##
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###



rm(list=ls(all=TRUE))



### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#### 1. Create folders  #### 

### ### ### ### ### ### ### ### ### ### ### ### ### ### ###



catch_fold_data <- file.path("data") #for data
dir.create(file.path(catch_fold_data))

catch_fold_res <- file.path("results") #for results
dir.create(file.path(catch_fold_res))

catch_fold_script <- file.path("scripts") #for scripts
dir.create(file.path(catch_fold_script))

### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#### 2. Create folders  #### 

### ### ### ### ### ### ### ### ### ### ### ### ### ### ###




#create forlder names
script_names <- list.files(path = file.path("scripts"), pattern = "^[0-9]{2}.+\\.R$")
script_names <- script_names[-1]
dir_names    <- gsub("\\.R", "", script_names)
dir_vars     <- stringr::str_extract(dir_names, "^[0-9]{2}[a-z]?")
dir_vars     <- paste0("res_dir_", dir_vars)

#create folders & folder names variables
sapply(1:length(dir_names), function(i) {
  
  dir.create(
    path          = file.path("results", dir_names[i]),
    showWarnings  = FALSE,
    recursive     = TRUE
  )
  
  assign(
    x      = dir_vars[i],
    value  = file.path("results", dir_names[i]),
    envir  = .GlobalEnv
  )
})


### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

#### 3. Install and load packages  #### 

### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# Add package used in the R script
packages <- c("met tous les packages dont tu auras besoin","tous oui!"
)

# Package function

require <- function(x) { 
  if (!base::require(x, character.only = TRUE)) {
    install.packages(x, dep = TRUE) ; 
    base::require(x, character.only = TRUE)
  } 
}

# Load package

base::lapply(packages, require)
