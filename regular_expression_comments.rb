#!/usr/bin/env ruby
# Commenting regular expressions

re = /
  \A        # the beginning of a string,
  <         # followed by a '<'
  ([^>]+)   # followed by one or more non-'>' characters,
  >         # followed by a '>'
  /x

test_text = <<EOS
<this-one-matches>
 <this-one-does-not-match>
<match>
<> <!-- no match -->
EOS

test_text.split(/\n/).each do |line|
  message = if !! line.match(re)
    'SUCH MATCH!'
  else
    'MATCH FAIL :('
  end
  puts "#{message} '#{line}'"
end
