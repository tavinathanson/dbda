# we sample someone who is positive
# we sample someone else who is negative

# parameter: disease, present or absent
# P(disease present) = 0.001
# P(disease absent) = 0.999
# P(positive test | disease present) = 0.99 (hit rate)
# P(negative test | disease present) = 0.01
# P(positive test | disease absent) = 0.05 (false alarm rate)
# P(negative test | disease absent) = 0.95

# P(disease present | data) = ?

# when data = 1 positive
# P(disease present | positive test) =
# P(positive test | disease present)P(disease present)/P(positive test)
# P(positive test) = P(positive test | disease present)P(disease present)
# + P(positive test | disease absent)P(disease absent)
# = 0.99 * 0.001 + 0.05 * 0.999 <-- P(positive test)
p_positive_test = 0.99 * 0.001 + 0.05 * 0.999

# P(disease present | positive test)
# = 0.99 * 0.001 / P(positive test)
p_disease_present_positive_test = 0.99 * 0.001 / p_positive_test

show(p_disease_present_positive_test)

# when next data = 1 negative
# P(disease present | 1 positive then 1 negative test) =
# ...
# use last result as the prior
# last result = P(disease present | positive test) = new_prior
# P(disease present | 2 data) = 
#  P(2 data | disease present)P(disease present)/P(2 data)
# = likelihood * prior / normalize
# likelihood = P(negative result | disease present)
# prior = new_prior
# likelihood = 0.01

# let's use a matrix

prior_disease_present = 0.001
prior_disease_absent = 1 - prior_disease_present
joint = data.frame(row.names=c("TestPositive", "TestNegative"),
                   DiseasePresent=
                     c(0.99 * prior_disease_present,
                       (1 - 0.99) * prior_disease_present),
                   DiseaseAbsent=
                     c(0.05 * prior_disease_absent,
                       (1 - 0.05) * prior_disease_absent))
joint_t = data.frame(t(joint))
p_positive_test = sum(joint_t$TestPositive)
p_disease_given_positive = joint[1,1]/p_positive_test
show(p_disease_given_positive)

# now that we've seen a positive, and now see a negative

# copy same code, but replace the prior! and switch
# which joints we take from: the negative vs. positive
prior_disease_present = p_disease_given_positive
prior_disease_absent = 1 - prior_disease_present
joint = data.frame(row.names=c("TestPositive", "TestNegative"),
                   DiseasePresent=
                     c(0.99 * prior_disease_present, # Test Positive
                       (1 - 0.99) * prior_disease_present),
                   DiseaseAbsent=
                     c(0.05 * prior_disease_absent, # Test Positive
                       (1 - 0.05) * prior_disease_absent))
#joint = joint/sum(joint)
joint_t = data.frame(t(joint))
p_negative_test = sum(joint_t$TestNegative)
p_disease_given_negative = joint[2,1]/p_negative_test
show(p_disease_given_negative)

# why is this the same as the result of exercise 5.1?
# 5.1 was: we saw a negative and positive test, what's p
# 5.2 was using proportions...?