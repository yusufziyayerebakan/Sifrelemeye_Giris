# 5 basamakli palindromik sayilari bulan program

10000.step 99999,1 do |i|
    i = i.to_s
    if i[0] == i[4] 
        if i[1] == i[3]
            print "%s bu bir polindromdur.\n" % i
        end
    end
end