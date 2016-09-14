module Ini
  def self.parse(content)
    Parser.new(content).hash
  end

  def self.load_file(path)
    Ini.parse(File.read(path))
  end

  def self.dump(hash)
    Dumper.new(hash).ini
  end

  class Parser
    attr_reader :hash
    def initialize(content)
      @hash = {}
      parse(content)
    end

    def parse(content)
      section = nil
      content.each_line do |l|
        l.strip!
        case l
        when /\A[;#]/
          # comment out
        when /\A\[([^\]]+)\]\s*(?:[;#])?/
          section = $1.strip
          @hash[section] ||= {}
        when /\A(.*?)=(.*)\z/
          key = $1.strip
          val = type_cast $2.strip

          if section.nil?
            @hash['DEFAULT'] ||= {}
            @hash['DEFAULT'][key] = val
          else
            @hash[section][key] = val
          end
        else
        end
      end
    end

    def type_cast(data)
      case data
      when /\Atrue\z/i
        true
      when /\Afalse\z/i
        false
      else
        Integer(data) rescue Float(data) rescue data
      end
    end
  end

  class Dumper
    attr_reader :ini
    def initialize(hash)
      @ini = hash.map { |h| "[#{h.first}]\n" + h.last.map {|k,v| "#{k}=#{v}"}.join("\n") }.join("\n")
    end
  end
end
