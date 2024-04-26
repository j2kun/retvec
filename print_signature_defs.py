import tensorflow.compat.v2 as tf

loaded_model = tf.saved_model.load('.')
print(list(loaded_model.signatures.keys()))
