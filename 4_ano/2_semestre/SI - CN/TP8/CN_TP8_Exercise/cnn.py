# Convolutional Neural Network

# Installing Tensorflow
# pip install tensorflow

# Installing Keras
# pip install --upgrade keras

# Tutorial: https://pythonprogramming.net/convolutional-neural-network-kats-vs-dogs-machine-learning-tutorial/
# Part 1 - Building the CNN

# Importing the Keras libraries and packages
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Activation
import matplotlib.pyplot as plt

# Initialising the CNN
classifier = Sequential()

# Step 1 - Add Convolution layer + MaxPooling layer
classifier.add(Conv2D(256, (3, 3), input_shape=(64,64,3)))
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size=(2, 2)))

# Step 2 - Adding a second convolutional layer (copy from Step 1)
classifier.add(Conv2D(256, (3, 3)))
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size=(2, 2)))

# Step 3 - Flattening
classifier.add(Flatten())

# Step 4 - Full connection
classifier.add(Dense(64))

classifier.add(Dense(1))
classifier.add(Activation('sigmoid'))

# Compiling the CNN
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Part 2 - Fitting the CNN to the images
# For Image Augmentation, verify https://keras.io/preprocessing/image/ - ImageDataGenerator class
# Or do it manually if you don't want to use Keras

from keras.preprocessing.image import ImageDataGenerator

# Step 1 - ImageDataGenerator class for data train and test data generation
# Arguments: Rescale, shear_range, zoom_range, horizontal_flip
# For test dataset, only pixel values normalization is required
# ...
PATH = 'dataset'
train_datagen = ImageDataGenerator(rescale=1./255)
test_datagen = ImageDataGenerator(rescale=1./255)

# Step 2 - ImageDataGenerator class - for flow_from_directory command, verify https://keras.io/preprocessing/image/ - flow_from_directory
# Arguments: directory of dataset, target_size=(64,64), batch_size=32, class_mode='binary'
training_set = train_datagen.flow_from_directory(PATH+'/training_set',
                                                target_size=(64, 64),
                                                batch_size=32,
                                                class_mode='binary')

test_set = test_datagen.flow_from_directory(PATH+'/test_set',
                                            target_size=(64, 64),
                                            batch_size=32,
                                            class_mode='binary')

# Step 3 - fit the model using fit_generator
# Arguments: training_dataset, steps_per_epoch, epochs, validation_data, validation_steps
history = classifier.fit_generator(training_set, validation_data=test_set, epochs=10, verbose=2)

# Part 3 - Validate classifier manually. use predict command to inference model with individual images
# Use images located in dataset/single_prediction
prediction_datagen = ImageDataGenerator(rescale=1./255)

prediction_set = prediction_datagen.flow_from_directory('dataset/single_prediction',
                                                target_size=(64, 64),
                                                batch_size=32,
                                                class_mode='binary')

predictions = classifier.predict_generator(prediction_set, steps=len(prediction_set), verbose=1)
print(predictions)

#print model accuracy and loss
acc = history.history['accuracy']
val_acc = history.history['val_accuracy']
loss = history.history['loss']
val_loss = history.history['val_loss']

epochs = range(1, len(acc) + 1)
fig = plt.figure(figsize=(16,9))

plt.subplot(1, 2, 1)
plt.plot(epochs, loss, 'bo', label='Train')
plt.plot(epochs, val_loss, 'b', label='Test')
plt.title('Model loss')
plt.legend()

plt.subplot(1, 2, 2)
plt.plot(epochs, acc, 'bo', label='Train')
plt.plot(epochs, val_acc, 'b', label='Test')
plt.title('Model accuracy')
plt.legend()
plt.show()