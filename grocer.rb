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
    if cart.include?(coupon[:item]) && cart[coupon[:item]][:count] > coupon[:num]
      cart[coupon[:item]][:count] -= coupon[:num]
      new = coupon[:item] + " W/COUPON"
      cart[new]={count: coupon[:num], price: coupon[:cost],clearance: cart[coupon[:item]][:clearance]}
    elsif cart.include?(coupon[:item]) && cart[coupon[:item]][:count] == coupon[:num]
      new = coupon[:item] + " W/COUPON"
      cart[new]={count: coupon[:num], price: coupon[:cost], clearance: cart[coupon[:item]][:clearance]}
       cart.delete(coupon[:item])
    end
  end
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
