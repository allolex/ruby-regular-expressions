# Regular expression strategies

Know what regular expressions (regexes) are good for, and what they don't do
well at all.

Use regexes for:

- Matching text against a pattern
- Substituting strings when they match a pattern (find and replace)
- Validating attributes against a pattern
    - The best way to validate an email address beyond idiot-checking is to
      send mail to it and confirm receipt.
- Parsing data such as log files with defined delimiters or separators.
  Some exceptions are listed below.

Do not use regexes for:

- Parsing markup such as XML (HTML). Use [Nokogiri].
- Parsing serialization formats such as JSON or YAML. Use [JSON] or [Psych]/YAML.
- Parsing URI's. Use [URI] and have a look at its [regular expressions][URI-regex]
- Parsing comma-separated values (CSV). Use [CSV].


[Nokogiri]: https://github.com/sparklemotion/nokogiri
[JSON]: https://github.com/flori/json
[Psych]: https://github.com/tenderlove/psych
[URI]: https://github.com/ruby/ruby/blob/trunk/lib/uri.rb
[URI-regex]: https://github.com/ruby/ruby/blob/trunk/lib/uri/common.rb
[CSV]: https://github.com/ruby/ruby/blob/trunk/lib/csv.rb
