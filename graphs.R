library(ggplot2)
library(plyr)
library(reshape2)
library(grid)
library(gridExtra)

bm_data<-read.table("src/bm_bkp/results/results",sep=" ",as.is=T,header=F)
colnames(bm_data)<-c("type","op_type","time","size")

# time 
bk_time_graph<-(ggplot(bm_data) +
                       aes(x=type,y=time,fill=op_type) +
                       geom_bar(stat="identity", position="dodge") +
                       expand_limits(y=0) +
                       theme(legend.position="bottom") +
                       xlab("Case") +
                       ylab("Time taken (seconds)") +
                       ggtitle("Time taken for backup scenarios") +
                       scale_color_hue(l=55,name="op_type") +
                       coord_flip() +
                       theme(text = element_text(size=15))
                      )
bk_time_graph


# size 
bk_size_graph<-(ggplot(bm_data) +
                       aes(x=type,y=size,fill=op_type) +
                       geom_bar(stat="identity", position="dodge") +
                       expand_limits(y=0) +
                       theme(legend.position="bottom") +
                       xlab("Case") +
                       ylab("Size(MB)") +
                       ggtitle("Size for backup scenarios") +
                       scale_color_hue(l=55,name="op_type") +
                       coord_flip() + 
                       theme(text = element_text(size=15))
               )
bk_size_graph


ggsave(plot = bk_time_graph, "src/bm_bkp/time.png", dpi=72, scale=2, height=6, width=3, type = "cairo-png")
ggsave(plot = bk_size_graph, "src/bm_bkp/size.png", dpi=72, scale=2, height=6, width=3, type = "cairo-png")
