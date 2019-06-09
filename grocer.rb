def consolidate_cart(cart)
  # code here
  cart.each do |key,value|
    
    if cart[key].include?(:count)
      cart[key][:count] += 1
    else
      cart[key][:count] = 1
    end
  end
  return cart
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
