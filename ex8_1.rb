def sifrele(metin, anahtar)
    print(metin)
    print("sifrele\n")
    return("sifreli metin\n")
end

def coz(sifrelenmis_metin, anahtar)
    print("coz\n")
    return("orjinal metin\n")
end

#dizileri oluştur
harfler=[*?a..?z]
vigenere_karesi = Array.new(26)
0.step 25,1 do |i|
    vigenere_karesi[i] = Array.new(26)
end

#viginere karesini doldur
$shifted_values=""
0.step 25,1 do |i|
    0.step 25,1 do |j|
        vigenere_karesi[i][j]=harfler[j]
    end
    shifted_value=harfler.shift 
    harfler.append(shifted_value)
end

print("anahtar gir:\n")
anahtar = gets()

print("metin gir:\n")
metin = gets()

sifrelenmis_metin = sifrele(metin, anahtar)

print(coz(sifrelenmis_metin, anahtar))