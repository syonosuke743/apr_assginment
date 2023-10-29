class Hand
  attr_accessor :cards  # 手札のカードのアクセサを定義

  def initialize  # Handクラスの初期化
    @cards = []
  end

  def add_card(card)  # 手札にカードを追加するメソッド
    cards << card
  end

  def points # 手札の合計ポイントを計算するメソッド
    ace = 0  # エースの数をカウントするための変数を初期化
  
    # cards配列（手札）にあるすべてのカードに対して、合計ポイントを計算
    total = cards.inject(0) do |num, card| #injectでカード配列の初期値を0にしてnumとcardを足していく。
      ace += 1 if card.value == 'A'  # カードがエースの時、エースの数を1増やす
      num + card.point  # カードのポイントを足す。
    end
  
    # 引いたカードがAAAAの場合、CardクラスでA＝11と定義しているので、AAの時点でバーストする。
    # Aをカウントして、合計が21以下ならAは11、22以上ならAを-10することによって、AAの場合は11+1、AAAAの場合は11+1+1+1となる。
    ace.times { total -= 10 if total > 21 }
    total  # 最終的な合計ポイントを返す
  end

  def bust?  # 手札がバーストしているかどうかを判定するメソッド
    points > 21
  end
end
