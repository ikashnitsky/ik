################################################################################
#
# Plotting functions for ggplot2. 07-08-2015
# Normal QQ plot
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################

ik_gg_qqplot <- function (vec, bw=T) # argument: vector of numbers
{
        require(ggplot2)
        # following four lines from base R's qqline()
        y <- quantile(vec[!is.na(vec)], c(0.25, 0.75))
        x <- qnorm(c(0.25, 0.75))
        slope <- diff(y)/diff(x)
        int <- y[1L] - slope * x[1L]

        d <- data.frame(resids = vec)

        gg <- ggplot(d, aes(sample = resids)) +
                stat_qq() +
                geom_abline(slope = slope, intercept = int)

        if(bw==T){gg <- gg + theme_bw()}else{gg <- gg}

        gg <- gg +
                theme(aspect.ratio=1)

        return(gg)

}

