import tensorflow as tf

from tensorflow.examples.tutorials.mnist import input_data

# training(55,000), test(10,000), validation(5,000)
MNIST = input_data.read_data_sets("../../data/mnist", one_hot=True)

print(MNIST.train.num_examples)
print(MNIST.test.num_examples)
print(MNIST.validation.num_examples)

learning_rate = 0.01
batch_size = 128
n_epochs = 25

X = tf.placeholder(tf.float32, [batch_size, 784], name='image')
Y = tf.placeholder(tf.float32, [batch_size, 10], name='label')

w = tf.Variable(initial_value=tf.random_normal(shape=[784, 10], stddev=0.01), name='weights')
b = tf.Variable(initial_value=tf.zeros(shape=[1, 10]), name='bias')

logits = tf.matmul(X, w) + b

entropy = tf.nn.softmax_cross_entropy_with_logits(logits=logits, labels=Y)
loss = tf.reduce_mean(entropy)
predict = tf.nn.softmax(logits)

optimizer = tf.train.GradientDescentOptimizer(learning_rate=learning_rate).minimize(loss=loss)

init = tf.global_variables_initializer()
with tf.Session() as sess:
    sess.run(init)
    writer = tf.summary.FileWriter('./graphs/mnist_logistic_regression', sess.graph)

    n_batches = int(MNIST.train.num_examples / batch_size)
    for i in range(n_epochs):
        for _ in range(n_batches):
            X_batch, Y_batch = MNIST.train.next_batch(batch_size)
            _, ll, pred = sess.run([optimizer, loss, predict], feed_dict={X: X_batch, Y:Y_batch})
        print('Epoch{} _ loss : {:.4f}'.format(i, ll))

    #test the model
    n_batches = int(MNIST.test.num_examples / batch_size)
    total_correct_preds = 0
    for i in range(n_batches):
        X_batch, Y_batch = MNIST.test.next_batch(batch_size)
        _, loss_batch, logits_batch = sess.run([optimizer, loss, logits], feed_dict={X:X_batch, Y:Y_batch})
        preds = tf.nn.softmax(logits_batch)
        correct_preds = tf.equal(tf.argmax(preds, 1), tf.argmax(Y_batch, 1))
        accuracy = tf.reduce_sum(tf.cast(correct_preds, tf.float32))
        total_correct_preds += sess.run(accuracy)

    print("Accuracy: {:.2%}".format(total_correct_preds / MNIST.test.num_examples))
    writer.close()