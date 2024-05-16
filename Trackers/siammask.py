import os

os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"

import numpy as np
import cv2
from arcgis.learn import SiamMask
from shapely.geometry import Polygon


ot = SiamMask()

cap = cv2.VideoCapture(r"frame.png")

initialized = False
outfile = open('frame.txt','w')
count = 0

while(True):
    ret, frame = cap.read()
    if ret is False:
        break
    if initialized:
        state = ot.update(frame)  ## Update the track location in the frame
        for track in state:
            mask = track.mask
            frame[:, :, 2] = (mask > 0) * 255 + (mask == 0) * frame[:, :, 2]
            cv2.polylines(frame, [np.int0(track.location).reshape((-1, 1, 2))], True, (w, 255, h), 1)
            # print(np.int0(track.location).reshape((4,2)))
            polygon = Polygon(np.int0(track.location).reshape((4,2)))
            cen = polygon.centroid
            # cv2.circle(frame,(np.int32(cen.x), np.int32(cen.y)),3,(0,255,0),1)
            out_line = str(cen.x) + ' ' + str(cen.y) + '\n'
            outfile.write(out_line)

        
            
    cv2.imshow('frame',frame)
    key = cv2.waitKey(1)
    if key & 0xFF == ord('q'):
        break
    if key & 0xFF == ord('p'):
        cv2.waitKey(-1)

    
    if count == 0:
        init_rect = cv2.selectROI('frame', frame, False, False)
        values = np.array(init_rect)
        if all(values == 0):
            continue
        x, y, w, h = init_rect
        state = ot.init(frame, [[x,y,w,h]]) ## Initialize the track in the frame
        initialized = True
        count += 1
        cv2.waitKey()

cap.release()
cv2.destroyAllWindows()