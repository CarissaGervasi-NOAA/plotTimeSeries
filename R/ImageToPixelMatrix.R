#Code to convert an image into pixels (creating a new double sided arrow)

# Install and load necessary packages
#install.packages("magick")
library(magick)

# Step 1: Read the image
image <- image_read("data/arrowSide2.svg")  # Replace with your image path

# Step 2: Convert the image to RGB matrix
image_data <- image_data(image, channels = "rgb")
image_matrix <- as.numeric(image_data)

# Step 3: Save the matrix as a .rds file
save(image_matrix, file = "data/arrowSide.rda")




# Install and load necessary packages
install.packages("imager")
library(imager)

# Step 1: Load the matrix from the .rda file
load("data/arrowSide.rda")  # Replace with your file path

# Assume the loaded object is named image_matrix
# If the object has a different name, adjust accordingly

# Step 2: Convert the matrix to a cimg object
height <- nrow(arrowSide)
width <- ncol(arrowSide)
image_cimg <- as.cimg(arrowSide, dim = c(width, height, 1, 1))  # cimg format: width x height x depth x spectrum

# Step 3: Resize the image
new_width <- 1000  # Set the desired width
new_height <- 1000  # Set the desired height
resized_image <- imresize(image_cimg, size_x = new_width, size_y = new_height)

# Step 4: Convert the resized cimg object back to a matrix
resized_matrix <- as.matrix(resized_image) %>% matrix(nrow = new_height, ncol = new_width)

# Step 5: Save the resized matrix as an .rda file
save(resized_matrix, file = "resized_image_matrix.rda")