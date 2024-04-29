import tensorflow.compat.v2 as tf

loaded_model = tf.saved_model.load('.')
# only signature should be 'serving_default'
# print(list(loaded_model.signatures.keys()))

# trying this with convert_graph_def failed...
# default_graph = tf.compat.v1.get_default_graph()
# loaded_model.signatures['serving_default'].add_to_graph(default_graph)
# graph_def = default_graph.as_graph_def()

func = loaded_model.signatures['serving_default']

# change first batch dimension to fixed size instead of variable size
# doesn't work
# func.inputs[0].set_shape([1, 16, 24])

# Convert to MLIR with TOSA conversion
mlir = tf.mlir.experimental.convert_function(
    func,
    pass_pipeline='tf-standard-pipeline, func.func(tosa-legalize-tf)',
)

print(mlir)
