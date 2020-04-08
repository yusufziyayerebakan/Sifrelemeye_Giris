# 6 basamakli asal sayiları bulan program
def asal_control(number)
    2.step number,1 do |i|
        if (number % i == 0)
            if (i != number)
                return false
            end
        end
    end
    return true
end

100000.step 999999,1 do |i|
    if asal_control(i)
        print "ASAL SAYI: %s\n" % i
    else
        # print "%s degil\n" % i
    end
end