#!/usr/bin/env ruby
# Combining regular expressions with Regexp.union
# Avdi Grimm has covered this in his Ruby Tapas screencast (paid)
# http://www.rubytapas.com/episodes/199-Regexp-Union

head_re = /(?<head><[\/]?head>)/i
body_re = /(?<body><[\/]?body>)/
paragraph_re = /(?<paragraph><[\/]?p>)/

test_text = <<EOP
<head>
  <title>This</title>
  <meta></meta>
</head>
<body>
  <div>Unprinted text.<div>
  <p>Some text.</p>
</body>
EOP

re =  Regexp.union(
        head_re,
        body_re,
        paragraph_re
      )

test_text.each_line do |line|
  line.chomp
  # The === operator returns true if the string on the
  # right matches the regular expression on the left
  puts "#{line}" if re === line
end

puts '','The regular expression',re.inspect
puts '','As you can see, it preserves any regex flags you include.'

__END__
<head>
</head>
<body>
  <p>Some text.</p>
</body>

The regular expression
/(?i-mx:(?<head><[\/]?head>))|(?-mix:(?<body><[\/]?body>))|(?-mix:(?<paragraph><[\/]?p>))/

As you can see, it preserves any regex flags you include.
