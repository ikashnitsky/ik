################################################################################
#
# Function. 10-10-2016
# Identify borders of a polygon shapefile. Output is polyline
# solution from http://stackoverflow.com/a/35795927/4638884
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################


ik_map_identify_borders <- function(SPolyDF){
        require(rgeos)
        require(sp)
        borders <- gDifference(
                as(SPolyDF,"SpatialLines"),
                as(gUnaryUnion(SPolyDF),"SpatialLines"),
                byid=TRUE)

        df <- data.frame(len = sapply(1:length(borders), function(i) gLength(borders[i, ])))
        rownames(df) <- sapply(1:length(borders), function(i) borders@lines[[i]]@ID)

        SLDF <- SpatialLinesDataFrame(borders, data = df)
        return(SLDF)
}
