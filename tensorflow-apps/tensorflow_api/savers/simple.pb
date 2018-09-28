node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
          dim {
            size: 1
          }
        }
        tensor_content: "\000\000\200?\000\000\000@\000\000@@\000\000\200@"
      }
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 4
          }
          dim {
            size: 1
          }
        }
        tensor_content: "\000\000\000\000\000\000\200\277\000\000\000\300\000\000@\300"
      }
    }
  }
}
node {
  name: "Variable/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "Variable/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "Variable_1/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable_1/Assign"
  op: "Assign"
  input: "Variable_1"
  input: "Variable_1/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable_1/read"
  op: "Identity"
  input: "Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
}
node {
  name: "Mul"
  op: "Mul"
  input: "Const"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "out"
  op: "Add"
  input: "Mul"
  input: "Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/SquaredDifference"
  op: "SquaredDifference"
  input: "out"
  input: "Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/weights"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/values/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "mean_squared_error/ToFloat/x"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/Mul"
  op: "Mul"
  input: "mean_squared_error/SquaredDifference"
  input: "mean_squared_error/ToFloat/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/Sum"
  op: "Sum"
  input: "mean_squared_error/Mul"
  input: "mean_squared_error/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error/num_present/Equal/y"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/Equal"
  op: "Equal"
  input: "mean_squared_error/ToFloat/x"
  input: "mean_squared_error/num_present/Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/num_present/zeros_like"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/ones_like"
  op: "Fill"
  input: "mean_squared_error/num_present/ones_like/Shape"
  input: "mean_squared_error/num_present/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error/num_present/Select"
  op: "Select"
  input: "mean_squared_error/num_present/Equal"
  input: "mean_squared_error/num_present/zeros_like"
  input: "mean_squared_error/num_present/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/values/shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  input: "^mean_squared_error/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  input: "^mean_squared_error/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/ones_like"
  op: "Fill"
  input: "mean_squared_error/num_present/broadcast_weights/ones_like/Shape"
  input: "mean_squared_error/num_present/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights"
  op: "Mul"
  input: "mean_squared_error/num_present/Select"
  input: "mean_squared_error/num_present/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/num_present/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present"
  op: "Sum"
  input: "mean_squared_error/num_present/broadcast_weights"
  input: "mean_squared_error/num_present/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error/Const_1"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/Sum_1"
  op: "Sum"
  input: "mean_squared_error/Sum"
  input: "mean_squared_error/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error/Greater/y"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/Greater"
  op: "Greater"
  input: "mean_squared_error/num_present"
  input: "mean_squared_error/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/Equal/y"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/Equal"
  op: "Equal"
  input: "mean_squared_error/num_present"
  input: "mean_squared_error/Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/ones_like"
  op: "Fill"
  input: "mean_squared_error/ones_like/Shape"
  input: "mean_squared_error/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error/Select"
  op: "Select"
  input: "mean_squared_error/Equal"
  input: "mean_squared_error/ones_like"
  input: "mean_squared_error/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/div"
  op: "RealDiv"
  input: "mean_squared_error/Sum_1"
  input: "mean_squared_error/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/zeros_like"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/value"
  op: "Select"
  input: "mean_squared_error/Greater"
  input: "mean_squared_error/div"
  input: "mean_squared_error/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/zeros_like"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Select"
  op: "Select"
  input: "mean_squared_error/Greater"
  input: "gradients/Fill"
  input: "gradients/mean_squared_error/value_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Select_1"
  op: "Select"
  input: "mean_squared_error/Greater"
  input: "gradients/mean_squared_error/value_grad/zeros_like"
  input: "gradients/Fill"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/value_grad/Select"
  input: "^gradients/mean_squared_error/value_grad/Select_1"
}
node {
  name: "gradients/mean_squared_error/value_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/value_grad/Select"
  input: "^gradients/mean_squared_error/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/value_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/value_grad/Select_1"
  input: "^gradients/mean_squared_error/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/value_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mean_squared_error/div_grad/Shape"
  input: "gradients/mean_squared_error/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/RealDiv"
  op: "RealDiv"
  input: "gradients/mean_squared_error/value_grad/tuple/control_dependency"
  input: "mean_squared_error/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/div_grad/RealDiv"
  input: "gradients/mean_squared_error/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/div_grad/Sum"
  input: "gradients/mean_squared_error/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Neg"
  op: "Neg"
  input: "mean_squared_error/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "gradients/mean_squared_error/div_grad/Neg"
  input: "mean_squared_error/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "gradients/mean_squared_error/div_grad/RealDiv_1"
  input: "mean_squared_error/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/mul"
  op: "Mul"
  input: "gradients/mean_squared_error/value_grad/tuple/control_dependency"
  input: "gradients/mean_squared_error/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/div_grad/mul"
  input: "gradients/mean_squared_error/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mean_squared_error/div_grad/Sum_1"
  input: "gradients/mean_squared_error/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/div_grad/Reshape"
  input: "^gradients/mean_squared_error/div_grad/Reshape_1"
}
node {
  name: "gradients/mean_squared_error/div_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/div_grad/Reshape"
  input: "^gradients/mean_squared_error/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/div_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/div_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/div_grad/Reshape_1"
  input: "^gradients/mean_squared_error/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/div_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/div_grad/tuple/control_dependency"
  input: "gradients/mean_squared_error/Sum_1_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Tile"
  op: "Tile"
  input: "gradients/mean_squared_error/Sum_1_grad/Reshape"
  input: "gradients/mean_squared_error/Sum_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/Sum_1_grad/Tile"
  input: "gradients/mean_squared_error/Sum_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Tile"
  op: "Tile"
  input: "gradients/mean_squared_error/Sum_grad/Reshape"
  input: "gradients/mean_squared_error/Sum_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mean_squared_error/Mul_grad/Shape"
  input: "gradients/mean_squared_error/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Mul"
  op: "Mul"
  input: "gradients/mean_squared_error/Sum_grad/Tile"
  input: "mean_squared_error/ToFloat/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/Mul_grad/Mul"
  input: "gradients/mean_squared_error/Mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/Mul_grad/Sum"
  input: "gradients/mean_squared_error/Mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Mul_1"
  op: "Mul"
  input: "mean_squared_error/SquaredDifference"
  input: "gradients/mean_squared_error/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/Mul_grad/Mul_1"
  input: "gradients/mean_squared_error/Mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mean_squared_error/Mul_grad/Sum_1"
  input: "gradients/mean_squared_error/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/Mul_grad/Reshape"
  input: "^gradients/mean_squared_error/Mul_grad/Reshape_1"
}
node {
  name: "gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/Mul_grad/Reshape"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/Mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/Mul_grad/Reshape_1"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/Mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/mul"
  op: "Mul"
  input: "gradients/mean_squared_error/SquaredDifference_grad/scalar"
  input: "gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/sub"
  op: "Sub"
  input: "out"
  input: "Const_1"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/mean_squared_error/SquaredDifference_grad/mul"
  input: "gradients/mean_squared_error/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/mul_1"
  input: "gradients/mean_squared_error/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/mul_1"
  input: "gradients/mean_squared_error/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Sum_1"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/Neg"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Reshape"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Neg"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/out_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/out_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/out_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/out_grad/Shape"
  input: "gradients/out_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/out_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/out_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/out_grad/Reshape"
  op: "Reshape"
  input: "gradients/out_grad/Sum"
  input: "gradients/out_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/out_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/out_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/out_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/out_grad/Sum_1"
  input: "gradients/out_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/out_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/out_grad/Reshape"
  input: "^gradients/out_grad/Reshape_1"
}
node {
  name: "gradients/out_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/out_grad/Reshape"
  input: "^gradients/out_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/out_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/out_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/out_grad/Reshape_1"
  input: "^gradients/out_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/out_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/Mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/Mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/Mul_grad/Shape"
  input: "gradients/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_grad/Mul"
  op: "Mul"
  input: "gradients/out_grad/tuple/control_dependency"
  input: "Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_grad/Sum"
  op: "Sum"
  input: "gradients/Mul_grad/Mul"
  input: "gradients/Mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/Mul_grad/Sum"
  input: "gradients/Mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_grad/Mul_1"
  op: "Mul"
  input: "Const"
  input: "gradients/out_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/Mul_grad/Mul_1"
  input: "gradients/Mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/Mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/Mul_grad/Sum_1"
  input: "gradients/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/Mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/Mul_grad/Reshape"
  input: "^gradients/Mul_grad/Reshape_1"
}
node {
  name: "gradients/Mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/Mul_grad/Reshape"
  input: "^gradients/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/Mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/Mul_grad/Reshape_1"
  input: "^gradients/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "GradientDescent/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "GradientDescent/update_Variable/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "Variable"
  input: "GradientDescent/learning_rate"
  input: "gradients/Mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent/update_Variable_1/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "Variable_1"
  input: "GradientDescent/learning_rate"
  input: "gradients/out_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent"
  op: "NoOp"
  input: "^GradientDescent/update_Variable/ApplyGradientDescent"
  input: "^GradientDescent/update_Variable_1/ApplyGradientDescent"
}
node {
  name: "init"
  op: "NoOp"
  input: "^Variable/Assign"
  input: "^Variable_1/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 2
          }
        }
        string_val: "Variable"
        string_val: "Variable_1"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 2
          }
        }
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "Variable"
  input: "Variable_1"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 2
          }
        }
        string_val: "Variable"
        string_val: "Variable_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 2
          }
        }
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "Variable"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "Variable_1"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
}
versions {
  producer: 26
}
