################################################################################
#
# ik 14-09-2016
# Function - install version of a package for a specific date
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################

ik_install_date <- function(pkg,date=Sys.Date()){
        # default date is today
        repos <- paste0('https://mran.revolutionanalytics.com/snapshot/',date)
        install.packages(pkg,repos = repos)
}
