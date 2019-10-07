## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(unglue)
library(glue)
library(magrittr)
library(utils)
glued_data <- head(mtcars) %>% glue_data("{rownames(.)} has {hp} hp")
glued_data
unglue_data(glued_data, "{rownames(.)} has {hp} hp")

## ------------------------------------------------------------------------
facts <- c("Antarctica is the largest desert in the world!",
"The largest country in Europe is Russia!",
"The smallest country in Europe is Vatican!",
"Disneyland is the most visited place in Europe! Disneyland is in Paris!",
"The largest island in the world is Green Land!")
facts_df <- data.frame(id = 1:5, facts)

patterns <- c("The {adjective} {place_type} in {bigger_place} is {place}!",
            "{place} is the {adjective} {place_type=[^ ]+} in {bigger_place}!{=.*}")
unglue_data(facts, patterns)

## ------------------------------------------------------------------------
sentences <- c("666 is [a number]", "foo is [a word]", "42 is [the answer]", "Area 51 is [unmatched]")
patterns <- c("{number=\\d+} is [{what}]", "{word=\\D+} is [{what}]")
unglue_data(sentences, patterns)

## ------------------------------------------------------------------------
unglue_data(sentences, patterns, convert = TRUE)

## ------------------------------------------------------------------------
unglue_unnest(facts_df, facts, patterns)
unglue_unnest(facts_df, facts, patterns, remove = FALSE)

## ------------------------------------------------------------------------
unglue_vec(sentences, patterns, "number")
unglue_vec(sentences, patterns, 1)

## ------------------------------------------------------------------------
unglue_detect(sentences, patterns)
subset(sentences, !unglue_detect(sentences, patterns))

## ------------------------------------------------------------------------
unglue_regex(patterns)
unglue_regex(patterns, named_capture = TRUE)
unglue_regex(patterns, attributes = TRUE)

## ------------------------------------------------------------------------
unglue_data(c("black is black","black is dark"), "{color} is {color}")

## ------------------------------------------------------------------------
unglue_data(c("black is black","black is dark"), "{color} is {color}", multiple = paste)

