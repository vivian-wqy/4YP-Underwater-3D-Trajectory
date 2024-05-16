import cv2
import numpy as np
from shapely.geometry import Polygon
image = cv2.imread('frame.png')
pts = np.array([[928.4068, 257.08276], [946.6551, 240.86206], [967.2896, 264.07587], [949.0413, 280.29657]],
               np.int32)
cv2.polylines(image, [pts],True, (255,0,0), 5)
polygon = Polygon(pts)
cen = polygon.centroid
print(type(cen.x), cen.y)
cv2.circle(image,(np.int32(cen.x), np.int32(cen.y)),3,(0,255,0),1)
cv2.imshow('image',image)
cv2.waitKey(0)

#[946.6551, 240.86206], [967.2896, 264.07587], [949.0413, 280.29657]