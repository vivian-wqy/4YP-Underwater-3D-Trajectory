'''
Display tracking process using trained YOLO model
'''

import cv2
from ultralytics import YOLO

# Load the YOLOv8 model
model = YOLO('INPUT_MODEL')

# Open the video file
cap = cv2.VideoCapture("INPUT_VIDEO")

# Loop through the video frames
while True:
    # Read a frame from the video
    ret, frame = cap.read()

    # If frame is read correctly, proceed
    if ret:
        # Run YOLOv8 tracking on the frame, persisting tracks between frames
        results = model.track(frame, imgsz=640, persist=True, conf=0.5, save=True, save_txt=True)

        # Check if there are any detections
        if results[0].boxes is not None:
            # Extract IDs if they exist
            ids = results[0].boxes.id.cpu().numpy().astype(int) if results[0].boxes.id is not None else []

            # Annotate frame with boxes and IDs
            for i, box in enumerate(results[0].boxes.xyxy.cpu().numpy().astype(int)):
                id = ids[i] if len(ids)>0 else None
                cv2.rectangle(frame, (box[0], box[1]), (box[2], box[3]), (0, 255, 0), 2)
                if id is not None:
                    cv2.putText(frame, f"ID {id}", (box[0], box[1] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

        # Display the annotated frame
        cv2.imshow("YOLOv8 Tracking", frame)

        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
    else:
        # Break the loop if the end of the video is reached or frame is not read correctly
        break

# Release the video capture object and close the display window
cap.release()
cv2.destroyAllWindows()