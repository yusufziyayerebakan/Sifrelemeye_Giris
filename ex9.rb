#Tek alfabeli yerine yerleştirme kriptolama algoritması

$alfabe="abcçdefgğhıijklmnoöprsştuüvyz"

print("metin gir:\n")
metin = gets()
alfabe_1="abcçdefgğhıijklmnoöprsştuüvyz"
anahtar=""

def sifrele(metin, anahtar)
    sifreli_metin=""
    anahtar_index = []
    metin_index = []
    0.step metin.length-2,1 do |i|
        metin_index.push($alfabe.index(metin[i]))
    end
    0.step metin.length-2,1 do |i|
        sifreli_metin.concat(anahtar[metin_index[i]])
    end
    return sifreli_metin
end

def sifreCoz(sifreli_metin, anahtar)
    cozulmus_metin=""
    anahtar_index = []
    metin_index = []
    0.step sifreli_metin.length-1,1 do |i|
        metin_index.push(anahtar.index(sifreli_metin[i]))
    end
    0.step sifreli_metin.length-1,1 do |i|
        cozulmus_metin.concat($alfabe[metin_index[i]])
    end
    return cozulmus_metin
end

def alfabeOlustur(alfabe_1, anahtar)
    0.step 28,1 do |i|
        a=rand(0..(28-i))
        anahtar=anahtar+alfabe_1[a]
        alfabe_1=alfabe_1.gsub(alfabe_1[a],"")
    end
    return anahtar
end

anahtar = alfabeOlustur(alfabe_1, anahtar)
print "\nalfabe :"
print alfabe_1
print "\nanahtar:"
print anahtar

print "\nşifreli:"
print sifrele(metin,anahtar)
print "\nçözülmüş:"
print sifreCoz(sifrele(metin,anahtar),anahtar)
print "\n"

=begin
    s=merhaba
    s=s.gsub("m","")
=end