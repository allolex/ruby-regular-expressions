#!/usr/bin/env ruby
# Commenting regular expressions
# Use the x flag after your regular expression

re = /
  \A        # the beginning of a string,
  <         # followed by a '<'
  [^>]+     # followed by one or more non-'>' characters
  >         # followed by a '>'
  /x

# Second method for compiling the regex
# I'm using a heredoc here with `<<`
re_two_string = <<-'END_OF_REGEX'
  \A    # beginning of a string
  \s+   # one or more spaces
  <     # a '<' character
  END_OF_REGEX

# Regexp::EXTENDED is the same as the `x` flag
re_two = Regexp.new(re_two_string, Regexp::EXTENDED)


test_text = <<'END_OF_STRING'
<this-one-matches-the-first-re>
 <this-one-matches-the-second-re>
<match>
<> <!-- no match -->
END_OF_STRING

test_text.split(/\n/).each do |line|
  message = if re === line
              'SUCH MATCH on the first RE !'
            elsif re_two === line
              'SUCH MATCH on the second RE !'
            else
              'MATCH FAIL :('
            end
  puts "#{message} --> '#{line}'"
end

puts '',re.inspect
puts '',re_two.inspect

__END__
SUCH MATCH on the first RE ! --> '<this-one-matches-the-first-re>'
SUCH MATCH on the second RE ! --> ' <this-one-matches-the-second-re>'
SUCH MATCH on the first RE ! --> '<match>'
MATCH FAIL :( --> '<> <!-- no match -->'

/
  \A        # the beginning of a string,
  <         # followed by a '<'
  [^>]+     # followed by one or more non-'>' characters
  >         # followed by a '>'
  /x

/  \A    # beginning of a string
  \s+   # one or more spaces
  <     # a '<' character
/x
