       £K"	  ©wźÖAbrain.Event:2Ńo_@AW      36	Ņ©wźÖA"“®
d
XPlaceholder*
dtype0*'
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’
d
YPlaceholder*
shape:’’’’’’’’’*
dtype0*'
_output_shapes
:’’’’’’’’’
]
random_normal/shapeConst*
valueB:*
dtype0*
_output_shapes
:
W
random_normal/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
Y
random_normal/stddevConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

"random_normal/RandomStandardNormalRandomStandardNormalrandom_normal/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
w
random_normal/mulMul"random_normal/RandomStandardNormalrandom_normal/stddev*
T0*
_output_shapes
:
`
random_normalAddrandom_normal/mulrandom_normal/mean*
T0*
_output_shapes
:
u
	weights_1
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
 
weights_1/AssignAssign	weights_1random_normal*
use_locking(*
T0*
_class
loc:@weights_1*
validate_shape(*
_output_shapes
:
h
weights_1/readIdentity	weights_1*
T0*
_class
loc:@weights_1*
_output_shapes
:
_
random_normal_1/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_1/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_1/RandomStandardNormalRandomStandardNormalrandom_normal_1/shape*
dtype0*
_output_shapes
:*
seed2 *

seed *
T0
}
random_normal_1/mulMul$random_normal_1/RandomStandardNormalrandom_normal_1/stddev*
T0*
_output_shapes
:
f
random_normal_1Addrandom_normal_1/mulrandom_normal_1/mean*
T0*
_output_shapes
:
u
	weights_2
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
¢
weights_2/AssignAssign	weights_2random_normal_1*
T0*
_class
loc:@weights_2*
validate_shape(*
_output_shapes
:*
use_locking(
h
weights_2/readIdentity	weights_2*
_output_shapes
:*
T0*
_class
loc:@weights_2
_
random_normal_2/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_2/stddevConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

$random_normal_2/RandomStandardNormalRandomStandardNormalrandom_normal_2/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_2/mulMul$random_normal_2/RandomStandardNormalrandom_normal_2/stddev*
T0*
_output_shapes
:
f
random_normal_2Addrandom_normal_2/mulrandom_normal_2/mean*
T0*
_output_shapes
:
p
bias
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:

bias/AssignAssignbiasrandom_normal_2*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:*
use_locking(
Y
	bias/readIdentitybias*
T0*
_class
	loc:@bias*
_output_shapes
:
B
mulMulXX*
T0*'
_output_shapes
:’’’’’’’’’
S
mul_1Mulmulweights_1/read*'
_output_shapes
:’’’’’’’’’*
T0
Q
mul_2MulXweights_2/read*
T0*'
_output_shapes
:’’’’’’’’’
J
addAddmul_1mul_2*
T0*'
_output_shapes
:’’’’’’’’’
N
add_1Addadd	bias/read*
T0*'
_output_shapes
:’’’’’’’’’
F
subSubYadd_1*
T0*'
_output_shapes
:’’’’’’’’’
G
SquareSquaresub*'
_output_shapes
:’’’’’’’’’*
T0
V
ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Y
MeanMeanSquareConst*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
X
gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
_output_shapes
: *
T0*

index_type0
r
!gradients/Mean_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes

:
_
gradients/Mean_grad/ShapeShapeSquare*
T0*
out_type0*
_output_shapes
:

gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:’’’’’’’’’
a
gradients/Mean_grad/Shape_1ShapeSquare*
_output_shapes
:*
T0*
out_type0
^
gradients/Mean_grad/Shape_2Const*
dtype0*
_output_shapes
: *
valueB 
c
gradients/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:

gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:

gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
_
gradients/Mean_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :

gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
_output_shapes
: *
T0

gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
_output_shapes
: *
T0
n
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0

gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*'
_output_shapes
:’’’’’’’’’
~
gradients/Square_grad/ConstConst^gradients/Mean_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
t
gradients/Square_grad/MulMulsubgradients/Square_grad/Const*'
_output_shapes
:’’’’’’’’’*
T0

gradients/Square_grad/Mul_1Mulgradients/Mean_grad/truedivgradients/Square_grad/Mul*
T0*'
_output_shapes
:’’’’’’’’’
Y
gradients/sub_grad/ShapeShapeY*
_output_shapes
:*
T0*
out_type0
_
gradients/sub_grad/Shape_1Shapeadd_1*
T0*
out_type0*
_output_shapes
:
“
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’*
T0
¤
gradients/sub_grad/SumSumgradients/Square_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
Ø
gradients/sub_grad/Sum_1Sumgradients/Square_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1*
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

gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
Ś
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/sub_grad/Reshape*'
_output_shapes
:’’’’’’’’’
ą
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*'
_output_shapes
:’’’’’’’’’
]
gradients/add_1_grad/ShapeShapeadd*
T0*
out_type0*
_output_shapes
:
f
gradients/add_1_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ŗ
*gradients/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_1_grad/Shapegradients/add_1_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
ŗ
gradients/add_1_grad/SumSum-gradients/sub_grad/tuple/control_dependency_1*gradients/add_1_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients/add_1_grad/ReshapeReshapegradients/add_1_grad/Sumgradients/add_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
¾
gradients/add_1_grad/Sum_1Sum-gradients/sub_grad/tuple/control_dependency_1,gradients/add_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:

gradients/add_1_grad/Reshape_1Reshapegradients/add_1_grad/Sum_1gradients/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/add_1_grad/tuple/group_depsNoOp^gradients/add_1_grad/Reshape^gradients/add_1_grad/Reshape_1
ā
-gradients/add_1_grad/tuple/control_dependencyIdentitygradients/add_1_grad/Reshape&^gradients/add_1_grad/tuple/group_deps*'
_output_shapes
:’’’’’’’’’*
T0*/
_class%
#!loc:@gradients/add_1_grad/Reshape
Ū
/gradients/add_1_grad/tuple/control_dependency_1Identitygradients/add_1_grad/Reshape_1&^gradients/add_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_1_grad/Reshape_1*
_output_shapes
:
]
gradients/add_grad/ShapeShapemul_1*
_output_shapes
:*
T0*
out_type0
_
gradients/add_grad/Shape_1Shapemul_2*
T0*
out_type0*
_output_shapes
:
“
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’*
T0
¶
gradients/add_grad/SumSum-gradients/add_1_grad/tuple/control_dependency(gradients/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
ŗ
gradients/add_grad/Sum_1Sum-gradients/add_1_grad/tuple/control_dependency*gradients/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
Ś
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*'
_output_shapes
:’’’’’’’’’
ą
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*'
_output_shapes
:’’’’’’’’’
]
gradients/mul_1_grad/ShapeShapemul*
T0*
out_type0*
_output_shapes
:
f
gradients/mul_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ŗ
*gradients/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_1_grad/Shapegradients/mul_1_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

gradients/mul_1_grad/MulMul+gradients/add_grad/tuple/control_dependencyweights_1/read*'
_output_shapes
:’’’’’’’’’*
T0
„
gradients/mul_1_grad/SumSumgradients/mul_1_grad/Mul*gradients/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/mul_1_grad/ReshapeReshapegradients/mul_1_grad/Sumgradients/mul_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’

gradients/mul_1_grad/Mul_1Mulmul+gradients/add_grad/tuple/control_dependency*
T0*'
_output_shapes
:’’’’’’’’’
«
gradients/mul_1_grad/Sum_1Sumgradients/mul_1_grad/Mul_1,gradients/mul_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients/mul_1_grad/Reshape_1Reshapegradients/mul_1_grad/Sum_1gradients/mul_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/mul_1_grad/tuple/group_depsNoOp^gradients/mul_1_grad/Reshape^gradients/mul_1_grad/Reshape_1
ā
-gradients/mul_1_grad/tuple/control_dependencyIdentitygradients/mul_1_grad/Reshape&^gradients/mul_1_grad/tuple/group_deps*'
_output_shapes
:’’’’’’’’’*
T0*/
_class%
#!loc:@gradients/mul_1_grad/Reshape
Ū
/gradients/mul_1_grad/tuple/control_dependency_1Identitygradients/mul_1_grad/Reshape_1&^gradients/mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_1_grad/Reshape_1*
_output_shapes
:
[
gradients/mul_2_grad/ShapeShapeX*
T0*
out_type0*
_output_shapes
:
f
gradients/mul_2_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ŗ
*gradients/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_2_grad/Shapegradients/mul_2_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

gradients/mul_2_grad/MulMul-gradients/add_grad/tuple/control_dependency_1weights_2/read*
T0*'
_output_shapes
:’’’’’’’’’
„
gradients/mul_2_grad/SumSumgradients/mul_2_grad/Mul*gradients/mul_2_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/mul_2_grad/ReshapeReshapegradients/mul_2_grad/Sumgradients/mul_2_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’

gradients/mul_2_grad/Mul_1MulX-gradients/add_grad/tuple/control_dependency_1*
T0*'
_output_shapes
:’’’’’’’’’
«
gradients/mul_2_grad/Sum_1Sumgradients/mul_2_grad/Mul_1,gradients/mul_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients/mul_2_grad/Reshape_1Reshapegradients/mul_2_grad/Sum_1gradients/mul_2_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
m
%gradients/mul_2_grad/tuple/group_depsNoOp^gradients/mul_2_grad/Reshape^gradients/mul_2_grad/Reshape_1
ā
-gradients/mul_2_grad/tuple/control_dependencyIdentitygradients/mul_2_grad/Reshape&^gradients/mul_2_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_2_grad/Reshape*'
_output_shapes
:’’’’’’’’’
Ū
/gradients/mul_2_grad/tuple/control_dependency_1Identitygradients/mul_2_grad/Reshape_1&^gradients/mul_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_2_grad/Reshape_1*
_output_shapes
:
w
beta1_power/initial_valueConst*
_class
	loc:@bias*
valueB
 *fff?*
dtype0*
_output_shapes
: 

beta1_power
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *
_class
	loc:@bias
§
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
: 
c
beta1_power/readIdentitybeta1_power*
T0*
_class
	loc:@bias*
_output_shapes
: 
w
beta2_power/initial_valueConst*
_class
	loc:@bias*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

beta2_power
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
	loc:@bias*
	container *
shape: 
§
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
: 
c
beta2_power/readIdentitybeta2_power*
T0*
_class
	loc:@bias*
_output_shapes
: 

 weights_1/Adam/Initializer/zerosConst*
_class
loc:@weights_1*
valueB*    *
dtype0*
_output_shapes
:

weights_1/Adam
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
_class
loc:@weights_1*
	container *
shape:
½
weights_1/Adam/AssignAssignweights_1/Adam weights_1/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@weights_1*
validate_shape(*
_output_shapes
:
r
weights_1/Adam/readIdentityweights_1/Adam*
_output_shapes
:*
T0*
_class
loc:@weights_1

"weights_1/Adam_1/Initializer/zerosConst*
_class
loc:@weights_1*
valueB*    *
dtype0*
_output_shapes
:

weights_1/Adam_1
VariableV2*
shared_name *
_class
loc:@weights_1*
	container *
shape:*
dtype0*
_output_shapes
:
Ć
weights_1/Adam_1/AssignAssignweights_1/Adam_1"weights_1/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@weights_1*
validate_shape(*
_output_shapes
:
v
weights_1/Adam_1/readIdentityweights_1/Adam_1*
T0*
_class
loc:@weights_1*
_output_shapes
:

 weights_2/Adam/Initializer/zerosConst*
_class
loc:@weights_2*
valueB*    *
dtype0*
_output_shapes
:

weights_2/Adam
VariableV2*
shared_name *
_class
loc:@weights_2*
	container *
shape:*
dtype0*
_output_shapes
:
½
weights_2/Adam/AssignAssignweights_2/Adam weights_2/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@weights_2*
validate_shape(*
_output_shapes
:
r
weights_2/Adam/readIdentityweights_2/Adam*
T0*
_class
loc:@weights_2*
_output_shapes
:

"weights_2/Adam_1/Initializer/zerosConst*
_class
loc:@weights_2*
valueB*    *
dtype0*
_output_shapes
:

weights_2/Adam_1
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
_class
loc:@weights_2*
	container *
shape:
Ć
weights_2/Adam_1/AssignAssignweights_2/Adam_1"weights_2/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@weights_2*
validate_shape(*
_output_shapes
:
v
weights_2/Adam_1/readIdentityweights_2/Adam_1*
T0*
_class
loc:@weights_2*
_output_shapes
:

bias/Adam/Initializer/zerosConst*
_class
	loc:@bias*
valueB*    *
dtype0*
_output_shapes
:

	bias/Adam
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name *
_class
	loc:@bias
©
bias/Adam/AssignAssign	bias/Adambias/Adam/Initializer/zeros*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:*
use_locking(
c
bias/Adam/readIdentity	bias/Adam*
T0*
_class
	loc:@bias*
_output_shapes
:

bias/Adam_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
_class
	loc:@bias*
valueB*    

bias/Adam_1
VariableV2*
	container *
shape:*
dtype0*
_output_shapes
:*
shared_name *
_class
	loc:@bias
Æ
bias/Adam_1/AssignAssignbias/Adam_1bias/Adam_1/Initializer/zeros*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:*
use_locking(
g
bias/Adam_1/readIdentitybias/Adam_1*
_output_shapes
:*
T0*
_class
	loc:@bias
W
Adam/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *·Ń8
O

Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
O

Adam/beta2Const*
valueB
 *w¾?*
dtype0*
_output_shapes
: 
Q
Adam/epsilonConst*
valueB
 *wĢ+2*
dtype0*
_output_shapes
: 
Ņ
Adam/update_weights_1/ApplyAdam	ApplyAdam	weights_1weights_1/Adamweights_1/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/mul_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weights_1*
use_nesterov( *
_output_shapes
:
Ņ
Adam/update_weights_2/ApplyAdam	ApplyAdam	weights_2weights_2/Adamweights_2/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/mul_2_grad/tuple/control_dependency_1*
use_nesterov( *
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weights_2
¹
Adam/update_bias/ApplyAdam	ApplyAdambias	bias/Adambias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_1_grad/tuple/control_dependency_1*
T0*
_class
	loc:@bias*
use_nesterov( *
_output_shapes
:*
use_locking( 
Č
Adam/mulMulbeta1_power/read
Adam/beta1^Adam/update_bias/ApplyAdam ^Adam/update_weights_1/ApplyAdam ^Adam/update_weights_2/ApplyAdam*
_output_shapes
: *
T0*
_class
	loc:@bias

Adam/AssignAssignbeta1_powerAdam/mul*
use_locking( *
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
: 
Ź

Adam/mul_1Mulbeta2_power/read
Adam/beta2^Adam/update_bias/ApplyAdam ^Adam/update_weights_1/ApplyAdam ^Adam/update_weights_2/ApplyAdam*
_output_shapes
: *
T0*
_class
	loc:@bias

Adam/Assign_1Assignbeta2_power
Adam/mul_1*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*
_class
	loc:@bias

AdamNoOp^Adam/Assign^Adam/Assign_1^Adam/update_bias/ApplyAdam ^Adam/update_weights_1/ApplyAdam ^Adam/update_weights_2/ApplyAdam
ö
initNoOp^beta1_power/Assign^beta2_power/Assign^bias/Adam/Assign^bias/Adam_1/Assign^bias/Assign^weights_1/Adam/Assign^weights_1/Adam_1/Assign^weights_1/Assign^weights_2/Adam/Assign^weights_2/Adam_1/Assign^weights_2/Assign"&žx6ķd      V¹		Č©wźÖAJąÉ
ĻØ
:
Add
x"T
y"T
z"T"
Ttype:
2	
ī
	ApplyAdam
var"T	
m"T	
v"T
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"T" 
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
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
?
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
;
Maximum
x"T
y"T
z"T"
Ttype:

2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	
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

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	

RandomStandardNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
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

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring *1.10.02v1.10.0-rc1-19-g656e7a2b34“®
d
XPlaceholder*
dtype0*'
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’
d
YPlaceholder*
dtype0*'
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’
]
random_normal/shapeConst*
dtype0*
_output_shapes
:*
valueB:
W
random_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Y
random_normal/stddevConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

"random_normal/RandomStandardNormalRandomStandardNormalrandom_normal/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
w
random_normal/mulMul"random_normal/RandomStandardNormalrandom_normal/stddev*
T0*
_output_shapes
:
`
random_normalAddrandom_normal/mulrandom_normal/mean*
_output_shapes
:*
T0
u
	weights_1
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
 
weights_1/AssignAssign	weights_1random_normal*
use_locking(*
T0*
_class
loc:@weights_1*
validate_shape(*
_output_shapes
:
h
weights_1/readIdentity	weights_1*
T0*
_class
loc:@weights_1*
_output_shapes
:
_
random_normal_1/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_1/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_1/RandomStandardNormalRandomStandardNormalrandom_normal_1/shape*
dtype0*
_output_shapes
:*
seed2 *

seed *
T0
}
random_normal_1/mulMul$random_normal_1/RandomStandardNormalrandom_normal_1/stddev*
_output_shapes
:*
T0
f
random_normal_1Addrandom_normal_1/mulrandom_normal_1/mean*
T0*
_output_shapes
:
u
	weights_2
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
¢
weights_2/AssignAssign	weights_2random_normal_1*
T0*
_class
loc:@weights_2*
validate_shape(*
_output_shapes
:*
use_locking(
h
weights_2/readIdentity	weights_2*
T0*
_class
loc:@weights_2*
_output_shapes
:
_
random_normal_2/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_2/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_2/RandomStandardNormalRandomStandardNormalrandom_normal_2/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_2/mulMul$random_normal_2/RandomStandardNormalrandom_normal_2/stddev*
T0*
_output_shapes
:
f
random_normal_2Addrandom_normal_2/mulrandom_normal_2/mean*
T0*
_output_shapes
:
p
bias
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 

bias/AssignAssignbiasrandom_normal_2*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:
Y
	bias/readIdentitybias*
T0*
_class
	loc:@bias*
_output_shapes
:
B
mulMulXX*
T0*'
_output_shapes
:’’’’’’’’’
S
mul_1Mulmulweights_1/read*'
_output_shapes
:’’’’’’’’’*
T0
Q
mul_2MulXweights_2/read*
T0*'
_output_shapes
:’’’’’’’’’
J
addAddmul_1mul_2*
T0*'
_output_shapes
:’’’’’’’’’
N
add_1Addadd	bias/read*
T0*'
_output_shapes
:’’’’’’’’’
F
subSubYadd_1*
T0*'
_output_shapes
:’’’’’’’’’
G
SquareSquaresub*'
_output_shapes
:’’’’’’’’’*
T0
V
ConstConst*
valueB"       *
dtype0*
_output_shapes
:
Y
MeanMeanSquareConst*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
R
gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
X
gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
_output_shapes
: *
T0*

index_type0
r
!gradients/Mean_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
_output_shapes

:*
T0*
Tshape0
_
gradients/Mean_grad/ShapeShapeSquare*
T0*
out_type0*
_output_shapes
:

gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:’’’’’’’’’
a
gradients/Mean_grad/Shape_1ShapeSquare*
T0*
out_type0*
_output_shapes
:
^
gradients/Mean_grad/Shape_2Const*
valueB *
dtype0*
_output_shapes
: 
c
gradients/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:

gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
e
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:

gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
_
gradients/Mean_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :

gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
_output_shapes
: *
T0

gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
_output_shapes
: *
T0
n
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0

gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*'
_output_shapes
:’’’’’’’’’
~
gradients/Square_grad/ConstConst^gradients/Mean_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
t
gradients/Square_grad/MulMulsubgradients/Square_grad/Const*
T0*'
_output_shapes
:’’’’’’’’’

gradients/Square_grad/Mul_1Mulgradients/Mean_grad/truedivgradients/Square_grad/Mul*
T0*'
_output_shapes
:’’’’’’’’’
Y
gradients/sub_grad/ShapeShapeY*
T0*
out_type0*
_output_shapes
:
_
gradients/sub_grad/Shape_1Shapeadd_1*
T0*
out_type0*
_output_shapes
:
“
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
¤
gradients/sub_grad/SumSumgradients/Square_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
Ø
gradients/sub_grad/Sum_1Sumgradients/Square_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0*
_output_shapes
:

gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
Ś
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/sub_grad/Reshape*'
_output_shapes
:’’’’’’’’’
ą
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*'
_output_shapes
:’’’’’’’’’
]
gradients/add_1_grad/ShapeShapeadd*
T0*
out_type0*
_output_shapes
:
f
gradients/add_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ŗ
*gradients/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_1_grad/Shapegradients/add_1_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
ŗ
gradients/add_1_grad/SumSum-gradients/sub_grad/tuple/control_dependency_1*gradients/add_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/add_1_grad/ReshapeReshapegradients/add_1_grad/Sumgradients/add_1_grad/Shape*'
_output_shapes
:’’’’’’’’’*
T0*
Tshape0
¾
gradients/add_1_grad/Sum_1Sum-gradients/sub_grad/tuple/control_dependency_1,gradients/add_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:

gradients/add_1_grad/Reshape_1Reshapegradients/add_1_grad/Sum_1gradients/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/add_1_grad/tuple/group_depsNoOp^gradients/add_1_grad/Reshape^gradients/add_1_grad/Reshape_1
ā
-gradients/add_1_grad/tuple/control_dependencyIdentitygradients/add_1_grad/Reshape&^gradients/add_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_1_grad/Reshape*'
_output_shapes
:’’’’’’’’’
Ū
/gradients/add_1_grad/tuple/control_dependency_1Identitygradients/add_1_grad/Reshape_1&^gradients/add_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/add_1_grad/Reshape_1*
_output_shapes
:
]
gradients/add_grad/ShapeShapemul_1*
T0*
out_type0*
_output_shapes
:
_
gradients/add_grad/Shape_1Shapemul_2*
T0*
out_type0*
_output_shapes
:
“
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
¶
gradients/add_grad/SumSum-gradients/add_1_grad/tuple/control_dependency(gradients/add_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’
ŗ
gradients/add_grad/Sum_1Sum-gradients/add_1_grad/tuple/control_dependency*gradients/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*'
_output_shapes
:’’’’’’’’’*
T0*
Tshape0
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
Ś
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*'
_output_shapes
:’’’’’’’’’
ą
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1*'
_output_shapes
:’’’’’’’’’
]
gradients/mul_1_grad/ShapeShapemul*
_output_shapes
:*
T0*
out_type0
f
gradients/mul_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ŗ
*gradients/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_1_grad/Shapegradients/mul_1_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

gradients/mul_1_grad/MulMul+gradients/add_grad/tuple/control_dependencyweights_1/read*
T0*'
_output_shapes
:’’’’’’’’’
„
gradients/mul_1_grad/SumSumgradients/mul_1_grad/Mul*gradients/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/mul_1_grad/ReshapeReshapegradients/mul_1_grad/Sumgradients/mul_1_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’

gradients/mul_1_grad/Mul_1Mulmul+gradients/add_grad/tuple/control_dependency*
T0*'
_output_shapes
:’’’’’’’’’
«
gradients/mul_1_grad/Sum_1Sumgradients/mul_1_grad/Mul_1,gradients/mul_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:

gradients/mul_1_grad/Reshape_1Reshapegradients/mul_1_grad/Sum_1gradients/mul_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/mul_1_grad/tuple/group_depsNoOp^gradients/mul_1_grad/Reshape^gradients/mul_1_grad/Reshape_1
ā
-gradients/mul_1_grad/tuple/control_dependencyIdentitygradients/mul_1_grad/Reshape&^gradients/mul_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_1_grad/Reshape*'
_output_shapes
:’’’’’’’’’
Ū
/gradients/mul_1_grad/tuple/control_dependency_1Identitygradients/mul_1_grad/Reshape_1&^gradients/mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_1_grad/Reshape_1*
_output_shapes
:
[
gradients/mul_2_grad/ShapeShapeX*
_output_shapes
:*
T0*
out_type0
f
gradients/mul_2_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ŗ
*gradients/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_2_grad/Shapegradients/mul_2_grad/Shape_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

gradients/mul_2_grad/MulMul-gradients/add_grad/tuple/control_dependency_1weights_2/read*'
_output_shapes
:’’’’’’’’’*
T0
„
gradients/mul_2_grad/SumSumgradients/mul_2_grad/Mul*gradients/mul_2_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

gradients/mul_2_grad/ReshapeReshapegradients/mul_2_grad/Sumgradients/mul_2_grad/Shape*
T0*
Tshape0*'
_output_shapes
:’’’’’’’’’

gradients/mul_2_grad/Mul_1MulX-gradients/add_grad/tuple/control_dependency_1*'
_output_shapes
:’’’’’’’’’*
T0
«
gradients/mul_2_grad/Sum_1Sumgradients/mul_2_grad/Mul_1,gradients/mul_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0

gradients/mul_2_grad/Reshape_1Reshapegradients/mul_2_grad/Sum_1gradients/mul_2_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
m
%gradients/mul_2_grad/tuple/group_depsNoOp^gradients/mul_2_grad/Reshape^gradients/mul_2_grad/Reshape_1
ā
-gradients/mul_2_grad/tuple/control_dependencyIdentitygradients/mul_2_grad/Reshape&^gradients/mul_2_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_2_grad/Reshape*'
_output_shapes
:’’’’’’’’’
Ū
/gradients/mul_2_grad/tuple/control_dependency_1Identitygradients/mul_2_grad/Reshape_1&^gradients/mul_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_2_grad/Reshape_1*
_output_shapes
:
w
beta1_power/initial_valueConst*
_class
	loc:@bias*
valueB
 *fff?*
dtype0*
_output_shapes
: 

beta1_power
VariableV2*
shared_name *
_class
	loc:@bias*
	container *
shape: *
dtype0*
_output_shapes
: 
§
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
	loc:@bias
c
beta1_power/readIdentitybeta1_power*
T0*
_class
	loc:@bias*
_output_shapes
: 
w
beta2_power/initial_valueConst*
_class
	loc:@bias*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

beta2_power
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
	loc:@bias*
	container *
shape: 
§
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
: *
use_locking(
c
beta2_power/readIdentitybeta2_power*
_output_shapes
: *
T0*
_class
	loc:@bias

 weights_1/Adam/Initializer/zerosConst*
_class
loc:@weights_1*
valueB*    *
dtype0*
_output_shapes
:

weights_1/Adam
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
_class
loc:@weights_1*
	container *
shape:
½
weights_1/Adam/AssignAssignweights_1/Adam weights_1/Adam/Initializer/zeros*
T0*
_class
loc:@weights_1*
validate_shape(*
_output_shapes
:*
use_locking(
r
weights_1/Adam/readIdentityweights_1/Adam*
T0*
_class
loc:@weights_1*
_output_shapes
:

"weights_1/Adam_1/Initializer/zerosConst*
_class
loc:@weights_1*
valueB*    *
dtype0*
_output_shapes
:

weights_1/Adam_1
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
_class
loc:@weights_1*
	container *
shape:
Ć
weights_1/Adam_1/AssignAssignweights_1/Adam_1"weights_1/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@weights_1*
validate_shape(*
_output_shapes
:
v
weights_1/Adam_1/readIdentityweights_1/Adam_1*
T0*
_class
loc:@weights_1*
_output_shapes
:

 weights_2/Adam/Initializer/zerosConst*
_class
loc:@weights_2*
valueB*    *
dtype0*
_output_shapes
:

weights_2/Adam
VariableV2*
shared_name *
_class
loc:@weights_2*
	container *
shape:*
dtype0*
_output_shapes
:
½
weights_2/Adam/AssignAssignweights_2/Adam weights_2/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@weights_2*
validate_shape(*
_output_shapes
:
r
weights_2/Adam/readIdentityweights_2/Adam*
T0*
_class
loc:@weights_2*
_output_shapes
:

"weights_2/Adam_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
_class
loc:@weights_2*
valueB*    

weights_2/Adam_1
VariableV2*
shape:*
dtype0*
_output_shapes
:*
shared_name *
_class
loc:@weights_2*
	container 
Ć
weights_2/Adam_1/AssignAssignweights_2/Adam_1"weights_2/Adam_1/Initializer/zeros*
T0*
_class
loc:@weights_2*
validate_shape(*
_output_shapes
:*
use_locking(
v
weights_2/Adam_1/readIdentityweights_2/Adam_1*
_output_shapes
:*
T0*
_class
loc:@weights_2

bias/Adam/Initializer/zerosConst*
dtype0*
_output_shapes
:*
_class
	loc:@bias*
valueB*    

	bias/Adam
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
_class
	loc:@bias*
	container *
shape:
©
bias/Adam/AssignAssign	bias/Adambias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:
c
bias/Adam/readIdentity	bias/Adam*
T0*
_class
	loc:@bias*
_output_shapes
:

bias/Adam_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
_class
	loc:@bias*
valueB*    

bias/Adam_1
VariableV2*
dtype0*
_output_shapes
:*
shared_name *
_class
	loc:@bias*
	container *
shape:
Æ
bias/Adam_1/AssignAssignbias/Adam_1bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:
g
bias/Adam_1/readIdentitybias/Adam_1*
T0*
_class
	loc:@bias*
_output_shapes
:
W
Adam/learning_rateConst*
valueB
 *·Ń8*
dtype0*
_output_shapes
: 
O

Adam/beta1Const*
valueB
 *fff?*
dtype0*
_output_shapes
: 
O

Adam/beta2Const*
valueB
 *w¾?*
dtype0*
_output_shapes
: 
Q
Adam/epsilonConst*
dtype0*
_output_shapes
: *
valueB
 *wĢ+2
Ņ
Adam/update_weights_1/ApplyAdam	ApplyAdam	weights_1weights_1/Adamweights_1/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/mul_1_grad/tuple/control_dependency_1*
use_nesterov( *
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weights_1
Ņ
Adam/update_weights_2/ApplyAdam	ApplyAdam	weights_2weights_2/Adamweights_2/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/mul_2_grad/tuple/control_dependency_1*
use_nesterov( *
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weights_2
¹
Adam/update_bias/ApplyAdam	ApplyAdambias	bias/Adambias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon/gradients/add_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
	loc:@bias*
use_nesterov( *
_output_shapes
:
Č
Adam/mulMulbeta1_power/read
Adam/beta1^Adam/update_bias/ApplyAdam ^Adam/update_weights_1/ApplyAdam ^Adam/update_weights_2/ApplyAdam*
T0*
_class
	loc:@bias*
_output_shapes
: 

Adam/AssignAssignbeta1_powerAdam/mul*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*
_class
	loc:@bias
Ź

Adam/mul_1Mulbeta2_power/read
Adam/beta2^Adam/update_bias/ApplyAdam ^Adam/update_weights_1/ApplyAdam ^Adam/update_weights_2/ApplyAdam*
T0*
_class
	loc:@bias*
_output_shapes
: 

Adam/Assign_1Assignbeta2_power
Adam/mul_1*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*
_class
	loc:@bias

AdamNoOp^Adam/Assign^Adam/Assign_1^Adam/update_bias/ApplyAdam ^Adam/update_weights_1/ApplyAdam ^Adam/update_weights_2/ApplyAdam
ö
initNoOp^beta1_power/Assign^beta2_power/Assign^bias/Adam/Assign^bias/Adam_1/Assign^bias/Assign^weights_1/Adam/Assign^weights_1/Adam_1/Assign^weights_1/Assign^weights_2/Adam/Assign^weights_2/Adam_1/Assign^weights_2/Assign""
train_op

Adam"Ų
	variablesŹĒ
D
weights_1:0weights_1/Assignweights_1/read:02random_normal:08
F
weights_2:0weights_2/Assignweights_2/read:02random_normal_1:08
7
bias:0bias/Assignbias/read:02random_normal_2:08
T
beta1_power:0beta1_power/Assignbeta1_power/read:02beta1_power/initial_value:0
T
beta2_power:0beta2_power/Assignbeta2_power/read:02beta2_power/initial_value:0
d
weights_1/Adam:0weights_1/Adam/Assignweights_1/Adam/read:02"weights_1/Adam/Initializer/zeros:0
l
weights_1/Adam_1:0weights_1/Adam_1/Assignweights_1/Adam_1/read:02$weights_1/Adam_1/Initializer/zeros:0
d
weights_2/Adam:0weights_2/Adam/Assignweights_2/Adam/read:02"weights_2/Adam/Initializer/zeros:0
l
weights_2/Adam_1:0weights_2/Adam_1/Assignweights_2/Adam_1/read:02$weights_2/Adam_1/Initializer/zeros:0
P
bias/Adam:0bias/Adam/Assignbias/Adam/read:02bias/Adam/Initializer/zeros:0
X
bias/Adam_1:0bias/Adam_1/Assignbias/Adam_1/read:02bias/Adam_1/Initializer/zeros:0"ā
trainable_variablesŹĒ
D
weights_1:0weights_1/Assignweights_1/read:02random_normal:08
F
weights_2:0weights_2/Assignweights_2/read:02random_normal_1:08
7
bias:0bias/Assignbias/read:02random_normal_2:08m