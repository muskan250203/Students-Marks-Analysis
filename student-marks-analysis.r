# ---- STEP 1 : Install and load package ----------------------
library(dplyr)

# ---- STEP 2 : Create the data frame --------------------------
students <- data.frame(
  Roll_No = 1:8,
  Name    = c("Aarav", "Diya", "Rohan", "Sneha",
              "Kabir", "Meera", "Arjun", "Isha"),
  Maths   = c(78, 92, 45, 66, 88, 71, 39, 95),
  Science = c(72, 85, 52, 61, 90, 68, 42, 89),
  English = c(85, 90, 60, 74, 79, 82, 55, 91)
)

print(students)

# ---- STEP 3 : Dimensions and structure ---------------
cat("\nDimensions (rows, columns):", dim(students), "\n\n")
glimpse(students)
cat("\n")
str(students)

# ---- STEP 4 : Arithmetic operators ---------------------------
# Add new columns to the data frame using + and /
students$Total      <- students$Maths + students$Science + students$English
students$Percentage <- round(students$Total / 300 * 100, 2)

cat("\nAfter calculations:\n")
print(students[, c("Name", "Total", "Percentage")])

# ---- STEP 5 : Mathematical functions -------------------------
cat("\nClass Average :", round(mean(students$Percentage), 2), "\n")
cat("Highest       :", max(students$Percentage), "\n")
cat("Lowest        :", min(students$Percentage), "\n")
cat("Total of all  :", sum(students$Total), "\n")

# ---- STEP 6 : Looping -----------------------------------------
# for loop with if-else to assign the result of each student
students$Result <- ""

cat("\nStudent-wise Result:\n")
for (i in 1:nrow(students)) {
  
  if (students$Percentage[i] >= 40) {
    students$Result[i] <- "PASS"
  } else {
    students$Result[i] <- "FAIL"
  }
  
  cat(students$Name[i], "-", students$Percentage[i], "% -",
      students$Result[i], "\n")
}

# ---- STEP 7 : Topper and graph ----------------------------------------
topper <- students$Name[which.max(students$Percentage)]
cat("\nClass Topper:", topper, "\n")

barplot(students$Percentage,
        names.arg = students$Name,
        main = "Student-wise Percentage",
        xlab = "Student", ylab = "Percentage",
        col = "steelblue", ylim = c(0, 100))