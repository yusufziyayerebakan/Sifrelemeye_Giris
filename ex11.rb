#Porta'nın Digrafik Şifresi

#alfabe oluştur
$harfler = String.new("abcçdefgğhıijklmnoöprsştuüvyz")

def sifrele(metin, matris)
    print(metin)
    metin_index = []
    sifreli_metin = ""
    x=0
    y=0
    if metin.length%2==1
        metin.concat($harfler[rand(0..28)])
    end

    0.step metin.length-1,1 do |i|
        metin_index.push($harfler.index(metin[i]))
    end

    0.step metin.length-1,1 do |i|
        if i%2==0
            x=metin_index[i]
        else
            y=metin_index[i]
            sifreli_metin.concat(matris[x][y].to_s)
        end
    end

    return(sifreli_metin)
end

def coz(sifrelenmis_metin, matris)
    print("coz\n")
    orjinal_metin=""
    depo=""
    0.step sifrelenmis_metin.length-1,1 do |i|
        depo.concat(sifrelenmis_metin[i].to_s)
        if (i+1)%3==0
            result = []
            matris.each_with_index do |row, i|
                row.each_with_index do |value, j|
                    result << [i, j] if value == depo.to_i
                end
            end
            orjinal_metin.concat($harfler[result[0][0]])
            orjinal_metin.concat($harfler[result[0][1]])
            depo=""
        end
    end
    return(orjinal_metin)
end

rand_numbers = (100..999).to_a.shuffle 

#dizileri oluştur
matris = Array.new(29)
0.step 28,1 do |i|
    matris[i] = Array.new(29)
end

#matrisi doldur
$shifted_values=""
0.step 28,1 do |i|
    0.step 28,1 do |j|
        matris[i][j]=rand_numbers.pop
    end
end

print "metin gir:\n"
metin = gets.chomp

sifrelenmis_metin = sifrele(metin, matris)

print "\nşifrelenmiş metin: ",sifrelenmis_metin,"\n"

print "orjinal metin : ",coz(sifrelenmis_metin, matris),"\n"