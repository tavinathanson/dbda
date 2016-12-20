# consider 5.1 and 5.2

# A. someone random gets test and it comes back negative.
# prob that person has diease

prior_disease_absent = 1 - prior_disease_present
joint = data.frame(row.names=c("TestPositive", "TestNegative"),
                   DiseasePresent=
                     c(0.99 * prior_disease_present,
                       (1 - 0.99) * prior_disease_present),
                   DiseaseAbsent=
                     c(0.05 * prior_disease_absent,
                       (1 - 0.05) * prior_disease_absent))
show(joint)
p_disease_given_negative = joint[2,1]/sum(joint[2,])
show(p_disease_given_negative)

# B. person gets re-tested, second test is positive

# all same except prior
prior_disease_present = p_disease_given_negative
prior_disease_absent = 1 - prior_disease_present
joint = data.frame(row.names=c("TestPositive", "TestNegative"),
                   DiseasePresent=
                     c(0.99 * prior_disease_present,
                       (1 - 0.99) * prior_disease_present),
                   DiseaseAbsent=
                     c(0.05 * prior_disease_absent,
                       (1 - 0.05) * prior_disease_absent))

show(joint)
p_disease_given_positive = joint[1,1]/sum(joint[1,])
show(p_disease_given_positive)

# B result is the same as what we had previously!