# Example R unit tests using testthat
# These are placeholder tests to demonstrate the testing structure

test_that("basic arithmetic works", {
  expect_equal(2 + 2, 4)
  expect_equal(10 - 5, 5)
  expect_equal(3 * 4, 12)
})

test_that("vector operations work", {
  x <- c(1, 2, 3, 4, 5)
  expect_equal(length(x), 5)
  expect_equal(sum(x), 15)
  expect_equal(mean(x), 3)
})

test_that("string operations work", {
  text <- "Hello, World!"
  expect_equal(nchar(text), 13)
  expect_true(grepl("World", text))
  expect_equal(toupper("test"), "TEST")
})
