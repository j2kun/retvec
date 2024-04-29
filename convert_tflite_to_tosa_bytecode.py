import tensorflow as tf

tf.mlir.experimental.tflite_to_tosa_bytecode(
    'retvec.tflite',
    'retvec.tosa.mlir')
