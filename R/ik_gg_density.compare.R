################################################################################
#                                                                                                        
# Function. 02-03-2015
# Function. Compare distribution at two years.
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#                                                                                                    
################################################################################

# Data organization!
# Input should be any data.frame with at least 3 columns representing
# (1) unique records (default is 'id')
# (2) year (default is 'year') with at least two levels
# (3) values to be analyzed (default is 'value')
# t1 and t2 define the two years for comparison
# there is an option to scale distributions
# parameter 'var.name' allowes to specify x-axis label

ik_gg_density.compare <- function(df, id='id', year='year',value='value', var.name = '',
                                  t1, t2, scaled=F){
        
        require(dplyr)
        require(tidyr)
        require(ggplot2)
        
        
        df <- df[,match(c(id,year,value),colnames(df))]
        colnames(df) <- c('id','year','value')
        
        t1s <- paste0('y',t1)
        t2s <- paste0('y',t2)
        
        # prepare dd
        dd <- filter(df, year%in%c(t1s,t2s)) %>% droplevels()
        levels(dd$year) <- c('begin','finish')        
        
        if(scaled==T){
                dd <- dd %>% spread(year,value) %>%
                        mutate(begin=scale(begin),
                               finish=scale(finish)) %>%
                        gather('year','value',2:3)
        }
        
        
        gg <- ggplot(dd)+
                geom_density(aes(x=value, color=year, group=year),size=1)+
                geom_vline(xintercept = mean(unlist(dd[dd$year=='begin',3])), color='springgreen')+
                geom_vline(xintercept = mean(unlist(dd[dd$year=='finish',3])),color='navy')+
                xlab(var.name)+
                scale_color_manual(labels=c(t1s,t2s),values=c('springgreen','navy'))+
                theme_bw()+
                theme(aspect.ratio=1,
                      legend.position = c(1, 1), 
                      legend.justification = c(1,1), 
                      legend.background = element_rect(colour = NA, fill = NA))
        
        
        return(gg)
}


