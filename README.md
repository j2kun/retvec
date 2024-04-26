## Using IREE import from tf

Always outputs bytecode, not textual MLIR.

```bash
iree-import-tf \
  --tf-import-type=savedmodel_v1 \
  --tf-savedmodel-exported-names=serving_default \
  . -o retvec.stablehlo.mlir.bytecode
```

Convert to textual MLIR:

```bash
iree-ir-tool cp -o retvec.stablehlo.mlir retvec.stablehlo.mlir.bytecode
```
