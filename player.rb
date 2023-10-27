class player
  attr_accessor :hand #プレイヤーのハンドを読み取る

  def initiaize #Playerクラスの初期化
    @hand = Hand.new
  end

  def add_hand(card)
    hand.add_card(card)
  end
end
