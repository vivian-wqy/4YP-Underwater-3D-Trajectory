# import the required library
import cv2

out_line = []

# define a function to display the coordinates of
# of the points clicked on the image
def click_event(event, x, y, flags, params):
   
   if event == cv2.EVENT_LBUTTONDOWN:
      print(f'[{x} {y}]')
      
      out_line.append([str(x),str(y)])
      
   #   # put coordinates as text on the image
   #   cv2.putText(img, f'({x},{y})',(x,y),
   #   cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
      
      # draw point on the image
      cv2.circle(img, (x,y), 3, (0,255,255), -1)


 
# read the input image
img = cv2.imread('reproj/tripod1-left-0.38.png')

# create a window
cv2.namedWindow('Point Coordinates')

# bind the callback function to window
cv2.setMouseCallback('Point Coordinates', click_event)



# display the image
while True:
   cv2.imshow('Point Coordinates',img)
   k = cv2.waitKey(1) & 0xFF
   if k == 27:
      break
print(out_line)

with open('reproj/tripod1-left-0.38.txt','w') as outfile:
   for line in out_line:
      outfile.write(line[0] + ' ' + line[1] + '\n')

cv2.destroyAllWindows()