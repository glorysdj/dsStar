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

X = tf.placeholder(tf.float32, name='X')
Y = tf.placeholder(tf.float32, name='Y')

w = tf.Variable(0.0, name='weight')
b = tf.Variable(0.0, name='bias')

Y_predicted = X * w + b

loss = tf.square(Y - Y_predicted, name='loss')

optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.001).minimize(loss=loss)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    writer = tf.summary.FileWriter('./graphs/liner_regression', sess.graph)
    for i in range(500):  # train the model 100 times
        total_loss = 0
        for x, y in data:
            _, l = sess.run([optimizer, loss], feed_dict={X: x, Y: y})
            total_loss += l
        print('Epoch {0}: {1}'.format(i, total_loss / n_samples))
    w_value, b_value = sess.run([w, b])

plt.scatter(data[:,0], data[:,1], c='b', label='Real data')
t = np.arange(0., 40., 0.2)
plt.plot(t, w_value*t+b_value, 'r-', label='Predicted data')
plt.legend()
plt.show()