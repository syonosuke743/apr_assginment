class Card #カードの値とマークを管理して、カードの情報を表示する。
attr_accessor :value, :suits

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
