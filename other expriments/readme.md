## Background

When we on our way to find the easiest and good performance model, we noticed that there some interesting combinations. But unfortunately, compared with the final model we chose, these models who have a high performance are against "rule of thumb", it's kind of diffcult to use. On the other hand, the simple models usually have bad performance. But we still find some competitive combinations and it's worth to write them down.



## Our final model

we aim to make the model simple and powerful. We only use three parameters here so the model is quite simple.Besides, we can see the R square in different folder are all greater than 0.6 except for the smallest one. The most important thing is that our model's performance is quite steady,it means that our model will also work well in the test set and we don't need to consider the problem like over-fitting,etc.

<img src="/Users/robin/Desktop/628HW2/final/628ModuleTwo13/other expriments/Final_model.png" alt="Final_model" style="zoom:67%;" />



## Other Combinations 



##### Model 1: Bodyfat ~ WRIST + ABDOMEN + THIGH(Full Model)

<img src="/Users/robin/Desktop/628HW2/final/628ModuleTwo13/other expriments/Expri_1.png" style="zoom:67%;" />

 We do 12-folder cross validation test to judge the performance of a model. Compared with final model, the R square of this model varies a lot.It means that the model may overfit the train set and it can't perform well in general.Besides, this model is more complicate than our final model.However, this model still got a good performance in average.



##### Model 2: Bodyfat ~ ABDOMEN + WEIGHT



<img src="/Users/robin/Desktop/628HW2/final/628ModuleTwo13/other expriments/Expri_2.png" alt="Expri_2" style="zoom:67%;" />

This model only takes two parameters,"weight" and "Abdomen", which is super straightforward. In the meantime, it's still perfom well. The bad part of this model is that there exists a folder whose R square is quite low(<0.4) .So we think this model is a little wrose than our final one.