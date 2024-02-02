#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#profit for each month
profit <- revenue-expenses
profit


#profit after tax each month (tax rate 30%)
tax<-round(profit * 0.30, digits = 0)
tax

profit.after.tax <- profit - tax
profit.after.tax


#profit margin after each month
profit.margin<-round(profit.after.tax/revenue, digits = 2)*100
profit.margin


#good month where the profit after tax greater than mean
mean_pat <- mean(profit.after.tax)
mean_pat
  
good.month <- profit.after.tax > mean_pat
good.month
  
#bad month where the profit after tax less than mean

bad.month <- !good.month
bad.month  

#best month 
best.month <- profit.after.tax == max(profit.after.tax)
best.month


#worst month
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month


#units of thousands
revenue.100 <- round(revenue /1000, digits = 2)
profit.100 <- round(profit /1000, digits = 2)
expenses.100 <- round(expenses /1000, digits = 2)
profit.after.tax.1000 <- round(profit.after.tax /1000, digits = 2)


#output
revenue.100
profit.100
expenses.100
profit.after.tax.1000
profit.margin
good.month
bad.month
best.month
worst.month


data_matrix <- rbind(
  revenue.100,
  profit.100,
  expenses.100,
  profit.after.tax.1000,
  profit.margin,
  good.month,
  bad.month,
  best.month,
  worst.month
)

data_matrix


