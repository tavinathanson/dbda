# [Purpose: To have you work through an example of the logic
# presented in Section 4.2.1.2.] Determine the exact probability 
# of drawing a 10 from a shuffled pinochle deck. 
# (In a pinochle deck, there are 48 cards. There are six values:
# 9, 10, Jack, Queen, King, Ace. There are two copies of each 
# value in each of the standard four suits: hearts, diamonds,
# clubs, spades.)

# p(getting a 10)

per_suit = 2
suits = 4
p_10 = (2 * 4) / (2 * 4 * 6)
show(p_10)

# p(getting a 10 or jack)

p_10_or_jack = (2 * 4 * 2) / (2 * 4 * 6)
show(p_10_or_jack)