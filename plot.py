##################################################################################################
#Python script plot.py uses matplotlib script to generate a graph for the time taken to generate 
#the data and the time taken to sort the data at the 3 different scales. 
#A log plot is used. The graph automatically adjust to the number of entries, i
#and the scale of the data by using the plt.axis((xmin,xmax,ymin,ymax)) command.
##################################################################################################
import matplotlib.pyplot as plt 
import numpy as np 
  
# create data 
# The 3 sccales are x
x = [1000,100000,10000000]
# Times taken to generate data are y1
y1 = [1.06,105.16,27431.71]
# Times taken to sort data are y2
y2 = [0.032,7.182,7511.052]

xmin=min(x)
xmax=max(x)
yconcat = np.concatenate([y1,y2])
ymin=min(yconcat)
ymax=max(yconcat)
print("x=",x)               
print("y1=",y1)               
print("y2=",y2)               
print(xmin,xmax,ymin,ymax)
  
# plot lines 
plt.yscale("log")
plt.plot(x, y1, marker = 'o',label = "generate") 
plt.plot(x, y2, marker = 'o',label = "sort") 
plt.axis((xmin,xmax,ymin,ymax))
plt.xlabel("Scale")
plt.ylabel("log of time taken")
plt.legend()
plt.show()
