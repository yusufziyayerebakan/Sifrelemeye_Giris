def sifrele(metin, kare_genisligi)
    sifrelenmis_metin = metin + "#"*(kare_genisligi - metin.length%kare_genisligi)
    sezar_karesi = Array.new(kare_genisligi)
    sezar_karesi = kare_olustur(sifrelenmis_metin, sezar_karesi, kare_genisligi, kare_genisligi)
    sifrelenmis_metin = kare_coz(sezar_karesi, kare_genisligi, metin.length)

    return(sifrelenmis_metin)
end

def coz(sifrelenmis_metin, kare_genisligi)
    yukseklik=((sifrelenmis_metin.length).to_f/kare_genisligi).ceil
    sezar_karesi = Array.new(yukseklik)
    sezar_karesi = kare_olustur(sifrelenmis_metin, sezar_karesi, kare_genisligi, yukseklik)
    orjinal_metin = kare_coz(sezar_karesi, kare_genisligi, sifrelenmis_metin.length)

    return(orjinal_metin)
end

def kare_coz(kare, genislik , metin_boyutu)
    metin=""
    0.step genislik-1,1 do |i|
        0.step genislik-1,1 do |j|
            if i+j < metin_boyutu
                if kare[i][j]!=nil
                    metin.concat(kare[i][j])
                end
            end
        end
    end
    return metin
end 

def kare_olustur(metin, kare, genislik, yukseklik)
    0.step yukseklik,1 do |i|
        kare[i] = Array.new(genislik)
    end
    counter=0
    0.step genislik-1,1 do |i|
        0.step yukseklik-1,1 do |j|
            if i+j < metin.length
                kare[j][i]=metin[counter] 
            else
                kare[j][i]=nil
            end
            counter=counter+1
        end
    end
    return kare
end

def boyut_hesapla(metin)
    i=1
    while true
        if metin.length <= (i*i)
            break
        end
        i=i+1
    end
    return i
end

print("->  Metin giriniz :\n")
#gets.chomp tek satır şeklinde alınmasını sağlıyor
metin = gets.chomp

while true
    print("\n->  Metin giriniz :\n")
    metin = gets.chomp
    if metin.length == 0
        puts "metin girmediniz"
        next
    end
    break
end

kare_genisligi = boyut_hesapla(metin)
sifrelenmis_metin = sifrele(metin, kare_genisligi)
orjinal_metin = coz(sifrelenmis_metin, kare_genisligi)
print("->   Algoritmalardan çıkan Metinler : \n")
print("# Şifrelenmiş metin : ",sifrelenmis_metin,"\n")
print("# Orjinal metin : ",orjinal_metin,"\n")
sifrelenmis_metin.delete! '#'
orjinal_metin.delete! '#'
print("->   Temizlenmiş metinler : \n")
print("# Şifrelenmiş metin : ",sifrelenmis_metin,"\n")
print("# Orjinal metin : ",orjinal_metin)