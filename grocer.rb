def consolidate_cart(cart)
  # code here
  c = {}
  cart.each do |item|  
    if c.include?(item.keys[0])
        if c[item.keys[0]].include?(:count)
          c[item.keys[0]][:count] += 1
        end
    else
      c[item.keys[0]] = item.values[0] 
      c[item.keys[0]][:count] = 1
    end
  end
  return c
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|  
    if cart.include?(coupon[:item])
      coupName = coupon[:item] + " W/COUPON"
      if cart[coupName]
        if cart[coupon[:item]][:count] > coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
          cart[coupName][:count]+= coupon[:num]
        elsif cart[coupon[:item]][:count] == coupon[:num]
          cart[coupName]+= coupon[:num]
          cart.delete(coupon[:item])
        end
      else
        if cart[coupon[:item]][:count] > coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
          cart[coupName]={count: coupon[:num], price: coupon[:cost]/coupon[:num],clearance: cart[coupon[:item]][:clearance]}
        elsif cart[coupon[:item]][:count] == coupon[:num]
          cart[coupName]={count: coupon[:num], price: coupon[:cost]/coupon[:num], clearance: cart[coupon[:item]][:clearance]}
          cart.delete(coupon[:item])
        end
      end
    end
  end
  p cart
  return cart
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
