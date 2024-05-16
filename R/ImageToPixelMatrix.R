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


