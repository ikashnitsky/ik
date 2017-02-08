ik_dm_fill.missings <- function(x,y,by){
        x <- merge(x,y,by=by,all.x=T,all.y=F)
        x$value.y[ is.na(x$value.y) ] <- x$value.x[ is.na(x$value.y) ]
        x$value <- x$value.y
        x <- subset(x, select=-c(value.x,value.y))
        return(x)
}
