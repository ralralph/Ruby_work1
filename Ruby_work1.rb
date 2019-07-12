# コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
class Player
  def hand
      number = nil
      while true
        puts "数字を入力してください"
        puts "0:グー\n1:チョキ\n2:パー"

        number = gets.chomp
        if number =~ /^[0-9]+$/
          break
          else
            puts "0~2の数字を入力してください。"
        end
      end

      player_hand = number.to_i

      if player_hand == 0
        puts "あなたはグーを出しました。"
        return player_hand
        elsif player_hand == 1
          puts "あなたはチョキを出しました。"
          return player_hand
        elsif player_hand == 2
          puts "あなたはパーを出しました。"
         return player_hand
       elsif  player_hand == 4649
         puts "よろしゅう！"
         puts "ほんで何出すん？"
         player = Player.new
         hand
       elsif  player_hand == 1192296
         puts "鎌倉幕府！"
         puts "ってちゃうやん!!!"
         hand
       else puts "0~2の数字を入力してください。"
         hand
      end
  end
end


# グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
class Enemy
  def hand
    array = [0,1,2]
    enemy_hand = array.sample
    if enemy_hand == 0
      puts "相手はグーを出しました。"
      return enemy_hand
    elsif enemy_hand == 1
      puts "相手はチョキを出しました"
      return enemy_hand
    else
      puts "相手はパーを出しました。"
      return enemy_hand
    end
  end
end

# プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
# その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
# 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
class Janken
  def pon(player_hand, enemy_hand)
    num = (player_hand - enemy_hand + 3)%3
      if num == 1
        puts "あなたの負けです。"

      elsif num == 2
        puts "あなたの勝ちです。"

      else
        puts "引き分けです。"
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)
      end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
