# Converted from http://www.brock-family.org/gavin/perl/kcpassword.html
def kcpassword_xor(password)
  key = [125, 137, 82, 35, 210, 188, 221, 234, 163, 185, 31]
  password.bytes.zip(key).map { |(a, b)| a ^ b }.pack('U*').to_s
end
