import tensorflow as tf

# pass the directory containing saved_model.pb
# and the name of the entry function to export
mlir_str = tf.mlir.experimental.convert_saved_model(
    '.', exported_names='serving_default'
)

with open('retvec.mlir', 'w') as outfile:
  outfile.write(mlir_str)
