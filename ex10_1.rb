#Sezar Kare Şifrelemesi
def sifrele(metin, kare_genisligi)
    metin = metin + "#"*(kare_genisligi - (metin.length)%kare_genisligi)
    sifrelenmis_metin = ""
    for x in (0..(kare_genisligi-1)) do
        for y in (x..(metin.length-1)).step(kare_genisligi).to_a do
            sifrelenmis_metin = sifrelenmis_metin + metin[y]
        end
    end
    return(sifrelenmis_metin)
end

def coz(sifrelenmis_metin, kare_genisligi)
    orjinal_metin = ""
    yukseklik=(sifrelenmis_metin.length/kare_genisligi).to_i
    for x in (0..(yukseklik-1)) do
        for y in (x..(sifrelenmis_metin.length-1)).step(yukseklik).to_a do
            orjinal_metin=orjinal_metin+sifrelenmis_metin[y]
        end
    end
    return(orjinal_metin)
end

while true
    print("\n->  Metin giriniz :\n")
    metin = gets.chomp
    if metin.length == 0
        puts "metin girmediniz"
        next
    end
    break
end

kare_genisligi = (Math.sqrt(metin.length)).ceil
sifrelenmis_metin = sifrele(metin, kare_genisligi)
orjinal_metin = coz(sifrelenmis_metin, kare_genisligi)

print("\n->   Algoritmalardan çıkan Metinler : \n")
print("# Şifrelenmiş metin : ",sifrelenmis_metin,"\n")
print("# Orjinal metin : ",orjinal_metin,"\n")
sifrelenmis_metin.delete! '#'
orjinal_metin.delete! '#'
print("\n->   Temizlenmiş metinler : \n")
print("# Şifrelenmiş metin : ",sifrelenmis_metin,"\n")
print("# Orjinal metin : ",orjinal_metin)