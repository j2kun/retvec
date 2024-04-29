import os
import tensorflow as tf
import tf2onnx
import numpy as np
import os

'''
tf2onnx only supports old versions of protobuf, so you must downgrade protobuf
to install tf2onnx
'''

os.system("python -m tf2onnx.convert --saved-model . --output retvec.onnx")
