class Player
  attr_reader :hand  # プレイヤーの手札の読み取り専用アクセサを定義

  def initialize  # Playerクラスの初期化
    @hand = Hand.new
  end

  def hit(card)  # プレイヤーがカードをヒットする
    hand.add_card(card)
  end
end
