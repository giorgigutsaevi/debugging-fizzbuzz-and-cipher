class Cipher

  def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    end
    ciphertext_chars.join
  end

  def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
      cipher[char.ord - 65]
    end
    plaintext_chars.join
  end
end

# Debugging Thought Process

## Encode Method

### The problem is due to our alphabet creating range ("a...z"). Need `..` two dots to include letter `z`
def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  ciphertext_chars =
    plaintext.chars.map { |char| (65 + cipher.find_index(char)).chr }
  ciphertext_chars.join
end

# p encode('theswiftfoxjumpedoverthelazydog', 'secretkey')
k = 'secretkey'
k_chars = k.chars.uniq
# p k_chars
# puts '______________'
our_cipher = %w[s e c r t k y a b d f g h i j l m n o p q u v w x z]
my_text = 'theswiftfoxjumpedoverthelazydog'
to_encode =
  my_text.chars.map do |char|
    # puts "#{char} - #{65 + our_cipher.find_index(char)}"
  end

some_arr = %w[a b c d e]

## Decode Method

# og_text = "theswiftfoxjumpedoverthelazydog"

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # p cipher
  plaintext_chars =
    ciphertext.chars.map do |char| 
      # p char
      cipher[char.ord - 65]
    end
    plaintext_chars.join
end
 
decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", 'secretkey')
# p "E".ord
# p 69.chr