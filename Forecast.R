# Time series forecasting by forecast
# as Exploratory Custom Model Function
# https://docs.exploratory.io/user-defined-model-function.html

library(forecast)
library(sweep)
library(timetk)
  
  build_forecast_model <- function(formula, data, freq = 12, periods = 5, ...) { # default freq 12 for monthly data
  training_data <- datalhs_cols <- all.vars(lazyeval::f_lhs(formula)) # predicted variable
  rhs_cols <- all.vars(lazyeval::f_rhs(formula)) # date column
  all_cols <- c(lhs_cols, rhs_cols)
  
  training_data <- training_data[colnames(training_data) %in% all_cols]
  start_date <- training_data[[rhs_cols]][[1]]
  start <- year(start_date) + yday(start_date)/365.25 # get start yearmon for the following tk_ts()
  training_data_ts <- training_data %>% tk_ts(start=start, freq = freq, silent = TRUE)
  
  fit_arima <- auto.arima(training_data_ts)
  # fit_arima <- Arima(training_data_ts, order=c(1,1,0), seasonal=list(order=c(1,0,0)), method="ML")
  # return model and periods as one object
  ret <- list(model = fit_arima, periods = periods, date_col = rhs_cols, value_col = lhs_cols)
  class(ret) <- c("forecast_model")
  ret
}
  augment.forecast_model <- function(x, data = NULL, newdata = NULL, ...) 
    {
  fcast <- forecast::forecast(x$model, h = x$periods)
  
  fcast_df <- as.data.frame(fcast) %>%
    rownames_to_column("date") %>%
    mutate(date = as.Date((as.numeric(date) - 1970) * 365.25, origin = "1970-01-01"), key="forecast") # back to Date class
  colnames(fcast_df)[colnames(fcast_df) == "Point Forecast"] <- x$value_col
  colnames(fcast_df)[colnames(fcast_df) == "date"] <- x$date_col
  actual_df <- data %>% mutate(key = "actual")
  ret <- bind_rows(actual_df, fcast_df)
  ret
}
  glance.forecast_model <- function(x, ...){
  sw_glance(x$model)
}
  tidy.forecast_model <- function(x, ...){
  sw_tidy(x$model)
}
