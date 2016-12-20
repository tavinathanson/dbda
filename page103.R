# P(test=pos|disease=yes) = 0.99
# P(test=pos|disease=no) = 0.05
# P(disease=yes) = 0.001

# what is the updated porbability that person has disease if the
# test is positive?

# intuition: probability is > 0.001

#P(test,disease=yes) = P(test | disease=yes)P(disease=yes)
#P(test=pos, disease=yes) = 0.99 * 0.001
#P(test=pos, disease=no) = 0.05 * 0.999
#P(disease=yes) = P(test=pos, disease=yes) + P(test=neg, disease=yes)
# = 0.99 * 0.001 + 0.05 * 0.999

# P(disease=yes|test=pos) = 
#   P(test=pos,disease=yes)/P(disease=yes)

x = (0.99 * 0.001) / (0.99 * 0.001 + 0.05 * 0.999)
show(x)

# easier to just make a table...

test_given_disease = data.frame(
  row.names = c("pos_test", "neg_test"),
  yes_disease=c(0.99, 0.01),
  no_disease=c(0.05, 0.95))
show(test_given_disease)

test_disease = t(t(test_given_disease) * c(0.001, 0.999))
show(test_disease)

test_disease[1,1] / sum(test_disease[1,])
