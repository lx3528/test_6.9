import cv2
import numpy as np

####黑白兑换后，腐蚀膨胀就行
img1 = cv2.imread('12_suofang0.5.jpg')
imgray = cv2.cvtColor(img1,cv2.COLOR_BGR2GRAY)

ret,th25=cv2.threshold(blur1 ,85,255,cv2.THRESH_BINARY_INV)

kernel1 = np.ones((5,5),np.uint8)

th25.shape###(v,x)(832, 624)
th25_resize=th25[:,:610]
th25_resize.shape
th25_resize[820:,520:]=0

xia_12=th25_resize[394:,:]
dilate4 = cv2.dilate(xia_12,kernel1,iterations = 4)

cv2.imshow("dilate4", xia_12)

image, contours, hierarchy = cv2.findContours(dilate4 ,cv2.RETR_TREE,cv2.CHAIN_APPROX_TC89_L1)##
print(hierarchy)

bin33=[]
for i in range(len(contours)):
    bin33.append(np.ones(image.shape, np.uint8) * 255)


i=0
img_2 = cv2.drawContours(bin33[i], contours[i], -1, (0, 255, 0), 2)
cv2.imshow('binimg22', bin33[i])
print(len(contours[i]))

i=1
img_2 = cv2.drawContours(bin33[i], contours[i], -1, (0, 255, 0), 2)
cv2.imshow('binimg21', bin33[i])###
print(len(contours[i]))###2千多个点，none方法，这还是降低了分辨率###simple277 195 tc89 136,116
print(contours[i].shape)
print(contours[i].ndim)
