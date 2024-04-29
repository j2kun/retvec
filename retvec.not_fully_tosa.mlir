module attributes {tf.versions = {bad_consumers = [], min_consumer = 0 : i32, producer = 1766 : i32}} {
  func.func @__inference_signature_wrapper_69(%arg0: tensor<?x16x24xf32> {tf._user_specified_name = "args_0"}, %arg1: tensor<*x!tf_type.resource>, %arg2: tensor<*x!tf_type.resource>, %arg3: tensor<*x!tf_type.resource>, %arg4: tensor<*x!tf_type.resource>, %arg5: tensor<*x!tf_type.resource>, %arg6: tensor<*x!tf_type.resource>) -> tensor<?x?xf32> attributes {allow_soft_placement = false, tf.entry_function = {control_outputs = "StatefulPartitionedCall", inputs = "args_0,unknown,unknown_0,unknown_1,unknown_2,unknown_3,unknown_4", outputs = "identity_RetVal"}} {
    %0 = "tf.StatefulPartitionedCall"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{config = "", config_proto = "\0A\07\0A\03CPU\10\01\0A\07\0A\03GPU\10\012\07 \01*\010J\008\01\82\01\00", executor_type = "", f = @__inference__wrapped_model_580}> {_collective_manager_ids = [], _read_only_resource_inputs = [1, 2, 3, 4, 5, 6], device = ""} : (tensor<?x16x24xf32>, tensor<*x!tf_type.resource>, tensor<*x!tf_type.resource>, tensor<*x!tf_type.resource>, tensor<*x!tf_type.resource>, tensor<*x!tf_type.resource>, tensor<*x!tf_type.resource>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func private @__inference__wrapped_model_580(%arg0: tensor<?x16x24xf32> {tf._user_specified_name = "args_0"}, %arg1: tensor<*x!tf_type.resource>, %arg2: tensor<*x!tf_type.resource>, %arg3: tensor<*x!tf_type.resource>, %arg4: tensor<*x!tf_type.resource>, %arg5: tensor<*x!tf_type.resource>, %arg6: tensor<*x!tf_type.resource>) -> tensor<?x?xf32> attributes {tf._construction_context = "kEagerRuntime", tf.signature.is_stateful} {
    %0 = "tosa.const"() <{value = dense<0.707106769> : tensor<f32>}> : () -> tensor<f32>
    %1 = "tosa.const"() <{value = dense<5.000000e-01> : tensor<f32>}> : () -> tensor<f32>
    %2 = "tosa.const"() <{value = dense<1.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %3 = tosa.reshape %arg0 {new_shape = array<i64: -9223372036854775808, 384>} : (tensor<?x16x24xf32>) -> tensor<?x384xf32>
    %4 = "tf.ReadVariableOp"(%arg2) {device = ""} : (tensor<*x!tf_type.resource>) -> tensor<*xf32>
    %5 = "tf.ReadVariableOp"(%arg1) {device = ""} : (tensor<*x!tf_type.resource>) -> tensor<*xf32>
    %6 = "tf.MatMul"(%3, %5) <{grad_a = false, grad_b = false, transpose_a = false, transpose_b = false}> {device = ""} : (tensor<?x384xf32>, tensor<*xf32>) -> tensor<?x?xf32>
    %7 = tosa.add %6, %4 : (tensor<?x?xf32>, tensor<*xf32>) -> tensor<?x?xf32>
    %8 = tosa.mul %7, %1 {shift = 0 : i8} : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
    %9 = tosa.mul %7, %0 {shift = 0 : i8} : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
    %10 = tosa.erf %9 : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %11 = tosa.add %10, %2 : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
    %12 = tosa.mul %8, %11 {shift = 0 : i8} : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %13 = "tf.ReadVariableOp"(%arg4) {device = ""} : (tensor<*x!tf_type.resource>) -> tensor<*xf32>
    %14 = "tf.ReadVariableOp"(%arg3) {device = ""} : (tensor<*x!tf_type.resource>) -> tensor<*xf32>
    %15 = "tf.MatMul"(%12, %14) <{grad_a = false, grad_b = false, transpose_a = false, transpose_b = false}> {device = ""} : (tensor<?x?xf32>, tensor<*xf32>) -> tensor<?x?xf32>
    %16 = tosa.add %15, %13 : (tensor<?x?xf32>, tensor<*xf32>) -> tensor<?x?xf32>
    %17 = tosa.mul %16, %1 {shift = 0 : i8} : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
    %18 = tosa.mul %16, %0 {shift = 0 : i8} : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
    %19 = tosa.erf %18 : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %20 = tosa.add %19, %2 : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
    %21 = tosa.mul %17, %20 {shift = 0 : i8} : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %22 = "tf.ReadVariableOp"(%arg6) {device = ""} : (tensor<*x!tf_type.resource>) -> tensor<*xf32>
    %23 = "tf.ReadVariableOp"(%arg5) {device = ""} : (tensor<*x!tf_type.resource>) -> tensor<*xf32>
    %24 = "tf.MatMul"(%21, %23) <{grad_a = false, grad_b = false, transpose_a = false, transpose_b = false}> {device = ""} : (tensor<?x?xf32>, tensor<*xf32>) -> tensor<?x?xf32>
    %25 = tosa.add %24, %22 : (tensor<?x?xf32>, tensor<*xf32>) -> tensor<?x?xf32>
    %26 = tosa.tanh %25 : (tensor<?x?xf32>) -> tensor<?x?xf32>
    return %26 : tensor<?x?xf32>
  }
}

