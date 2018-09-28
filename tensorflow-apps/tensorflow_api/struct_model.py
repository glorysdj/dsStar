import tensorflow as tf

#hyper-parameter
VOCAB_SIZE = 50000
BATCH_SIZE = 128
EMBED_SIZE = 128
SKIP_WINDOW = 1
NUM_SAMPLED = 64
LEARNING_RATE = 1.0
NUM_TRAIN_STEPS = 20000
SKIP_STEP = 1000

class SkipGramModel:
    """ Build the graph for word2vec model """

    def __init__(self, vocab_size, embed_size, batch_size, num_sampled, learning_rate):
        self.vocab_size = vocab_size
        self.embed_size = embed_size
        self.batch_size = batch_size
        self.num_sampled = num_sampled
        self.lr = learning_rate
        self.global_step = tf.Variable(0, dtype=tf.int32, trainable=False, name='global_step')

    def _create_placeholders(self):
        """ Step 1: define the placeholders for input and output """
        with tf.name_scope("data"):
            self.center_words = tf.placeholder(tf.int32, shape=[self.batch_size], name='center_words')
            self.target_words = tf.placeholder(tf.int32, shape=[self.batch_size, 1], name='target_words')

    def _create_embedding(self):
        """ Step 2: define weights. In word2vec, it's actually the weights that we care about """
        with tf.name_scope("embed"):
            self.embed_matrix = tf.Variable(tf.random_uniform([self.vocab_size, self.embed_size], -1.0, 1.0), name='embed_matrix')

    def _create_loss(self):
        """ Step 3 + 4: define the model + the loss function """
        with tf.name_scope("loss"):
            # Step 3: define the inference
            embed = tf.nn.embedding_lookup(self.embed_matrix, self.center_words, name='embed')
            # Step 4: define loss function, construct variables for NCE loss
            nce_weight = tf.Variable(tf.truncated_normal([self.vocab_size, self.embed_size], stddev=1.0 / (self.embed_size ** 0.5)), name='nce_weight')
            nce_bias = tf.Variable(tf.zeros([VOCAB_SIZE]), name='nce_bias')

            # define loss function to be NCE loss function
            self.loss = tf.reduce_mean(tf.nn.nce_loss(weights=nce_weight,
                                                      biases=nce_bias,
                                                      labels=self.target_words,
                                                      inputs=embed,
                                                      num_sampled=self.num_sampled,
                                                      num_classes=self.vocab_size), name='loss')

    def _create_optimizer(self):
        """ Step 5: define optimizer """
        self.optimizer = tf.train.GradientDescentOptimizer(self.lr).minimize(self.loss, global_step=self.global_step)

    def _create_summaries(self):
        with tf.name_scope("summaries"):
            tf.summary.scalar("loss", self.loss)
            tf.summary.histogram("histogram_loss", self.loss)
            self.summary_op = tf.summary.merge_all()

    def build_graph(self):
        """ Build the graph for our model """
        self._create_placeholders()
        self._create_embedding()
        self._create_loss()
        self._create_optimizer()
        self._create_summaries()

def train_model(sess, model, batch_gen, num_train_steps):
    sess.run(tf.global_variables_initializer())
    total_loss = 0.0
    writer = tf.summary.FileWriter('./graphs/struct_model' + str(LEARNING_RATE), sess.graph)
    initial_step = 0

    for index in range(initial_step, initial_step + num_train_steps):
        centers, targets = next(batch_gen)
        feed_dict = {model.center_words: centers, model.target_words: targets}
        loss_batch, _, summary = sess.run([model.loss, model.optimizer, model.summary_op], feed_dict=feed_dict)
        writer.add_summary(summary, global_step=index)

        total_loss += loss_batch
        if (index + 1) % SKIP_STEP == 0:
            print('Average loss at step {}: {:5.1f}'.format(index + 1, total_loss / SKIP_STEP))
            total_loss = 0.0

model = SkipGramModel(VOCAB_SIZE, EMBED_SIZE, BATCH_SIZE, NUM_SAMPLED, LEARNING_RATE)
model.build_graph()
print(model)

from tensorflow_api.process_data import process_data
batch_gen = process_data(VOCAB_SIZE, BATCH_SIZE, SKIP_WINDOW)

print(batch_gen)

sess = tf.InteractiveSession()
saver = tf.train.Saver()
train_model(sess, model, batch_gen, NUM_TRAIN_STEPS)
saver.save(sess, './graphs/struct_model/skip_gram_checkpoints/skipGram.ckpt')
sess.close()
