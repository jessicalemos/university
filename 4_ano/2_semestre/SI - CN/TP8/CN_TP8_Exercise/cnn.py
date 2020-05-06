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

# Initialising the CNN
classifier = Sequential()

# Step 1 - Add Convolution layer + MaxPooling layer
classifier.add(Conv2D(256, (3, 3)))
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

classifier.fit_generator(training_set, validation_data=test_set, epochs=5, verbose=2)

# Part 3 - Validate classifier manually. use predict command to inference model with individual images
# Use images located in dataset/single_prediction
scores = model.evaluate_generator(test_set, verbose=0)
print('Scores: ', scores)
print("Accuracy: %.2f%%" % (scores[1]*100))
print("Erro modelo: %.2f%%" % (100-scores[1]*100))