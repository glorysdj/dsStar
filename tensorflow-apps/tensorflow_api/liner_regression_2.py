import tensorflow as tf
import numpy as np
import xlrd
import matplotlib.pyplot as plt

DATA_FILE = "../../data/fire_theft.xls"
book = xlrd.open_workbook(DATA_FILE, encoding_override='utf-8')
sheet = book.sheet_by_index(0)
data = np.asarray([sheet.row_values(i) for i in range(1, sheet.nrows)])
n_samples = sheet.nrows - 1

print(data)
x = data[:, [0]]
y = data[:, [1]]
print(x.shape, y.shape)

X = tf.placeholder(tf.float32, shape=[None, 1], name='X')
Y = tf.placeholder(tf.float32, shape=[None, 1], name='Y')

w = tf.Variable(initial_value=tf.random_normal(shape=[1]), name="weights_1")
u = tf.Variable(initial_value=tf.random_normal(shape=[1]), name="weights_2")
b = tf.Variable(initial_value=tf.random_normal(shape=[1]), name="bias")

Y_predicted = X * X * w + X * u + b

loss = tf.reduce_mean(tf.square(Y - Y_predicted))
optimizer = tf.train.AdamOptimizer(learning_rate=0.0001).minimize(loss=loss)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    # writer = tf.summary.FileWriter('./graphs/liner_regression2', sess.graph)


    for i in range(100000):
        los, _ = sess.run([loss, optimizer], feed_dict={X: x,  Y: y})
        print(i, los)

    w_value, u_value, b_value = sess.run([w, u, b])

# plotting
plt.scatter(data[:, 0], data[:, 1], c='b', label='Real data')
t = np.arange(0., 40., 0.2)
plt.plot(t, w_value * (t * t) + u_value * t + b_value, 'r-', label='Predicted data')
plt.legend()
plt.show()