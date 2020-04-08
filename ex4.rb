# Euler sayısının yaklaşık değerini bulan program
e=1.0
faktoriyel=1.0
1.step 10,1 do |i|
    faktoriyel=faktoriyel*i
    e=e+1/faktoriyel
end
print "yaklaşık euler sayısı : %s\n"%e