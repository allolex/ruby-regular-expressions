#!/usr/bin/env ruby
# Escaping text in regular expressions
# Regexp.escape is the same as Regexp.quote

# The example uses a BBCode tag, which was one of the
# simplest things I could come up with.

bbcode_bold_re_one = /\[b\]/
escaped_text = Regexp.escape('[b]')
bbcode_bold_re_two = Regexp.new(escaped_text)

if bbcode_bold_re_one == bbcode_bold_re_two
  puts 'They are the same, but one is more readable.'
else
  puts 'They are different.'
end

puts bbcode_bold_re_one.inspect
puts bbcode_bold_re_two.inspect
