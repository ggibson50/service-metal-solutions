import sys

# Geoff Dev Notes: I decided to use a recursive approach to solve the permutations.
# I know from experience that recursion is not always the best solution for every problem, but in this case, it mirrors the mathematical nature of permutations.

def get_permutations(input_string):
    # Base case: If the input string is empty or has only one character
    if len(input_string) <= 1:
        return [input_string]
    
    permutations = []
    # Loop over each character in the string
    for i in range(len(input_string)):
        current_char = input_string[i]  # Choose the input character at the index 
        remaining = input_string[:i] + input_string[i+1:]  # Form a new string without the chosen character, then append the rest incrementing the index by 1
        # Recursive call to get permutations of the remaining string
        for perms in get_permutations(remaining):
            permutations.append(current_char + perms)
    return permutations

def switch(input_string):
    def char_order(current_char):
        if current_char.isdigit():
            return (0, current_char)  # Digits come first
        elif current_char.isupper():
            return (1, current_char)  # Uppercase letters next
        elif current_char.islower():
            return (2, current_char)  # Lowercase letters last
        else:
            return (3, current_char)  # Any other characters for Default case put in last position index
    return tuple(char_order(char) for char in input_string)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python permute.py input_file.txt")
        sys.exit(1)
    
    input_file = sys.argv[1]
    with open(input_file, "r") as f:
        # Process each line in the input file
        for line in f:
            s = line.strip()
            if s:
                # Create all permutations for the string
                perms = get_permutations(s)
                # Sort the permutations using our custom sort order
                sorted_perms = sorted(perms, key=switch)
                # Output the sorted permutations separated by commas
                print(",".join(sorted_perms))
