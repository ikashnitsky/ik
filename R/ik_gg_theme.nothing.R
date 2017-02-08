# david kahle
# sept 27, 2010

ik_gg_theme.nothing <- function (base_size = 12){
  structure(list(
    axis.line = element_blank(),
    axis.text.x = element_blank(), axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.x = element_blank(), axis.title.y = element_blank(),
    axis.ticks.length = unit(0, "lines"), axis.ticks.margin = unit(0, "lines"),
    legend.position = "none",
    panel.background = element_blank(), panel.border = element_blank(),
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
    panel.margin = unit(0, "lines"),
    plot.background = element_blank(),
    plot.title = element_text(size = base_size * 1.2),
    plot.margin = unit(c(-1, -1, -1.5, -1.5), "lines")
  ), class = "options")
}
