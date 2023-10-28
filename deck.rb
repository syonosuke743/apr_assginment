class Deck # デッキを作って、カードを混ぜて、カードを引く処理
attr_accessor :cards

  def initiaize # Deckクラスを初期化
  @cards = deck_make #デッキを作る
  end

  def deck_make #デッキを作って混ぜる。
    marks = ["ハート","ダイヤ","スペード","クラブ"] #マークを表す配列
    value = %w(2 3 4 5 6 7 8 9 10 J Q K A) #%wで記号を省略。2～Aまでの数値を表す配列#Aが11か1で21以内なら11、21以上なら1、JQKは10にしなければならない。

    marks.product(value).map { |marks,value| Card.new(value,marks)}.shuffle 
    #marksの要素と引数、valueの要素と引数をそれぞれ合わせた配列をproductメソッドで作る。Cardクラスのインスタンスをシャッフルする。
  end

  def draw #カードを引く
    cards.pop #popで配列の末尾を消す。重複を防ぐ。
  end
end
