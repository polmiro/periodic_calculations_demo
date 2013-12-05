time = Time.now

10.times do |i|
  Purchase.create(
    :price => 4000,
    :discount => 40,
    :created_at => time - (10 - i).days,
    :paid_at => time - (5 - i).days
  )
end

10.times do |i|
  Purchase.create(
    :price => 10000,
    :discount => 200,
    :created_at => time - (10 - i).months,
    :paid_at => time - (5 - i).months
  )
end

10.times do |i|
  Purchase.create(
    :price => 5000,
    :discount => 500,
    :created_at => time - (10 - i).weeks,
    :paid_at => time - (5 - i).weeks
  )
end
