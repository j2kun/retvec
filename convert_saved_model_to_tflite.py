import tensorflow as tf

converter = tf.lite.TFLiteConverter.from_saved_model('.') # path to the SavedModel directory
tflite_model = converter.convert()

with open('retvec.tflite', 'wb') as f:
  f.write(tflite_model)
