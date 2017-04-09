require 'yaml'

def insert_comments(file)
  result = ""
  i = 0
  file.each_line do |line|
    leading_indentation = line[/^\s*/]
    comment_split = line.split("#").reverse
    if comment_split.length == 2
      result += "\n#{leading_indentation}__comment_#{i}: "
    end
    result += comment_split.join + "\n"
    i += 1
  end
  result
end

def layout_table
  table = Class.new do
    attr_reader :rows, :columns

    def initialize
      @rows = []
      @columns = []
    end

    def add_column(column_name)
      @columns << column_name
    end

    def add_row
      row = Class.new do
        attr_reader :blocks
        def initialize
          @blocks = []
        end

        def add_block(block)
          @blocks << block
        end

        def to_html
          <<-HTML
            <tr>
              #{blocks.map { |block| "<td> #{block} </td>" }.join("\n") }
            </tr>
          HTML
        end
      end.new

      yield(row)
      @rows << row
    end

    def to_html
      <<-HTML
      <table>
        <thead>
          <tr>
            #{columns.map { |col| "<th> #{col} </th>" }.join}
          </tr>
        </thead>
        <tbody>
          #{rows.map(&:to_html).join}
        </tbody>
      </table>
      HTML
    end
  end.new

  yield(table)
  table
end

def hash_to_html(hash)
  layout_table do |t|
    t.add_column("")
    t.add_column("")
    t.add_column("")
    comment = ""
    hash.each do |(key, value)|
      if key =~ /^__comment/
        comment += value
      else
        t.add_row do |r|
          r.add_block(key.to_s)
          if value.is_a? Hash
            value = hash_to_html(value)
          end
          r.add_block(value)
          r.add_block(comment)
          comment = ""
        end
      end
    end
  end.to_html
end

file = File.read(ARGV[0])
yaml = YAML.load(insert_comments(file))
puts <<-HTML
  <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
  <html lang=\"en-US\" xml:lang=\"en-US\" xmlns=\"http://www.w3.org/1999/xhtml\">
    <head>
      <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />
    </head>
    <body>
      #{hash_to_html(yaml)}
    </body>
  </html>
  HTML
