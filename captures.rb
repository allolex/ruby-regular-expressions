#!/usr/bin/env ruby
# Capturing regular expression matches

adjectives_re = Regexp.union(%w/brown quick lazy red giant/)

# If you need to recompose a regex, you can call .source on it to get the
# string version.
#
# Here we are putting some word boundaries around our adjectives, so our
# pattern will only match isolated words, not parts of longer words.
#
# We are also wrapping the base pattern in parentheses to capture it when
# it does match.
#
adjectives_with_boundaries_re = Regexp.new(
  '\b(' + adjectives_re.source + ')\b'
)

text = 'The quick brown fox jumps over the lazy dog.'

# Regexp.match
# It returns a single match
#
match_data = text.match(adjectives_with_boundaries_re)
puts match_data[1]


# String#scan
# It returns a list of matches, each match in its own array when you have
# capture groups in your pattern. That's why we need to flatten the array
# below.
#
# A couple of methods for some nice formatting:
#
# This one puts single quotes around each item in a list. It's not very
# clever.
#
def add_quotes(list)
  list.map { |item| "'#{item}'" }
end

# This one prepends 'and' on the final list element, e.g. '1, 2, 3' becomes '1,
# 2, and 3'.
#
def list_in_english(list)
  list.last.gsub!(/\A/) { 'and ' }
  list
end

# Capture *all* matches
#
adjectives = text.scan(adjectives_with_boundaries_re).flatten

# Print out the formatted capture list
#
formatted_list = list_in_english(add_quotes(adjectives))
puts 'Adjectives found: ' + formatted_list.join(', ')

__END__
# Often you will want to do more than just check to see whether a pattern match
# is found in a given text—you'll want to manipulate the text itself. Capturing
# all of or parts of your pattern can be very useful in accomplishing this.
