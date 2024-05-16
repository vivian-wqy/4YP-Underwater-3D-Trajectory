'''
Run YOLO prediciton on images/videos
'''

# predict
from ultralytics import YOLO

# Load a pretrained YOLOv8n model
model = YOLO('INPUT_MODEL')

# Run inference on files within selected folder with arguments
model.predict('INPUT_FOLDER', imgsz=1280, show=True, save=True)