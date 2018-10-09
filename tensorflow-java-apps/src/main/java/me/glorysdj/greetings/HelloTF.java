package me.glorysdj.greetings;

import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.TensorFlow;

import java.io.UnsupportedEncodingException;

public class HelloTF {
    public static void main(String[] args) throws UnsupportedEncodingException {
        try (Graph graph = new Graph()) {
            final String value = "Hello from Tensorflow " + TensorFlow.version();
            System.out.println(value);

            try (Tensor tensor = Tensor.create(value.getBytes("UTF-8"))) {
                graph.opBuilder("Const", "MyConst")
                        .setAttr("dtype", tensor.dataType())
                        .setAttr("value", tensor)
                        .build();
            }

            try (Session session = new Session(graph);
                 Tensor output = session.runner().fetch("MyConst").run().get(0)) {
                System.out.println(new String(output.bytesValue(), "UTF-8"));
            }
        }
    }
}
