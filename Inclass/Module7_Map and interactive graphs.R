
##title: "Maps and Interactive Graphs"
##author: "Emily Ko"
##output: html_document

## Install packages 
install.packages("ggiraphExtra")
library(ggiraphExtra)

## Load libraries
library(tibble)
library(maps)
library(mapproj)

install.packages(plotly)
install.packages(dygraphs)
install.packages(xts)
install.packages(maps)


#######################################################################
## Intro to plotly() ##################################################
#######################################################################

## Load the plotly R package
#install.packages(plotly)
library(plotly)

# load the diamonds dataset from the ggplot2 package
data(diamonds, package = "ggplot2")
diamonds
str(diamonds)

########### Interactive Bar Plot #######################################
# Create visualizations of the diamonds dataset
# Bar plot with one categorical variable
bar <- plot_ly(diamonds, x = ~cut)
bar

htmlwidgets::saveWidget(bar, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/cutBar.html")

## Customized bar plot
bar2 <- plot_ly(
           diamonds, 
           x = ~cut, 
           color = I("red"), 
           stroke = I("black"), 
           span = I(2) # change the thinckness of stroke
         )
bar2

htmlwidgets::saveWidget(bar2, file = "E:/MBA-MAR--657-Visual-Analytics/bar2.html")

## Bar plot with two categorical variables: grouped bar plot
multi_bar <- plot_ly(diamonds, x = ~cut, color = ~clarity)  
multi_bar

htmlwidgets::saveWidget(multi_bar, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/multi_bar.html")

## Add title
multi_title <- layout(
                 plot_ly(diamonds, x = ~cut, color = ~clarity),
                 title = "My beatiful histogram"
                )
multi_title

htmlwidgets::saveWidget(multi_title, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/multi_title.html")

## Add text labels
library(dplyr)
bar3 <- diamonds %>%
          plot_ly(x = ~cut) %>% 
          add_histogram() %>%
          group_by(cut) %>%
          summarise(n = n()) %>%
          add_text(
            text = ~scales::comma(n), y = ~n, 
            textposition = "top middle"
        )

bar3

htmlwidgets::saveWidget(bar3, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/bar3.html")

########### Interactive Scatter Plot #######################################

## Scatter plot with two numerical variables
str(mpg)
scatter1 <- plot_ly(mpg, x = ~cty, y = ~hwy)
scatter1

htmlwidgets::saveWidget(scatter1, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter1.html")

## Deal with overplotting via alpha blending.
scatter2 <- plot_ly(mpg, x = ~cty, y = ~hwy) %>% 
              add_markers(alpha = 0.2)
scatter2            

htmlwidgets::saveWidget(scatter2, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter2.html")

## Present two plots together
scatter3 <- subplot(
              plot_ly(mpg, x = ~cty, y = ~hwy, name = "default"),
              plot_ly(mpg, x = ~cty, y = ~hwy) %>%  #pipe operator
                add_markers(alpha = 0.2, name = "alpha")

             )
scatter3

htmlwidgets::saveWidget(scatter3, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter3.html")

## Add the third variable to scatter plot
data("mpg")
p <- plot_ly(mpg, x = ~cty, y = ~hwy, alpha = 0.5)
p
scatter4 <- add_markers(p, color = ~cyl)
scatter4

htmlwidgets::saveWidget(scatter4, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter4.html")

## Change the legend title
scatter5 <- add_markers(p, color = ~cyl) %>% 
              colorbar(title = "Cylinders")
scatter5

htmlwidgets::saveWidget(scatter5, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter5.html")

## Add a factor variable to scatter plot
scatter6 <- add_markers(p, color = ~factor(cyl))
scatter6

htmlwidgets::saveWidget(scatter6, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/scatter6.html")

## Present two plots together
scatter7 <- subplot(
              add_markers(p, color = ~cyl, showlegend = TRUE) %>% 
                 colorbar(title = "Cylinders"),
              add_markers(p, color = ~factor(cyl))
            )
scatter7

htmlwidgets::saveWidget(scatter7, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/scatter7.html")

## Change shape by groups
p <- plot_ly(mpg, x = ~cty, y = ~hwy, alpha = 0.3) 
p
scatter8 <- subplot(
              add_markers(p, symbol = ~cyl, name = "A single trace"),
              add_markers(p, symbol = ~factor(cyl), color = I("black"))
             ) # Use 'symbol' argument/ use black color

scatter8

htmlwidgets::saveWidget(scatter8, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter8.html")

## Change shape from default to another
scatter9 <- plot_ly(mpg, x = ~cty, y = ~hwy) %>%
              add_markers(symbol = I(17), alpha = 0.5) # Try 12, 5, 25 
scatter9 # Use different shape --> symbol = I()/ Try different numbers

htmlwidgets::saveWidget(scatter9, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter9.html")

## Change size by groups
p <- plot_ly(mpg, x = ~cty, y = ~hwy, alpha = 0.3) 

scatter10 <- subplot(
               add_markers(p, size = ~cyl, name = "default"), # Size by 'cyl' --> size = ~cyl
               add_markers(p, size = ~cyl, sizes = c(1, 500), name = "custom")

             ) # Custom the size --> sizes = c(1, 500)

scatter10

htmlwidgets::saveWidget(scatter10, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter10.html")

## Change the size
scatter11 <- plot_ly(mpg, x = ~cty, y = ~hwy, alpha = 0.3, size = I(20))
scatter11 # Change the size --> size = I(30)

htmlwidgets::saveWidget(scatter11, file = "C:/Pace University/Mar657_Visual analytics/Spring 2024/Module 7_Maps and interactive graphs/scatter11.html")

########### Interactive Line Plot #######################################

## Create interactive time series graphs in dygraphs package
install.packages("dygraphs")
library(dygraphs)

## Preparing data, ggplot2::economics
economics <- ggplot2::economics
head (economics)

## Use xts to change an original data type to data type with the chronological order
library(xts)

eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)

## Select date range
dygraph(eco) %>% dyRangeSelector()

## Express multiple values
eco_a <- xts(economics$psavert, order.by = economics$date)
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

## Merge data and rename variables
eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

## Draw an interactive time series graph
dygraph(eco2) %>% dyRangeSelector()

########### Map ######################################################
### Map with USArrests data
## Transform the USArrests data set to the correct format
crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
crimes # Note there is no map data

## For map data
library(maps) 
library(ggplot2)
states_map <- map_data("state")
states_map

## Merge the data sets together
crime_map <- merge(states_map, crimes, by.x = "region", by.y = "state")
crime_map

## Sort by group, then order
library(dplyr) # For arrange() function
crime_map <- arrange(crime_map, group, order)
crime_map #group is states/ order is subregions within a state

## Assault Cases by States
crime_p <- ggplot(crime_map, aes(x = long, y = lat, group = group, fill = Assault)) +
              geom_polygon(colour = "black")  
# group by states and filled by numbers of assault cases
# geom_polygon: outline color
crime_p

## Customize colors
crime_p +
  scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                       midpoint = median(crimes$Assault))
# specify mid point is a median of the number of assault cases

## Use color palette
crime_p +
  scale_fill_viridis_c()

### Map with world data
## world data
world <- map_data("world") 
class(world)
world

## Add features
ggplot(world) +
  geom_path(aes(x=long, y=lat, group=group))
# group is country

## Canada map with red fill
library(dplyr)
world %>%
  filter(region == "Canada") %>%
  ggplot() + 
  geom_polygon(aes(x=long, y=lat, group=group), 
               fill="red")
## Kasakhstan
world %>%
  filter(region == "Kazakhstan") %>%
  ggplot() + 
  geom_polygon(aes(x=long, y=lat, group=group), 
               fill="blue")
## USA
world %>%
  filter(region == "USA") %>%
  ggplot() + 
  geom_polygon(aes(x=long, y=lat, group=group), 
               fill="yellow")
## India
world %>%
  filter(region == "India") %>%
  ggplot() + 
  geom_polygon(aes(x=long, y=lat, group=group), 
               fill="green")
## South Korea
world %>%
  filter(region == "South Korea") %>%
  ggplot() + 
  geom_polygon(aes(x=long, y=lat, group=group), 
               fill="purple")

########### 3D Chart ######################################################
## 3D chart
library(plotly)
mpg3d <- plot_ly(mpg, x = ~cty, y = ~hwy, z = ~cyl) %>%
             add_markers(color = ~cyl)
mpg3d

htmlwidgets::saveWidget(mpg3d, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/mpg3d.html")

## Add titles
mpg3d2 <- plot_ly(mpg, x = ~cty, y = ~hwy, z = ~cyl) %>%
             add_markers(color = ~displ) %>%
             layout( 
               scene = list(
                xaxis = list(title = "MPG city"),
                yaxis = list(title = "MPG highway"),
                zaxis = list(title = "Number of cylinders")
              )
            )
mpg3d2


htmlwidgets::saveWidget(mpg3d2, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/mpg3d2.html")

## Animating Views ##################################################################
### GDP per capital and life expectancy
## Data
data(gapminder, package = "gapminder")
gapminder

## GDP per capital and life expectancy
animating1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent)) +
                geom_point(aes(size = pop, frame = year, ids = country)) +
                scale_x_log10()

animating1
animating1 <- ggplotly(animating1)
animating1

htmlwidgets::saveWidget(animating1, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/animating1.html")

## Customizing
base <- gapminder %>%
  plot_ly(x = ~gdpPercap, y = ~lifeExp, size = ~pop, 
          text = ~country, hoverinfo = "text") %>%
  layout(xaxis = list(type = "log"))
base

base2<- base %>%
        add_markers(color = ~continent, frame = ~year, ids = ~country) %>%
        animation_opts(10, easing = "elastic") %>%
        animation_button(
          x = 1, xanchor = "right", y = 0, yanchor = "bottom"
        ) %>%
        animation_slider(
          currentvalue = list(prefix = "YEAR ", font = list(color="red"))
        )
 
base2

htmlwidgets::saveWidget(base2, file = "C:/Pace University/Mar657_Visual analytics/7. Maps and interactive graphs/base2.html")
 
