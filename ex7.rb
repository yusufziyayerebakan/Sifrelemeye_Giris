# 2 Basamakli MasterMind Oyunu
while true 
    rand_number = rand(0...98)
    str_rand_number = rand_number.to_s
    if str_rand_number[0] != str_rand_number[1]
        break
    end
end

while true
    puts str_rand_number
    puts "Bir sayı giriniz :\n"
    str_value = gets()
    user_number = str_value.to_i
    if user_number >=10 and user_number < 99 and str_value[0] != str_value[1]
		if str_value[0] == str_rand_number[0] and str_value[1] == str_rand_number[1]
			puts "Doğru sayıyı buldunuz. Tebrikler!!"
			break
		elsif str_value[0] == str_rand_number[1] and str_value[1] == str_rand_number[0]
			puts "-2"
		elsif str_value[0] == str_rand_number[0] or str_value[1] == str_rand_number[1]
			puts "+1"
		elsif str_value[0] == str_rand_number[1] or str_value[1] == str_rand_number[0]
			puts "-1"
		else 
			puts "0"
		end
    else
        puts "Girdiğiniz sayı geçerli degil"
    end
end