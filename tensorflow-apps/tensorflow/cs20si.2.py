import numpy as np
import tensorflow as tf

a = tf.constant([3, 6])
b = tf.constant([2, 2])

with tf.Session() as session:
    print(session.run(tf.add(a, b)))
    print(session.run(tf.add_n([a, b, b])))
    print(session.run(tf.multiply(a, b)))
    print(session.run(tf.matmul(tf.reshape(a, [2, 1]), tf.reshape(b, [1, 2]))))
    print(session.run(tf.divide(a, b)))
    print(session.run(tf.div(a, b)))
    print(session.run(tf.mod(a, b)))

t_0 = 19
t_1 = [1., 2., 3.]
t_2 = [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]
with tf.Session() as session:
    print(session.run(tf.zeros_like(t_0)))
    print(session.run(tf.ones_like(t_0)))
    print(session.run(tf.zeros_like(t_1)))
    print(session.run(tf.ones_like(t_1)))
    print(session.run(tf.zeros_like(t_2)))
    print(session.run(tf.ones_like(t_2)))
    print(session.run(tf.zeros([3,3], tf.float16)))
    print(session.run(tf.ones([3, 3], tf.float32)))

my_const = tf.constant([1.0, 2.0], name="my_const")
with tf.Session() as sess:
     #print(sess.graph.as_graph_def())
     print("hello")

a = tf.Variable(2, name="scalar")
b = tf.Variable([2, 3], name="vector")
c = tf.Variable([[0, 1], [2, 3]], name="matrix")
W = tf.Variable(tf.zeros([784,10]))
#init = tf.global_variables_initializer()
init_ab = tf.variables_initializer([a, b], name="init_ab")
with tf.Session() as session:
    session.run(init_ab)
    print(session.run(a))
    print(session.run(b))
    session.run(c.initializer)
    print(session.run(c))
    session.run(W.initializer)
    print(session.run(W))
    print(W.eval())

W2 = tf.Variable(tf.truncated_normal([700, 10]))
with tf.Session() as session:
    session.run(W2.initializer)
    print(W2.eval())

W = tf.Variable(10)
W.assign(100)
with tf.Session() as sess:
     sess.run(W.initializer)
     print(W.eval())

W = tf.Variable(10)
assign_op = W.assign(100)
with tf.Session() as sess:
     #sess.run(W.initializer) #dont need
     sess.run(assign_op)
     print(W.eval())

my_var = tf.Variable(2, name="my_var")
my_var_times_two = my_var.assign(2 * my_var)
with tf.Session() as sess:
    print(sess.run(my_var.initializer))
    print(sess.run(my_var_times_two)) # >> 4
    print(sess.run(my_var_times_two)) # >> 8
    print(sess.run(my_var_times_two)) # >> 16
    print(sess.run(my_var.assign_add(10)))
    print(sess.run(my_var.assign_sub(2)))

W = tf.Variable(10)
sess1 = tf.Session()
sess2 = tf.Session()
sess1.run(W.initializer)
sess2.run(W.initializer)

print(sess1.run(W.assign_add(10))) # >> 20
print(sess2.run(W.assign_sub(2))) # >> 8
print(sess1.run(W.assign_add(100))) # >> 120
print(sess2.run(W.assign_sub(50))) # >> -42
sess1.close()
sess2.close()

W = tf.Variable(tf.truncated_normal([5]))
with tf.Session() as sess:
    sess.run(W.initializer)
    U = tf.Variable(2 * W.initial_value)
    sess.run(U.initializer)
    print(W.eval())
    print(U.eval())