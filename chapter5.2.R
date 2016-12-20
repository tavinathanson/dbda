# 100,000 people

prior_disease_present = 0.001
prior_disease_absent = 1 - prior_disease_present
joint = data.frame(row.names=c("TestPositive", "TestNegative"),
                   DiseasePresent=
                     c(0.99 * prior_disease_present,
                       (1 - 0.99) * prior_disease_present),
                   DiseaseAbsent=
                     c(0.05 * prior_disease_absent,
                       (1 - 0.05) * prior_disease_absent))
num_expected = joint * 100000
show(num_expected)

# B. proportion of people who have the disease
# given that they have a positive test result
show(99 / 4995)

# WRONG
# need to do it over 99 + 4995
show(99 / (99 + 4995))

# C.
# N = 10,000,000
# retest people
num_expected = joint * 10000000
show(num_expected)

# left branch
# number of people
# * p(disease present)
# * p(positive test | disease present)
# * p(negative test | disease present)
N = 10000000
left_branch = N * 0.001 * 0.99 * (1 - 0.99)
right_branch = N * 0.999 * 0.95 * (1 - 0.95)
show(left_branch)
show(right_branch)

# D. prop of people who tested pos then negative
# (regardless of disease state)
# who actually have disease
show(99 / (99 + 474525))
