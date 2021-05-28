faceDetector = vision.CascadeObjectDetector();
videoFileReader=vision.VideoFileReader('Video2.mp4'); 
videoFrame = step(videoFileReader);
bbox = step(faceDetector, videoFrame);
videoOut = insertObjectAnnotation(videoFrame, 'rectangle', bbox, 'face'); 
figure,imshow(videoOut), title('Detected face');
[hue,~,~]=rgb2hsv(videoFrame); 
figure, imshow (hue), title ('Hue Data')
rectangle ('Position',bbox (1, :), 'LineWidth', 2, 'Edgecolor', [1 1 0]) 

noseDetector = vision.CascadeobjectDetector('Nose','UseROI', true);

noseBBOX = step(noseDetector, videoFrame, bbox (1,:));

tracker=vision.HistogramBasedTracker;

initializeobject (tracker, hue, noseBBox (1,:)); 
videoInfo = info(videoFileReader);

videoPlayer = vision. Videoplayer('Position', [300 300 videoInfo.videosize+30]);

while ~isDone(videoFileReader)
videoFrame = step(videoFileReader); 
[hue,~,~]=rgb2hsv(videoFrame);
bbox = step(tracker, hue); 
videoOut = insertobjectAnnotation(videoFrame,'rectangle',bbox,'Face'); 
step(videoPlayer, videoOut);
end

release(videoFileReader); 
release (videoplayer);