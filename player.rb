class Player
  attr_accessor :hand #プレイヤーのハンドを読み取る

  def initiaize #Playerクラスの初期化
    @hand = Hand.new
  end

  def add_hand(card)
    hand.add_card(card) # Handクラスで定義した手札にカードを追加するメソッドを使う。
  end
end


