## 4.1

show(HairEyeColor)

# We have eye color, hair color, and sex. Sum up the counts for M and F.
EyeHairFreq = apply(HairEyeColor, c("Eye", "Hair"), sum)

# Normalize the Eye vs. Hair matrix to add up to 1. This is the joint probability
# table of p(eye, hair).
EyeHairProp = EyeHairFreq / sum(EyeHairFreq)
show(round(EyeHairProp, 2))

# Sum up the counts for sex and eye color, to get the number of people with each
# hair color.
HairFreq = apply(HairEyeColor, c("Hair"), sum)

# Normalize to 1. This is the marginal probability for p(hair).
HairProp = HairFreq / sum(HairFreq)
show(round(HairProp, 2))

# Sum up the counts for sex and hair color; number of people per eye color.
EyeFreq = apply(HairEyeColor, c("Eye"), sum)

# Normalize to 1. Margin for p(eye).
EyeProp = EyeFreq / sum(EyeFreq)
show(round(EyeProp, 2))

# Probabilities of each hair color for blue eyes, normalized to 1.
# AKA p(hair | eye=blue)
EyeHairProp["Blue",] / EyeProp["Blue"]

# p(hair | eye=brown)
EyeHairProp["Brown",] / sum(EyeHairProp["Brown",])

# p(eye | hair=brown)
EyeHairProp[,"Brown"] / sum(EyeHairProp[,"Brown"])

# p(eye | hair=blue)
EyeHairProp[,"Blond"] / sum(EyeHairProp[,"Blond"])