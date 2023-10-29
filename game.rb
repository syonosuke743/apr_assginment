require"./card.rb"
require"./deck.rb"
require"./player.rb"
require"./dealer.rb"
require"./hand.rb"


class Game
attr_reader :player,:dealer,:deck

 def initialize
  @player = Player.new
  @dealer = Dealer.new
  @deck = Deck.new
 end

 def card_distribute #ディーラーとプレイヤーに最初のカードを配る
  2.times do
    player.hit(deck.draw)
    dealer.hit(deck.draw)
  end
 end

 def start #ゲームの進行
  puts "ブラックジャックを開始します。"
  card_distribute
  puts "あなたの引いたカードは#{player.hand.cards[0]}です。"
  puts "あなたの引いたカードは#{player.hand.cards[1]}です。"
  puts "ディーラーの引いたカードは#{dealer.show_card}です。"
  puts "ディーラーの引いた2枚目のカードは分かりません。"

  loop do 
   puts "現在の得点は#{player.hand.points}です。カードを引きますか？（Y/N）"
   choice = gets.chomp
   break if choice == "N"

   if choice == "Y" #21より大きくなるまでAAAA2222333で最大11回
    card = deck.draw
    player.hit(card)
    puts"あなたの引いたカードは#{card}です。"
    break if player.hand.bust?
   end
  end

  if player.hand.bust? #プレイヤーの手札がバーストしていたら
    puts "あなたの現在の得点は#{player.hand.points}です。"
    puts "バーストしました。あなたの負けです。"
  else
    puts "ディーラーの引いた２枚目のカードは#{dealer.hand.cards[1]}でした。"
    puts "ディーラーの現在の得点は#{dealer.hand.points}"

    while dealer.hand.points < 17 #ディーラーは17以下ならカードを引く。
      card = deck.draw
      dealer.hit(card)
      puts "ディーラーの引いたカードは#{card}です。"
      puts "ディーラーの現在の得点は#{dealer.hand.points}です。"
    end

    if dealer.hand.bust? #ディーラーがバーストした場合
      puts "ディーラーの得点は#{dealer.hand.points}です。"
      puts "あなたの勝ちです！"
    elsif player.hand.points > dealer.hand.points
      puts "あなたの得点は#{player.hand.points}です。"
      puts "ディーラーの得点は#{dealer.hand.points}です。"
      puts "あなたの勝ちです！"
    elsif player.hand.points < dealer.hand.points
      puts "あなたの得点は#{player.hand.points}です。"
      puts "ディーラーの得点は#{dealer.hand.points}です。"
      puts "あなたの負けです。"
    else
      puts "引き分けです。"
    end
    puts "ブラックジャックを終了します。"
  end
 end
end