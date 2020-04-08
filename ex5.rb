# pi sayısının yaklaşık değerini bulan program
pi=0.0
1.step 1000,1 do |i|
    pi=pi+1.0/(i**2)
end
pi=Math.sqrt(pi*6)
print pi