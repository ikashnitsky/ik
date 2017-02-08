ik_gg_population.pyramid <- function(df, bw=T) {

        require(ggplot2)
        require(plyr)

        n.age.groups <- length(unique(paste(df$age)))

        breaks <- unique(paste(df$age))
        breaks[-(seq(0,(length(breaks)-1),5)+1)] <- NA
        labels <- paste(0:(length(breaks)-1))
        labels[-(seq(0,(length(breaks)-1),5)+1)] <- NA

        max.f <- filter(df,sex=='f') %>% mutate(value=value/sum(value)*100) %>% with(max(value))
        max.m <- filter(df,sex=='m') %>% mutate(value=value/sum(value)*100) %>% with(max(value))
        max.y <- max(max.f,max.m)
        step <- if(n.age.groups>30){.5}else{2}


        gg <- ggplot(data=df,aes(x=age,y=value,fill=sex)) +
                geom_bar(subset=.(sex=="f"),aes(y=value/sum(value)*100),stat='identity') +
                geom_bar(subset=.(sex=="m"),aes(y=value*(-1)/sum(value)*100),stat='identity') +
                geom_vline(xintercept=c(15.5,65.5),size=1,color='black')+
                coord_flip()+
                scale_fill_manual('Sex',labels=c('Female','Male'),values=c('magenta','deepskyblue'))+
                scale_x_discrete(breaks=breaks,labels=labels)+
                scale_y_continuous(breaks=seq(-(ceiling(max.y)),ceiling(max.y),step),
                                   labels=abs(seq(-(ceiling(max.y)),ceiling(max.y),step)))+
                ylab('Percent of total population')+
                xlab('Age')

        if(bw==T){gg <- gg + theme_bw(base_size=15)}else{gg <- gg}

        gg <- gg +
                theme(aspect.ratio=1)

        return(gg)
}
