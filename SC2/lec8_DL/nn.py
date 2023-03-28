from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
import tensorflow as tf

X, y = load_iris(as_frame = True, return_X_y=True)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

train = tf.data.Dataset.from_tensor_slices((X_train, y_train))
test = tf.data.Dataset.from_tensor_slices((X_test, y_test))

train = train.repeat(20).shuffle(1000).batch(32)
test = test.batch(1)


model = tf.keras.Sequential([
    tf.keras.layers.Dense(10, activation=tf.nn.relu),   # hidden layer
    tf.keras.layers.Dense(10, activation=tf.nn.relu),   # hidden layer
    tf.keras.layers.Dense(3, activation=tf.nn.softmax)  # output layer
])

model.compile(
    loss="sparse_categorical_crossentropy",
    metrics=["accuracy"],
)

model.fit(
    train,
    validation_data=test,
    epochs=10,
)



predict_X = [
  [5.1, 3.3, 1.7, 0.5],
  [5.9, 3.0, 4.2, 1.5],
  [6.9, 3.1, 5.4, 2.1],
]

predictions = model.predict(predict_X)

# predictions[0]
(predictions[0].argmax())


for pred_dict, expected in zip(predictions, ["setosa", "versicolor", "virginica"]):
    predicted_index = pred_dict.argmax()
    predicted = load_iris().target_names[predicted_index]
    probability = pred_dict.max()
    tick_cross = "✓" if predicted == expected else "✗"
    print(f"{tick_cross} Prediction is '{predicted}' ({100 * probability:.1f}%), expected '{expected}'")
