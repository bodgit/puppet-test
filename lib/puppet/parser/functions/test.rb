module Puppet::Parser::Functions
  newfunction(:test, :type => :rvalue, :doc => <<-EOS
Test function
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, 'test(): Wrong number of arguments ' +
      "given (#{arguments.size} for 1)") if arguments.size != 1

    item = arguments[0]

    unless item.is_a?(Array) || item.is_a?(String)
      raise(Puppet::ParseError, 'test(): Requires either array or string ' +
        'to work with')
    end

    if item.is_a?(String)
      item = [item]
    end

    return item.collect { |x| 'test' }
  end
end
