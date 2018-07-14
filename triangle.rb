
class Triangle

  def initialize x, y, z
    unless x.is_a?(Integer) && y.is_a?(Integer) && x.is_a?(Integer)
      raise ArgumentError.new("引数は整数を指定してください。")
    end
    @lengths = [x, y, z].sort
  end

  # 0: 三角形ではない
  # 1: 正三角形
  # 2: 二等辺三角形
  # 3: 不等辺三角形
  def shape
    if @lengths[0] + @lengths[1] <= @lengths[2]
      0
    elsif @lengths.uniq.size == 1
      1
    elsif @lengths.uniq.size == 2
      2
    else
      3
    end
  end

end

#--------------------
# 入力チェック
#--------------------

unless ARGV.length == 3
  puts "引数は３つ指定してください。"
  return
end

ARGV.each do |arg|
  unless arg =~ /^[0-9]*$/
    puts "引数は正の整数を指定してください。"
    return
  end
end

#--------------------
# 実行
#--------------------

shape = Triangle.new(ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i).shape

puts case shape
when 0 then '三角形じゃないです＞＜'
when 1 then '正三角形ですね！'
when 2 then '二等辺三角形ですね！'
when 3 then '不等辺三角形ですね！'
end
