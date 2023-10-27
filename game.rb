class Game_start
  def start(dealer,player,deck)
    #デッキをシャッフル
    puts "あなたの引いたカードは#{key}の#{value}です。"
    puts "あなたの引いたカードは#{key}の#{value}です。"
    puts "ディーラーの引いたカードは#{key}の#{value}です。"
    puts "ディーラーの引いた2枚目のカードはわかりません。"
    puts "あなたの得点は#{}ですカードを引きますか？（Y/N）"
    get.chomp 
    if get.chomp =  Y #得点が２２以上もしくはNを選ぶまでYの処理を繰り返す。
    puts "あなたの引いたカードは#{key}の#{value}です。"
    puts "あなたの現在の得点は#{key}の#{value}です。カードを引きますか？（Y/N）"
    get.chomp
    if xxx = N #得点が22以上になる。もしくはNを選択したらNの処理を行う
      puts "ディーラーの引いた２枚目のカードは#{key}の#{value}でした。"
      puts "ディーラーの現在の得点は#{}です"
      puts "ディーラーの引いたカードは#{key}の#{value}です"
      puts "あなたの得点は#{}です。"
      puts "ディーラーの得点は#{}です。"
    if # ディーラーとプレイヤーの得点が21点以内かつディーラー＜プレイヤーなら
      puts "あなたの勝ちです！"
    elsif # ディーラーとプレイヤーの得点が21点以内かつディーラー＞プレイヤーなら
      puts "あなたの負けです！"
    else
      puts "引き分けです！"
    end
      puts "ブラックジャックを終了します。"
  end


