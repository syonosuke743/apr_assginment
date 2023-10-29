class Card
  attr_reader :value, :mark  # カードの値とスートの読み取り専用アクセサを定義

  def initialize(value, mark)  # Cardクラスの初期化。値とスートを引数に取る
    @value = value  # カードの値をインスタンス変数に設定
    @mark = mark    # カードのスートをインスタンス変数に設定
  end

  def to_s  # markとvalueの値を返す。to_sは数値を文字列に変えたいときに使う。ここは他のメソッド名にするとエラーが出る。
    "#{mark}の#{value}"
  end

  def point  # カードのポイントを計算
    case value
    when 'A' then 11 #valueのAは11
    when 'K', 'Q', 'J' then 10 #valueのJQKは10
    else value.to_i
    end
  end
end

