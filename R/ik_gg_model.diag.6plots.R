require(ggplot2)
require(gridExtra)

ik_gg_model.diag.6plots<-function(model, model.name=NULL){
        
        p1<-ggplot(model, aes(.fitted, .resid))+
                geom_point()+
                stat_smooth(method="loess")+
                geom_hline(yintercept=0, col="red", linetype="dashed")+
                xlab("Fitted values")+
                ylab("Residuals")+
                ggtitle("Residual vs Fitted Plot")+
                theme_bw()+
                theme(aspect.ratio=1)
        
        p2<-ggplot(model, aes(qqnorm(.stdresid)[[1]], .stdresid))+
                geom_point(na.rm = TRUE)+
                geom_abline(aes(qqline(.stdresid)))+
                xlab("Theoretical Quantiles")+
                ylab("Standardized Residuals")+
                ggtitle("Normal Q-Q")+
                theme_bw()+
                theme(aspect.ratio=1)
        
        p3<-ggplot(model, aes(.fitted, sqrt(abs(.stdresid))))+
                geom_point(na.rm=TRUE)+
                stat_smooth(method="loess", na.rm = TRUE)+
                xlab("Fitted Values")+
                ylab(expression(sqrt("|Standardized residuals|")))+
                ggtitle("Scale-Location")+
                theme_bw()+
                theme(aspect.ratio=1)
        
        p4<-ggplot(model, aes(seq_along(.cooksd), .cooksd))+
                geom_bar(stat="identity", position="identity")+
                xlab("Obs. Number")+
                ylab("Cook's distance")+
                ggtitle("Cook's distance")+
                theme_bw()+
                theme(aspect.ratio=1)
        
        p5<-ggplot(model, aes(.hat, .stdresid))+
                geom_point(aes(size=.cooksd), na.rm=TRUE)+
                stat_smooth(method="loess", na.rm=TRUE)+
                xlab("Leverage")+
                ylab("Standardized Residuals")+
                ggtitle("Residual vs Leverage Plot")+
                scale_size_continuous("Cook's Distance", range=c(1,5))+
                theme_bw()+
                theme(aspect.ratio=.7,
                      legend.position="bottom")
        
        p6<-ggplot(model, aes(.hat, .cooksd))+
                geom_point(na.rm=TRUE)+
                stat_smooth(method="loess", na.rm=TRUE)+
                xlab("Leverage hii")+ylab("Cook's Distance")+
                ggtitle("Cook's dist vs Leverage hii/(1-hii)")+
                geom_abline(slope=seq(0,3,0.5), color="gray", linetype="dashed")+
                theme_bw()+
                theme(aspect.ratio=1)
        
        plots <- list(Resid.Fitted=p1, QQ.Resid=p2, Scale.Location=p3, 
                      Cooks.Distance=p4, Resid.Leverage=p5, Cooks.Leverage=p6)
        
        px6 <- arrangeGrob(p1,p2,p3,p4,p5,p6, ncol=3,
                           main=paste0("Diagnostic Plots",ifelse(!is.null(model.name),' - ',''),model.name))
        
        list <- list(all.six.plots = px6,
                     one.by.one = plots)
        
        return(list)
}