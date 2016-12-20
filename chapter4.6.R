# 20% 1st graders
# 20% 6th
# 60% 11th

# p(ice cream | 1st grade) = 0.3

# take the conditionals and multiply by p(grade?)

df = data.frame(ice=c(0.3, 0.6, 0.3),
                fruit=c(0.6, 0.3, 0.1),
                french=c(0.1, 0.1, 0.6))
row.names(df) = c(1, 6, 11)
df[1,] = df[1,] * 0.2
df[2,] = df[2,] * 0.2
df[3,] = df[3,] * 0.6
sum(df) # 1

# this is equivalent to saying:
# p(a,b) = p(a|b)*p(b)