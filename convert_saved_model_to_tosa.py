import tensorflow.compat.v2 as tf

loaded_model = tf.saved_model.load('.')
print(list(loaded_model.signatures.keys()))

graph_def = tf.compat.v1.get_default_graph().as_graph_def()

# Convert to MLIR with TOSA conversion
mlir = tf.mlir.experimental.convert_graph_def(
    graph_def,
    pass_pipeline='tf-standard-pipeline, func.func(tosa-legalize-tf)',
    show_debug_info=False,
)

print(mlir)
