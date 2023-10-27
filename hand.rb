class Hand
  attr_accessor :cards

  def initialize #Handクラスの初期化
    @cards = [] #配列を用意する
  end

  def add_card(card) #手札にカードを追加する
    cards << card #cardsの配列に引数cardを追加する
  end

  def total_point #ハンドの合計を計算する
    ace = 0 #エースの数をカウントする変数を初期化

    total = cards.inject(0) do |num, card| #injectメソッドに初期値をいれ、cards配列の数値をそれぞれ足していく。
      if cards.value == 'A' #もしcordsにAがはいっていたら
        ace += 1 #Aのカウントを+１する。
        num + card.point # 今の合計ポイントにカードのポイントを加算
      end

      ace.times {total -= 10 if total >21} #ハンドがAAAAの場合、11+1+1+1としなければならない。2枚目以降のAは-10しなければならない。
                                           #CardクラスでAは11点と定義しているためAAの時点で22になってしまう。
                                           #そこで、21点を超えた場合、totalから10を引くことによって、２枚目以降のAが1として処理できる。
                                           #aceの値のカウント分ループを繰り返せば、Aは21未満なので11、AAは22以上なので-10で11となる。
      total #最終の合計ポイントを出す。
  end

    def card_bust #ハンドがバーストしているかの判定
      total_point <21
    end
  end
end
