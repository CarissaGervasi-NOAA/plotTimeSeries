#Code to convert an image into pixels (creating a new double sided arrow)

# Install and load necessary packages
#install.packages("magick")
library(magick)

# Step 1: Read the image
image <- image_read("data/arrowSide2.png")  # Replace with your image path

# Step 2: Convert the image to RGB matrix
image_data <- image_data(image, channels = "rgb")
arrowSide <- as.numeric(image_data)

dim(arrowSide)
dim(arrowDown)

# Reshape the 3D array into a 2D matrix
# One approach is to collapse the third dimension (z) into columns

dims <- dim(arrowSide)
arrowSide <- matrix(arrowSide, nrow = dims[1], ncol = dims[2] * dims[3])

# Check the resulting matrix
print(dim(arrowSide))

# Step 3: Save the matrix as a .rds file
save(arrowSide, file = "data/arrowSide.rda")


