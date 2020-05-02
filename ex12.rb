#ADFGVX Şifresi

#alfabe oluştur
$ADFGVX_harfler = "ADFGVX"

def sifrele(metin, anahtar, matris)
    sifrelenmis_metin = ""

    ####################################################################################
    ### 2. ADIM: Şifreleneek metindeki harferin karşısına düşen harf çiftileri       ###
    ### tablodan bulunur:                                                            ###
    ####################################################################################
    depo=""
    0.step metin.length-1,1 do |i|
        depo.concat(metin[i].to_s)
        indx_result = []
        matris.each_with_index do |row, i|
            row.each_with_index do |value, j|
                indx_result << [i, j] if value == depo
                break if value == depo
            end
        end
        sifrelenmis_metin.concat($ADFGVX_harfler[indx_result[0][0]])
        sifrelenmis_metin.concat($ADFGVX_harfler[indx_result[0][1]])
        depo=""
    end

    ####################################################################################
    ### 3. ADIM: Daha öne belirlenmiş bir anahtarın (Örneğin KALE) altına yukarıdaki ###
    ### yarı şifrelenmiş metin satır satır aşağıdakidaki gibi dağıtılır:             ###
    ####################################################################################
    anahtar_matris = Array.new((sifrelenmis_metin.length.to_f/anahtar.length).ceil)
    0.step anahtar_matris.length-1,1 do |i|
        anahtar_matris[i] = Array.new(anahtar.length)
    end
    counter=0
    0.step anahtar_matris.length-1,1 do |i|
        0.step anahtar_matris[0].length-1,1 do |j|
            if counter<sifrelenmis_metin.length
                anahtar_matris[i][j]=sifrelenmis_metin[counter]
            else
                anahtar_matris[i][j]='.'
            end
            counter=counter+1
        end
    end

    ####################################################################################
    ### 4. ADIM: Yukarıdaki sütunlar anahtar kelimenin harferinin alfabetik          ###
    ### sırasına göre yer değiştirir:                                                ###
    ####################################################################################
    sirali_anahtar = anahtar.sort
    indx_array = Array.new(anahtar.length)
    sirali_anahtar.each_with_index do |row, i|
        anahtar.each_with_index do |value,j|
            if value == sirali_anahtar[i]
                indx_array[i] = j
                anahtar[j]=nil
                break
            end
        end
    end

    son_matris = Array.new((sifrelenmis_metin.length.to_f/anahtar.length).ceil)
    0.step son_matris.length-1,1 do |i|
        son_matris[i] = Array.new(anahtar.length)
    end
    counter=0
    0.step son_matris.length-1,1 do |i|
        0.step son_matris[0].length-1,1 do |j|
            son_matris[i][j]=anahtar_matris[i][indx_array[j]] if anahtar_matris[i][indx_array[j]] != '.'
            counter=counter+1
        end
    end

    ####################################################################################
    ### 5. ADIM: Yukarıdaki sütunlar sırası ile birleştirilip şifrelenmiş metin      ###
    ### elde edilir:                                                                 ###
    ####################################################################################
    sifrelenmis_metin=son_matris.join()
    return(sifrelenmis_metin)
end

def coz(sifrelenmis_metin, anahtar, matris)
    orjinal_metin=""
    anahtar_yedek = anahtar.split('')
    sirali_anahtar = anahtar_yedek.sort
        

    ####################################################################################
    ### anahtar matrisini oluşturalım                                                ###
    ####################################################################################
    anahtar_matris = Array.new((sifrelenmis_metin.length.to_f/anahtar.length).ceil)
    0.step anahtar_matris.length-1,1 do |i|
        anahtar_matris[i] = Array.new(anahtar.length)
    end

    ####################################################################################
    ### anahtar matrisinin içerisine şifreli metin boyutunca karakter yerleştirelim  ###
    ####################################################################################
    counter=0
    0.step anahtar_matris.length-1,1 do |i|
        0.step anahtar_matris[0].length-1,1 do |j|
            anahtar_matris[i][j]='.' if sifrelenmis_metin[counter]!=nil
            counter=counter+1
        end
    end

    ####################################################################################
    ## anahtar harflerinin sıralı hali için index numaralarını alalım                ###
    ####################################################################################
    indx_array = Array.new(anahtar.length)
    sirali_anahtar.each_with_index do |row, i|
        anahtar_yedek.each_with_index do |value,j|
            if value == sirali_anahtar[i]
                indx_array[i] = j
                anahtar_yedek[j]=nil
                break
            end
        end
    end

    ####################################################################################
    ## sıralanmamış anahtar matrisini oluşturalım                                    ###
    ####################################################################################
    sirasiz_anahtar_matris = Array.new((sifrelenmis_metin.length.to_f/anahtar.length).ceil)
    0.step anahtar_matris.length-1,1 do |i|
        sirasiz_anahtar_matris[i] = Array.new(anahtar.length)
    end

    ####################################################################################
    ## sıralanmamış anahtar matrisinin içerisine şifreli metinimizi yerleştirelim    ###
    ####################################################################################
    counter=0
    0.step sirasiz_anahtar_matris.length-1,1 do |i|
        0.step anahtar_matris[0].length-1,1 do |j|
            if anahtar_matris[i][indx_array[j]] == '.'
                sirasiz_anahtar_matris[i][j]=sifrelenmis_metin[counter] 
                counter=counter+1
            end
        end
    end

    ####################################################################################
    ## son matrisini oluşturalım ve içerisine anahtar matrisini düzelterek aktaralım ###
    ####################################################################################
    son_matris = Array.new((sifrelenmis_metin.length.to_f/anahtar.length).ceil)
    0.step son_matris.length-1,1 do |i|
        son_matris[i] = Array.new(anahtar.length)
    end
    0.step son_matris.length-1,1 do |i|
        0.step son_matris[0].length-1,1 do |j|
            son_matris[i][indx_array[j]]=sirasiz_anahtar_matris[i][j]
        end
    end
    sifrelenmis_metin=son_matris.join()
    sifrelenmis_metin=sifrelenmis_metin.split('')

    ####################################################################################
    ## son matris içeriğine göre tablodan orjinal metni bul                          ###
    ####################################################################################
    row=[]
    column=[]
    counter=0
    counter1=0
    # matriste kullanmak için metinin index numaralarını bul
    0.step sifrelenmis_metin.length-1,1 do |i|
        if i%2==0
            column[counter]=$ADFGVX_harfler.index(sifrelenmis_metin[i])
            counter+=1
        else
            row[counter1]=$ADFGVX_harfler.index(sifrelenmis_metin[i]) 
            counter1+=1
        end
        sifrelenmis_metin[i]=nil
    end

    # orjinal metni index numaralarını kullanarak matristen çıkart
    0.step row.length-1,1 do |i|
        orjinal_metin=orjinal_metin.concat(matris[column[i]][row[i]])
    end

    return(orjinal_metin)
end


print "metin gir:\n"
metin = gets.chomp
metin = metin.downcase
metin = metin.delete(' ')


print "anahtar gir:\n"
anahtar = gets.chomp
anahtar = anahtar.downcase
anahtar = anahtar.delete(' ')

####################################################################################
### 1. ADIM: Alfabenin harferi, 6x6'lık bir matrise rastgele dağıtılır           ###
### dizileri oluştur                                                             ###
####################################################################################
harfler="abcçdefghıijklmnoöprsştuüvyz........".chars.shuffle 
matris = Array.new(6)
0.step 5,1 do |i|
    matris[i] = Array.new(6)
end

#   6x6'lık matrise dağıt
$shifted_values=""
counter=0
0.step 5,1 do |i|
    0.step 5,1 do |j|
        matris[i][j]=harfler[counter]
        counter=counter+1
    end
end

sifrelenmis_metin = sifrele(metin, anahtar.split(''), matris)
print "şifrelenmiş metin: ",sifrelenmis_metin,"\n"
print "orjinal metin : ",coz(sifrelenmis_metin, anahtar, matris),"\n"