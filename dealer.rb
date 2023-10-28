
class Dealer < Player# ディーラークラスはプレイヤークラスを継承

  def show_card
    hand.cards.first #.firstは配列の先頭の要素を返すメソッド。
  end
end
