# 4 basamakli palindromik sayilari bulan program

1000.step 9999,1 do |i|
    i = i.to_s
    if i[0] == i[3]
        if i[1] == i[2]
            print "%s bu bir polindrom sayıdır.\n" % i
        end
    end
end