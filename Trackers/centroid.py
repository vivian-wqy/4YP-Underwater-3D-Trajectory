import cv2

def centroid(a,b,c,d):
    cen_x = (int(a)+int(c)+int(a))/2
    cen_y = (int(b)+int(d)+int(b))/2

    return int(cen_x),int(cen_y)

file_path = 'E:/OneDrive - Nexus365/Year 4/4YP/Tracking/frame.png'
text_path = 'E:/OneDrive - Nexus365/Year 4/4YP/Tracking/right_output.txt'

image = cv2.imread(file_path)
outfile = open('right_centroids.txt','w')

with open(text_path,'r') as file:
    lines = file.readlines()


for line in lines:
    a,b,c,d = line.split()
    x,y = centroid(a,b,c,d)
    out_line = str(x)+' '+str(y)+'\n'
    outfile.write(out_line)

# a,b,c,d=lines[0].split()
# x,y=centroid(a,b,c,d)
# print(x,y)

# for i,line in enumerate(lines):
#     parts = line.split()
#     id,x,y,w,h = map(float, parts)
#     cen_x,cen_y = centroid(x,y,w,h)
#     centroids.append([cen_x,cen_y])

# print(cen_x,cen_y)
    cv2.circle(image, (x,y), radius=5, color=(0,255,0), thickness=-100 )
    cv2.rectangle(image, (int(a),int(b)), (int(a)+int(c),int(b)+int(d)), (255,0,0), 2, 1)
    cv2.imshow('m',image)
    k = cv2.waitKey(1) & 0xff
    if k == 27 : break