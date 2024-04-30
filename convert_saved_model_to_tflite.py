import numpy as np
import tensorflow as tf

converter = tf.lite.TFLiteConverter.from_saved_model(
    '.'
)  # path to the SavedModel directory


def representative_data_gen():
  for _ in range(200):
    yield {
        'args_0': tf.cast(
            tf.random.uniform(
                (16, 24),
                minval=0,
                maxval=2,
                dtype=tf.dtypes.int32,
            ),
            tf.float32,
        )
    }


converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.representative_dataset = representative_data_gen
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.int8  # or tf.uint8
converter.inference_output_type = tf.int8  # or tf.uint8
tflite_model = converter.convert()

with open('retvec.tflite', 'wb') as f:
  f.write(tflite_model)
