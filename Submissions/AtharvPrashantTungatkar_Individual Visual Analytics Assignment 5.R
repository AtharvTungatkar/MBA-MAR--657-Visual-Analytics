# Read Dataset

siva=read.csv("C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/siva.csv")
head(siva)

# Import all the necessary libraries

library(dplyr)

# Part 1 : Subsetting

# SUBSET 1:

# Filtering out people who gave recommendation greater than or equal to 7 and their respective bill charges and rental location.

subset1 <- siva %>%
  dplyr::filter(Recom_mend_Siva >= 7) %>%
  dplyr::select(Siva_Rental_Number, Recom_mend_Siva, rent_area_loc, Total_charge_USD)
head(subset1,10)

# SUBSET 2

# Getting people who were not billed properly to get areas which are more problematic.

subset2 <- siva %>%
  dplyr::filter(Trans_Billing_as_Expected <= 4) %>%
  dplyr::select( Siva_Rental_Number, Trans_Billing_as_Expected, rent_area_loc, Value_for_the_Money, Total_charge_USD)
head(subset2, 10)


# SUBSET 3

# Getting Average sales by weekday

subset3<- siva %>%
  group_by(Day_of_Week)%>%
  summarise(mean_day=mean(Total_charge_USD))
head(subset3,10)

# SUBSET 4

# Lets determine if there are significant speed differences on different days for different purposes.

subset4<-siva%>%
  group_by(Purpose_of_Rental,Day_of_Week)%>%
  summarise(speed=mean(Speed_of_Service,na.rm=TRUE))
head(subset4,10)

# SUBSET 5

# Booking done using SIVA.COM

subset5<-siva%>%
  dplyr::filter(booking_channel_code=="SIVA.COM")%>%
  dplyr::select(Recom_mend_Siva,rent_area_loc,booking_channel_code,Purpose_of_Rental,Value_for_the_Money)
head(subset5,10)

# Part 2 : Visualizations

library(ggplot2)


# Plot 1

# Daywise sales

day_wise<- siva %>%
  group_by(Day_of_Week)%>%
  summarise(mean_day=mean(Total_charge_USD))
day_wise$Day_of_Week <- factor(day_wise$Day_of_Week,
                               levels = c("Monday", "Tuesday", "Wednesday", 
                                          "Thursday", "Friday", "Saturday", "Sunday"))
ggplot(data=day_wise,aes(x=Day_of_Week,y=mean_day))+
  geom_col(fill = "skyblue") +
  labs(title = "Average Total Charge by Day of Week",
       x = "Day of Week", y = "Average Charge (USD)")

# The rentals occur mostly on weekends especially Fridays and Saturdays.

## Plot 2

# Heatmap of Correlation between Variables

library(dplyr)
library(corrplot)
dat <- siva[, c("Recom_mend_Siva", "Speed_of_Service", "Value_for_the_Money", "Total_charge_USD","Staff_Courtesy","Veh_Equip_Condition")]
corr_matrix <- cor(dat, use = "complete.obs")
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA" ))

corrplot(corr_matrix)

# The plot reveals key information. The price is not more correlated with the services and even the recommendation doesn't depend on the price. Majority of recommendations are positively related with speed of service, staff courtesy and equipment condition.

# Plot 3

# Speed of serviceby location type

siva %>%
  filter(!is.na(rent_loc_type) & rent_loc_type != "" & rent_loc_type != "NA") %>%
  group_by(rent_loc_type) %>%
  summarise(avg_speed = mean(Speed_of_Service, na.rm = TRUE)) %>%
  ggplot(aes(x = rent_loc_type, y = avg_speed, fill = rent_loc_type)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Speed of Service by Location Type",
       x = "Location Type",
       y = "Average Speed") +
  theme_minimal()

# It was against my assumption that the off airport locations had a slightly higher speed.

# Plot 4

# Distribiution of Total Charge

ggplot(siva, aes(x = Total_charge_USD)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Total Charges (USD)", x = "Total Charge (USD)", y = "Frequency")+
  coord_cartesian(xlim = c(0, 1250)) +   # Zoom in, keeps data
  theme_minimal()

# The distribuition is unimodal and right skewed hence there are less trips that amount for more cost.


# Plot 5
# Box plot of Purpose of visit according to total charges

ggplot(siva, aes(x = Purpose_of_Rental, y =Recom_mend_Siva)) +
  geom_boxplot(fill = "salmon", color = "black") +
  labs(title = "Purpose Vs Recommendation", x = "Purpose", y = "Recommendation")

# Insurance replacement/loaners are more likely to recommend SIVA than other two categories.

