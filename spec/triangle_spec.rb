require File.expand_path(File.dirname(__FILE__) + '/../triangle')


describe Triangle do

  example "整数以外を引数に与えるとArgumentErrorが発生すること" do
    params = ['a', 1, 1]
    3.times do
      expect{Triangle.new(*params.rotate!).shape}.to raise_error(ArgumentError)
    end
  end

  example "三角形ではないこと" do
    params = [4, 5, 10]
    3.times do
      expect(Triangle.new(*params.rotate!).shape).to eq 0
    end
  end

  example "三角形ではないこと" do
    params = [5, 5, 10]
    3.times do
      expect(Triangle.new(*params.rotate!).shape).to eq 0
    end
  end

  example "不等辺三角形であること" do
    params = [5, 6, 10]
    3.times do
      expect(Triangle.new(*params.rotate!).shape).to eq 3
    end
  end

  example "二等辺三角形であること" do
    params = [6, 6, 10]
    3.times do
      expect(Triangle.new(*params.rotate!).shape).to eq 2
    end
  end

  example "二等辺三角形であること" do
    params = [9, 9, 10]
    3.times do
      expect(Triangle.new(*params.rotate!).shape).to eq 2
    end
  end

  example "二等辺三角形であること" do
    params = [9, 10, 10]
    3.times do
      expect(Triangle.new(*params.rotate!).shape).to eq 2
    end
  end

  example "正三角形でであること" do
    expect(Triangle.new(10, 10, 10).shape).to eq 1
  end

end


describe "ruby triangle.rb" do

  example "引数に３つではない場合エラーが表示されること" do
    expect(`ruby triangle.rb`).to eq "引数は３つ指定してください。\n"
    expect(`ruby triangle.rb 1 2`).to eq "引数は３つ指定してください。\n"
    expect(`ruby triangle.rb 1 2 3 4`).to eq "引数は３つ指定してください。\n"
  end

  example "正の整数以外を引数に指定した場合にエラーが表示されること" do
    params = ['a', "1", "1"]
    3.times do
      expect(`ruby triangle.rb #{params.rotate!.join(" ")}`).to eq "引数は正の整数を指定してください。\n"
    end
  end

  example "不等辺三角形であること" do
    expect(`ruby triangle.rb 2 3 4`).to eq "不等辺三角形ですね！\n"
  end

  example "二等辺三角形であること" do
    expect(`ruby triangle.rb 2 2 1`).to eq "二等辺三角形ですね！\n"
  end

  example "正三角形でであること" do
    expect(`ruby triangle.rb 1 1 1`).to eq "正三角形ですね！\n"
  end

  example "三角形ではないこと" do
    expect(`ruby triangle.rb 1 2 3`).to eq "三角形じゃないです＞＜\n"
  end

end
