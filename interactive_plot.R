
library(plotly)
py <- plotly(username='Edana', key='2j0ay8q1ji')
trace1 <- list(
    x = c(8,7,4,4,9,11,8,4,10,10,14,10,8,4,4,7,15,5,5,4,7,16,18,12,7,9, 4,20,14,9,12,14),
    y = c(31, 51, 8, 20, 48, 61, 19, 10, 94, 39, 99, 30, 96, 7, 6, 50, 56, 18, 16,  9, 40, 142, 156, 72, 19, 39, 12, 229, 98, 24, 51, 96),
    mode = "markers", 
    name = "Win probability", 
    text = c("Paraguay", "Russia", "Saudi Arabia", "Costa Rica", "Hungary", "Sweden", "Scotland",    
             "Morocco","Netherlands","Switzerland","Spain", "USA","Germany", "Tunisia",     
             "Iran","Poland","Mexico","Nigeria","Japan","Australia","Austria",     
             "Argentina","Italy","Uruguay","Cameroon","Chile","Algeria","Brazil",      
             "England","South Korea","Belgium","France"),
    marker = list(
        color = c("blue"), 
        size = c(38.395904, 70.844893, 7.330317, 39.901072, 69.966722, 53.492234, 27.103209, 30.769231, 74.250619, 36.778060,
                 66.021841, 26.261270, 81.709967, 18.130312, 9.193246, 54.751131, 27.738410, 37.174721, 28.823529, 15.181932,
                 45.564317, 71.133055, 73.428046, 55.939166, 14.910262, 39.257356, 31.886792, 82.417382, 66.556468, 17.633028,
                 38.300283, 69.029920), 
        sizemode = "diameter"
    ), 
    type = "scatter"
)
data <- list(trace1)
layout <- list(
    title = "FIFA World Cup Win Probability", 
    titlefont = list(
        family = "", 
        size = 0, 
        color = ""
    ), 
    font = list(
        family = "Open sans", "verdana", "arial", "sans-serif", 
        size = 12, 
        color = "#444"
    ), 
    showlegend = TRUE, 
    autosize = FALSE, 
    width = 1152, 
    height = 624, 
    xaxis = list(
        title = "Number of editions participated",
        titlefont = list(
            family = "", 
            size = 0, 
            color = ""
        ), 
        range = c(0.618515368852, 0.963023565574), 
        domain = c(0, 1), 
        type = "linear", 
        rangemode = "normal", 
        autorange = TRUE, 
        showgrid = TRUE, 
        zeroline = TRUE, 
        showline = FALSE, 
        autotick = TRUE, 
        nticks = 0, 
        ticks = "", 
        showticklabels = TRUE, 
        tick0 = 0, 
        dtick = 0.05, 
        ticklen = 5, 
        tickwidth = 1, 
        tickcolor = "#444", 
        tickangle = "auto", 
        tickfont = list(
            family = "", 
            size = 0, 
            color = ""
        ), 
        exponentformat = "B", 
        showexponent = "all", 
        mirror = FALSE, 
        gridcolor = "#eee", 
        gridwidth = 1, 
        zerolinecolor = "#444", 
        zerolinewidth = 1, 
        linecolor = "#444", 
        linewidth = 1, 
        anchor = "y", 
        overlaying = FALSE, 
        position = 0
    ), 
    yaxis = list(
        title = "Number of total points",
        titlefont = list(
            family = "", 
            size = 0, 
            color = ""
        ), 
        range = c(279.504183825, 597.590819284), 
        domain = c(0, 1), 
        type = "linear", 
        rangemode = "normal", 
        autorange = TRUE, 
        showgrid = TRUE, 
        zeroline = TRUE, 
        showline = FALSE, 
        autotick = TRUE, 
        nticks = 0, 
        ticks = "", 
        showticklabels = TRUE, 
        tick0 = 0, 
        dtick = 50, 
        ticklen = 5, 
        tickwidth = 1, 
        tickcolor = "#444", 
        tickangle = "auto", 
        tickfont = list(
            family = "", 
            size = 0, 
            color = ""
        ), 
        exponentformat = "B", 
        showexponent = "all", 
        mirror = FALSE, 
        gridcolor = "#eee", 
        gridwidth = 1, 
        zerolinecolor = "#444", 
        zerolinewidth = 1, 
        linecolor = "#444", 
        linewidth = 1, 
        anchor = "x", 
        overlaying = FALSE, 
        position = 0
    ), 
    legend = list(
        x = 1.02, 
        y = 1, 
        traceorder = "normal", 
        font = list(
            family = "", 
            size = 0, 
            color = ""
        ), 
        bgcolor = "#fff", 
        bordercolor = "#444", 
        borderwidth = 0, 
        xanchor = "left", 
        yanchor = "top"
    ), 
    margin = list(
        l = 80, 
        r = 80, 
        b = 80, 
        t = 100, 
        pad = 0, 
        autoexpand = TRUE
    ), 
    paper_bgcolor = "#fff", 
    plot_bgcolor = "#fff", 
    hovermode = "closest", 
    dragmode = "pan", 
    separators = ".,", 
    barmode = "group", 
    bargap = 0.2, 
    bargroupgap = 0, 
    boxmode = "overlay", 
    boxgap = 0.3, 
    boxgroupgap = 0.3, 
    hidesources = FALSE
)
response <- py$plotly(data, kwargs=list(layout=layout))
url <- response$url