import cv2

def centroid(x,y,w,h):
    width = 1920
    height = 1080

    cen_x = x * width
    cen_y = y * height

    return int(cen_x),int(cen_y)

file_path = 'E:/OneDrive - Nexus365/Year 4/4YP/YOLO/predict-image_test/predict2/test.png'
text_path = 'E:/OneDrive - Nexus365/Year 4/4YP/YOLO/predict-image_test/predict2/labels/test.txt'

image = cv2.imread(file_path)

with open(text_path,'r') as file:
    lines = file.readlines()

centroids = []
for i,line in enumerate(lines):
    parts = line.split()
    id,x,y,w,h = map(float, parts)
    cen_x,cen_y = centroid(x,y,w,h)
    centroids.append([cen_x,cen_y])

print(cen_x,cen_y)
cv2.circle(image, (cen_x,cen_y), radius=5, color=(0,255,0), thickness=-100 )
cv2.imshow('m',image)
cv2.waitKey(0)