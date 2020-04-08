#vigenere şifreleme

#alfabe oluştur ve her biri için integer değer oluştur
$harfler = String.new("abcçdefgğhıijklmnoöprsştuüvyz")
$harfler_index = (0 ... $harfler.length).find_all { |i| $harfler[i,1] == '#' }

def sifrele(metin, anahtar)
    print("sifrele\n")

    sifreli_metin = ""
    anahtar_index = []
    metin_index = []
    sifreli_index = []

    0.step metin.length-1,1 do |i|
        metin_index.push($harfler.index(metin[i]))
    end

    0.step anahtar.length-2,1 do |i|
        anahtar_index.push($harfler.index(anahtar[i]))
    end

    0.step metin.length-2,1 do |i|
        index = (anahtar_index[i%(anahtar.length-1)]+metin_index[i])%29
        sifreli_index.push(index)
    end

    0.step metin.length-2,1 do |i|
        sifreli_metin.concat($harfler[sifreli_index[i]])
    end

    return(sifreli_metin)
end

def coz(sifrelenmis_metin, anahtar)
    print("coz\n")

    orjinal_metin = ""
    anahtar_index = []
    metin_index = []
    orjinal_index = []

    0.step sifrelenmis_metin.length-1,1 do |i|
        metin_index.push($harfler.index(sifrelenmis_metin[i]))
    end

    0.step anahtar.length-1,1 do |i|
        anahtar_index.push($harfler.index(anahtar[i]))
    end

    0.step sifrelenmis_metin.length-1,1 do |i|
        index = (metin_index[i]-anahtar_index[i%(anahtar.length-1)])%29
        orjinal_index.push(index)
    end

    0.step sifrelenmis_metin.length-1,1 do |i|
        orjinal_metin.concat($harfler[orjinal_index[i]])
    end

    return(orjinal_metin)
end

print("metin gir:\n")
metin = gets()

print("anahtar gir:\n")
anahtar = gets()

sifrelenmis_metin = sifrele(metin, anahtar)
print(sifrelenmis_metin)
print("\n")

orjinal_metin = coz(sifrelenmis_metin, anahtar)
print(orjinal_metin)
print("\n")