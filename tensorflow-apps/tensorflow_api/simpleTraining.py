import tensorflow as tf

x = tf.constant([[1], [2], [3], [4]], dtype=tf.float32)
y_true = tf.constant([[0], [-1], [-2], [-3]], dtype=tf.float32)

k = tf.Variable(0.0)
b = tf.Variable(0.0)

y_pred = tf.add(tf.multiply(x, k), b, name='out')
loss = tf.losses.mean_squared_error(labels=y_true, predictions=y_pred)

optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.01)
train = optimizer.minimize(loss)

init = tf.global_variables_initializer()
saver = tf.train.Saver()

with tf.Session() as sess:
  sess.run(init)
  for i in range(2000):
    _, loss_value = sess.run((train, loss))
    print(loss_value)
  print(k.eval())
  print(b.eval())
  result = sess.run(y_pred)
  print(result)
  tf.train.write_graph(sess.graph_def, './savers', 'simple.pb')
  save_path = saver.save(sess, "./savers/simple.ckpt")
  print("Model saved in path: %s" % save_path)
  tf.saved_model.simple_save(sess, "./savers", inputs={"x":x}, outputs={"y", y_pred})

from tensorflow.python.tools import freeze_graph
freeze_graph.freeze_graph(input_graph='./savers/simple.pb',
                          input_saver='',
                          input_binary=False,
                          input_checkpoint='./savers/simple.ckpt',
                          output_node_names='out',
                          restore_op_name='',
                          filename_tensor_name='',
                          output_graph='./savers/frozen_model.pb',
                          clear_devices=True,
                          initializer_nodes='')