def consolidate_cart(cart)
  # code here
  c = {}
  cart.each do |key,value|
    if c[key].include?(:count)
      c[key][:count] += 1
    else
      c[key][:count] = 1
    end
  end
  return c
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
  sum = 0
  sum = cart.reduce{|i| sum + i}
  discount = coupons.reduce{|i| discount + i}
  return sum - discount
end
