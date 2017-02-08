ik_ut_colclass_factorize <- function(df, cols = 1:ncol(df)) {
        for(i in cols){
                df[,i] <- factor(paste(df[,i]))
        }
        return(df)
}

ik_ut_colclass_numeralize <- function(df, cols = 1:ncol(df)) {
        for(i in cols){
                df[,i] <- as.numeric(paste(df[,i]))
        }
        return(df)
}

ik_ut_colclass_characterize <- function(df, cols = 1:ncol(df)) {
        for(i in cols){
                df[,i] <- paste(df[,i])
        }
        return(df)
}

