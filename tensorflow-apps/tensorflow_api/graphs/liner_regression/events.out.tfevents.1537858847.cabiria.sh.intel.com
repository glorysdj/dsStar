       �K"	  �Gw��Abrain.Event:2�t8��      ���/	�
�Gw��A"�;
F
XPlaceholder*
dtype0*
_output_shapes
:*
shape:
F
YPlaceholder*
dtype0*
_output_shapes
:*
shape:
Y
weight/initial_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
j
weight
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
�
weight/AssignAssignweightweight/initial_value*
T0*
_class
loc:@weight*
validate_shape(*
_output_shapes
: *
use_locking(
[
weight/readIdentityweight*
T0*
_class
loc:@weight*
_output_shapes
: 
W
bias/initial_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
h
bias
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
�
bias/AssignAssignbiasbias/initial_value*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
: *
use_locking(
U
	bias/readIdentitybias*
T0*
_class
	loc:@bias*
_output_shapes
: 
=
mulMulXweight/read*
T0*
_output_shapes
:
=
addAddmul	bias/read*
T0*
_output_shapes
:
5
subSubYadd*
T0*
_output_shapes
:
6
lossSquaresub*
T0*
_output_shapes
:
\
gradients/ShapeShapeloss*
T0*
out_type0*#
_output_shapes
:���������
X
gradients/grad_ys_0Const*
valueB
 *  �?*
dtype0*
_output_shapes
: 
q
gradients/FillFillgradients/Shapegradients/grad_ys_0*
_output_shapes
:*
T0*

index_type0
o
gradients/loss_grad/ConstConst^gradients/Fill*
dtype0*
_output_shapes
: *
valueB
 *   @
a
gradients/loss_grad/MulMulsubgradients/loss_grad/Const*
_output_shapes
:*
T0
l
gradients/loss_grad/Mul_1Mulgradients/Fillgradients/loss_grad/Mul*
T0*
_output_shapes
:
b
gradients/sub_grad/ShapeShapeY*
T0*
out_type0*#
_output_shapes
:���������
f
gradients/sub_grad/Shape_1Shapeadd*#
_output_shapes
:���������*
T0*
out_type0
�
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*2
_output_shapes 
:���������:���������*
T0
�
gradients/sub_grad/SumSumgradients/loss_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
_output_shapes
:*
T0*
Tshape0
�
gradients/sub_grad/Sum_1Sumgradients/loss_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
_output_shapes
:*
T0
�
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
�
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/sub_grad/Reshape*
_output_shapes
:
�
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*
_output_shapes
:
d
gradients/add_grad/ShapeShapemul*
T0*
out_type0*#
_output_shapes
:���������
]
gradients/add_grad/Shape_1Const*
valueB *
dtype0*
_output_shapes
: 
�
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*2
_output_shapes 
:���������:���������*
T0
�
gradients/add_grad/SumSum-gradients/sub_grad/tuple/control_dependency_1(gradients/add_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
�
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*
_output_shapes
:
�
gradients/add_grad/Sum_1Sum-gradients/sub_grad/tuple/control_dependency_1*gradients/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
�
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*
_output_shapes
:
�
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*
_output_shapes
: 
b
gradients/mul_grad/ShapeShapeX*#
_output_shapes
:���������*
T0*
out_type0
]
gradients/mul_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1*2
_output_shapes 
:���������:���������*
T0
z
gradients/mul_grad/MulMul+gradients/add_grad/tuple/control_dependencyweight/read*
_output_shapes
:*
T0
�
gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape*
T0*
Tshape0*
_output_shapes
:
r
gradients/mul_grad/Mul_1MulX+gradients/add_grad/tuple/control_dependency*
_output_shapes
:*
T0
�
gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
g
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1
�
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_grad/Reshape*
_output_shapes
:
�
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1*
_output_shapes
: 
b
GradientDescent/learning_rateConst*
valueB
 *o�:*
dtype0*
_output_shapes
: 
�
2GradientDescent/update_weight/ApplyGradientDescentApplyGradientDescentweightGradientDescent/learning_rate-gradients/mul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight*
_output_shapes
: 
�
0GradientDescent/update_bias/ApplyGradientDescentApplyGradientDescentbiasGradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1*
T0*
_class
	loc:@bias*
_output_shapes
: *
use_locking( 

GradientDescentNoOp1^GradientDescent/update_bias/ApplyGradientDescent3^GradientDescent/update_weight/ApplyGradientDescent
*
initNoOp^bias/Assign^weight/Assign"��G�O$      �X�	6W�Gw��AJ�H
�
�

:
Add
x"T
y"T
z"T"
Ttype:
2	
�
ApplyGradientDescent
var"T�

alpha"T

delta"T
out"T�" 
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
=
Mul
x"T
y"T
z"T"
Ttype:
2	�
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
1
Square
x"T
y"T"
Ttype:

2	
:
Sub
x"T
y"T
z"T"
Ttype:
2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �*1.10.02v1.10.0-rc1-19-g656e7a2b34�;
F
XPlaceholder*
dtype0*
_output_shapes
:*
shape:
F
YPlaceholder*
shape:*
dtype0*
_output_shapes
:
Y
weight/initial_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
j
weight
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
�
weight/AssignAssignweightweight/initial_value*
use_locking(*
T0*
_class
loc:@weight*
validate_shape(*
_output_shapes
: 
[
weight/readIdentityweight*
T0*
_class
loc:@weight*
_output_shapes
: 
W
bias/initial_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
h
bias
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
�
bias/AssignAssignbiasbias/initial_value*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
: 
U
	bias/readIdentitybias*
T0*
_class
	loc:@bias*
_output_shapes
: 
=
mulMulXweight/read*
_output_shapes
:*
T0
=
addAddmul	bias/read*
T0*
_output_shapes
:
5
subSubYadd*
T0*
_output_shapes
:
6
lossSquaresub*
T0*
_output_shapes
:
\
gradients/ShapeShapeloss*
T0*
out_type0*#
_output_shapes
:���������
X
gradients/grad_ys_0Const*
dtype0*
_output_shapes
: *
valueB
 *  �?
q
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0*
_output_shapes
:
o
gradients/loss_grad/ConstConst^gradients/Fill*
dtype0*
_output_shapes
: *
valueB
 *   @
a
gradients/loss_grad/MulMulsubgradients/loss_grad/Const*
T0*
_output_shapes
:
l
gradients/loss_grad/Mul_1Mulgradients/Fillgradients/loss_grad/Mul*
T0*
_output_shapes
:
b
gradients/sub_grad/ShapeShapeY*
T0*
out_type0*#
_output_shapes
:���������
f
gradients/sub_grad/Shape_1Shapeadd*#
_output_shapes
:���������*
T0*
out_type0
�
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
gradients/sub_grad/SumSumgradients/loss_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
�
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
T0*
Tshape0*
_output_shapes
:
�
gradients/sub_grad/Sum_1Sumgradients/loss_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0*
_output_shapes
:
�
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
�
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*
_output_shapes
:*
T0*-
_class#
!loc:@gradients/sub_grad/Reshape
�
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*
_output_shapes
:*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1
d
gradients/add_grad/ShapeShapemul*
T0*
out_type0*#
_output_shapes
:���������
]
gradients/add_grad/Shape_1Const*
valueB *
dtype0*
_output_shapes
: 
�
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
gradients/add_grad/SumSum-gradients/sub_grad/tuple/control_dependency_1(gradients/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
_output_shapes
:*
T0*
Tshape0
�
gradients/add_grad/Sum_1Sum-gradients/sub_grad/tuple/control_dependency_1*gradients/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
�
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
_output_shapes
:*
T0*-
_class#
!loc:@gradients/add_grad/Reshape
�
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*
_output_shapes
: 
b
gradients/mul_grad/ShapeShapeX*#
_output_shapes
:���������*
T0*
out_type0
]
gradients/mul_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
z
gradients/mul_grad/MulMul+gradients/add_grad/tuple/control_dependencyweight/read*
T0*
_output_shapes
:
�
gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape*
T0*
Tshape0*
_output_shapes
:
r
gradients/mul_grad/Mul_1MulX+gradients/add_grad/tuple/control_dependency*
_output_shapes
:*
T0
�
gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
�
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 
g
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1
�
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps*
_output_shapes
:*
T0*-
_class#
!loc:@gradients/mul_grad/Reshape
�
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1*
_output_shapes
: 
b
GradientDescent/learning_rateConst*
valueB
 *o�:*
dtype0*
_output_shapes
: 
�
2GradientDescent/update_weight/ApplyGradientDescentApplyGradientDescentweightGradientDescent/learning_rate-gradients/mul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight*
_output_shapes
: 
�
0GradientDescent/update_bias/ApplyGradientDescentApplyGradientDescentbiasGradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
	loc:@bias*
_output_shapes
: 

GradientDescentNoOp1^GradientDescent/update_bias/ApplyGradientDescent3^GradientDescent/update_weight/ApplyGradientDescent
*
initNoOp^bias/Assign^weight/Assign""�
trainable_variables��
B
weight:0weight/Assignweight/read:02weight/initial_value:08
:
bias:0bias/Assignbias/read:02bias/initial_value:08"
train_op

GradientDescent"�
	variables��
B
weight:0weight/Assignweight/read:02weight/initial_value:08
:
bias:0bias/Assignbias/read:02bias/initial_value:08��fg