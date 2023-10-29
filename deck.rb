class Deck
  attr_reader :cards  # デッキ内のカードの読み取り専用アクセサを定義

  def initialize  # Deckクラスの初期化
    @cards = make_deck  # デッキを作る。
  end

  def make_deck  # 52枚のカードを作ってシャッフル
    marks = ["ハート", "ダイヤ", "スペード", "クローバー"]  # 4種類のマークを表す配列
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K","A" ] # 2から10までの数値およびA, K, Q, Jを表す配列
  
    marks.product(values).map { |mark, value| Card.new(value, mark) }.shuffle 
    #.productでレシーバの配列と引数で与えられた配列のそれぞれの要素を一個ずつとって配列とする。それらすべての配列を要素とする配列を返す。
    # スートと値のすべての組み合わせを生成し、それぞれの組み合わせに対してCardインスタンスを作成。
    #.mapでmarkとvalueの配列に対して処理を行った結果を返す。
  end
  

  def draw  # デッキから一枚のカードを引くメソッド
    cards.pop #カードの重複を防ぐため、popメソッドで配列を削除する。
  end
end