class Dealer < Player  # DealerクラスはPlayerクラスを継承
  def show_card  # ディーラーが一枚のカードを見せるメソッド
    hand.cards.first #.firstメソッドで配列の先頭の要素を返す。
  end
end
