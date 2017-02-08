ik_gg_model.diag.cook <-function(model){

        require(ggplot2)

        plot <- ggplot(model, aes(seq_along(.cooksd), .cooksd))+
                geom_bar(stat="identity", position="identity")+
                xlab("Obs. Number")+
                ylab("Cook's distance")+
                ggtitle("Cook's distance")+
                theme_bw(base_size = 12)+
                theme(aspect.ratio=1)

        return(plot)
}
