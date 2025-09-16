# Install fs package if needed
install.packages("fs")

# Load the package
library(fs)


# Print directory tree from specific path
fs::dir_tree("C:/Users/z5104886/OneDrive - UNSW/github/gladse/app")

# Limit recursion depth
fs::dir_tree("C:/Users/z5104886/OneDrive - UNSW/github/gladse", recurse = 2)
