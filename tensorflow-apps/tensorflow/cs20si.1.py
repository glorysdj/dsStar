from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np
import tensorflow as tf

print(np.__version__)
print(tf.__version__)

a = tf.constant(3.0, dtype=tf.float32)
b = tf.constant(4.0)
total = a + b
print(a)
print(b)
print(total)

x = 3.0
y = 4.0
z = tf.add(x, y)
print(x)
print(y)
print(z)

#writer = tf.summary.FileWriter('.')
#writer.add_graph(tf.get_default_graph())
#writer.close()
#print("writen")

sess = tf.Session()
print(sess.run(total))

sess = tf.Session()
print(sess.run(z))