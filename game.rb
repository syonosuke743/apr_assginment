class Card #カードの値とマークを管理して、カードの情報を表示する。
  attr_reader :value, :marks
  
  def  initialize(value, marks)#Cardクラスの初期化
    @value = value
    @marks = marks
  end
  
  def string_change #マークとカードの値を文字列にする
    "#{marks}の#{value}"
  end
  
  def point #カードのポイントを計算
     case value #valueのJQKAの値の処理
     when 'A' then 11
     when 'J','Q','K' then 10 
     else
       value.to_i #JQKA以外は数値がポイント
     end
  end
  
end

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
        num + card.point #今の合計ポイントにカードのポイントを加算ポイントはCardクラスで定義
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

class Player
  attr_reader :hand #プレイヤーのハンドを読み取る

  def initiaize #Playerクラスの初期化
    @hand = Hand.new
  end

  def add_hand(card)
    hand.add_card(card) # Handクラスで定義した手札にカードを追加するメソッドを使う。
  end
end

class Dealer < Player# ディーラークラスはプレイヤークラスを継承

  def show_card
    hand.cards.first #.firstは配列の先頭の要素を返すメソッド。
  end
end

class Deck # デッキを作って、カードを混ぜて、カードを引く処理
  attr_reader :cards
  
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
  


class Game
  attr_reader :player, :dealer, :deck, 

  def initiaize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def card_distribute(deck) #プレイヤーとディーラーに最初のカードを配る。
    2.times do
      player.add_hand(deck.draw) #Deckクラスのadd_handメソッドで引数のdeck変数にデッキクラスのdrawメソッドをつける。
      dealer.add_hand(deck.draw)
    end
  end

  def start
    puts "ブラックジャックを開始します。"

    puts "あなたの引いたカードは#{player.hand.cards[0]}です。"#cards配列の要素0を見せる
    puts "あなたの引いたカードは#{player.hand.cards[1]}です。"#cards配列の要素1を見せる
    puts "ディーラーの引いたカードは#{dealer.show_card}です。" #Dealerクラスのshow_cardメソッドで１枚目を表示
    puts "ディーラーの引いた2枚目のカードはわかりません。"

    loop do
      puts "あなたの得点は#{player.hand.point}ですカードを引きますか？（Y/N）" #Nならループを抜ける
      choice = gets.chomp
      break if choice =="N"

      if choice =="Y" #Yならカードを引いて、ポイントが21より大きいならループを抜ける。
        card = deck.draw
        player.add_card(card)
        puts "あなたの引いたカードは#{card}です。"
        break if player.hand.card_bust
      end
    end

    if player.hand.card_bust #もしプレイヤーがバーストしていたら
     puts "あなたの現在の得点は#{player.hand.total_point}です。"
     puts "バーストしました。あなたの負けです。"
    else
    puts "ディーラーの引いた２枚目のカードは#{dealer.hand.cards[1]}でした。" #cards配列の要素1（2枚目）を見せる。
    puts"ディーラーの得点は#{dealer.hand.total_point}です。"
    end

    while dealer.hand.total_point < 17 #ディーラーは手札が17を超えるまでカードを追加。
      card = deck.draw
      dealer.add_card(card)
      puts "ディーラーの引いたカードは#{card}です。"
      puts "ディーラーの得点は#{dealer.hand.total_point}です。"
    end

    if dealer.hand.card_bust #もし、ディーラーがバーストしていたら
      puts "ディーラーの得点は#{dealer.hand.total_point}です。"
    elsif player.hand.total_point > dealer.hand.total_point #プレイヤーの合計値がディーラーより大きいとき
      puts "あなたの得点は#{player.hand.total_point}です。"
      puts "ディーラーの得点は#{dealer.hand.total_point}です。"
      puts "あなたの勝ちです。"
    elsif player.hand.total_point < dealer.hand.total_point #プレイヤーの合計値がディーラーよりも小さいとき
      puts "あなたの得点は#{player.hand.total_point}です。"
      puts "ディーラーの得点は#{dealer.hand.total_point}です。"
      puts "あなたの負けです。"
    else
      puts "引き分けです。"
    end
  end
end

Game.new.start