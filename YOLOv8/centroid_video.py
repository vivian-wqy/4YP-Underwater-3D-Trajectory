
import os

def centroid(x,y,w,h):
    width = 1920
    height = 1080

    cen_x = x * width
    cen_y = y * height

    return int(cen_x),int(cen_y)

text_path = 'E:/OneDrive - Nexus365/Year 4/4YP/YOLO/runs/detect/predict2 - right_10s/labels/'
outfilename = 'compiled_right.txt'
outfile = open(outfilename,'w')

for files in os.listdir(text_path):
    infile = open(text_path+files,'r')
    lines = infile.readlines()

    centroids = []
    parts = lines[0].split()
    id,x,y,w,h = map(float, parts)
    width = 1920
    height = 1080

    cen_x = x * width
    cen_y = y * height

    out_line = str(cen_x) + ' ' + str(cen_y) +'\n'
    outfile.write(out_line)
