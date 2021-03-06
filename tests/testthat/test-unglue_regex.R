test_that("unglue_regex works", {
  sentences <- c("666 is a number", "foo is a word",
                 "42 is the answer", "Area 51 is unmatched")
  patterns <- c("{number=\\d+} is {what}", "{word=\\D+} is {what}")
  expect_error(
    unglue_regex("{x} and {y}", use_multiple = TRUE, named_capture = TRUE))
  expect_error(
    unglue_regex("{x} and {y}", open = "|", close = "|"))
  expect_error(
    unglue_regex("{x} and {y}", open = "<<"))
  expect_identical(
    unglue_regex("{x} and {y}", named_capture = TRUE),
    c(`{x} and {y}` = "^(?<x>.*?) and (?<y>.*?)$"))
  expect_identical(
    unglue_regex("[x] and [y]", open = "[", close = "]")[[1]],
    unglue_regex("{x} and {y}")[[1]])
})
