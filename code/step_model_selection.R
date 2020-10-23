require(MASS)

data = read.csv("628/HW2/BodyFat.csv")
data2 = subset(data, select = -DENSITY)
n=252
step(lm(BODYFAT~1, data2), scope = formula(lm(BODYFAT~., data2)), direction = "both", k=2)
step(lm(BODYFAT~1, data2), scope = formula(lm(BODYFAT~., data2)), direction = "both", k=log(n))

step(lm(BODYFAT~1, data2), scope = formula(lm(BODYFAT~.^2, data2)), direction = "both", k=2)
step(lm(BODYFAT~1, data2), scope = formula(lm(BODYFAT~.^2, data2)), direction = "both", k=log(n))

