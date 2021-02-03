library(tidyverse)

set.seed(42)
randomNames::randomNames(5000,name.order = "first.last",name.sep = " ") %>% 
  as_tibble() -> names

set.seed(42)
randomNames::randomNames(5000,name.sep = " ") %>% 
  as_tibble()  -> names2


names <- names %>% 
  mutate(n = row_number()) %>% 
  rename(name = value)

names2 <- names2 %>% 
  mutate(n = row_number()) %>% 
  rename(name2 = value)

left_join(names, names2, by = "n") -> x

x %>% arrange(name2, names) -> x

x %>% select(name) %>% write_csv('names.csv')
