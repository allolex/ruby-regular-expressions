#!/usr/bin/env ruby
# Using look-ahead and look-behind assertions in
# regular expressions

def comment_line_re
  /
    \A      # beginning of the string
    \s*     # followed by zero or more spaces
    \#      # followed by a hash symbol
            # (escaped so it won't be parsed as a comment)
    \s*     # followed by zero or more spaces
  /x
end

def lookbehind_re
  /
    (?<=    # look behind (but don't include in the match) for
      ing   # string 'ing'
      \s    # followed by a space
    )
    (       # start capture \1
      to
      \s+   # one or more spaces
      be
    )
  /x
end

def lookahead_re
  /
  \b          # word boundary (beginning or end of word)
    (\w+)     # capture as $1 one or more word characters
    (?=thing) # look ahead for 'thing'
  /x
end

DATA.readlines.each do |line|
  next unless comment_line_re === line
  puts line.
    chomp.
    gsub(comment_line_re) { '' }.
    gsub(lookbehind_re) { '<<lookbehind>>' + $1.upcase }.
    gsub(lookahead_re) { $1.upcase + '<<lookahead>>'}
end

__END__
# Sometimes when you are doing subsitutions using regexes,
# it is useful to be able to match against something that
# is not going to be substituted. That's what lookarounds
# are for. They can be used to restrict the selection of
# almost anything.
#
# http://www.ruby-doc.org/core-2.1.1/Regexp.html#class-Regexp-label-Anchors
#
# (?=#{pattern})    # lookahead
# (?<=#{pattern})   # lookbehind
# (?!#{pattern})    # negative lookahead
# (?<!<=#{pattern}) # negative lookbehind
