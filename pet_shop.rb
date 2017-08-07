def pet_shop_name(name)
  return name[:name]
end

def total_cash(account)
  return account[:admin][:total_cash]
end

def add_or_remove_cash(account, cash)
  return account[:admin][:total_cash] += cash
end

def pets_sold(shop_identifier)
  return shop_identifier[:admin][:pets_sold]
end

def increase_pets_sold(shop, sales)
  return shop[:admin][:pets_sold] += sales
end

def stock_count(shop)
  return shop[:pets].length()
end

def pets_by_breed(shop,breed_name)
  pets = []
  for pet in shop[:pets] do
    if  pet[:breed] == breed_name
      pets.push(pet[:breed])
    end
  end
return pets
end

def find_pet_by_name(shop, pet_name)
  for pet in shop[:pets] do
    if pet[:name] == pet_name
      return pet
    end
  end
return nil
end

def remove_pet_by_name(shop, pet_name)
  for pet in shop[:pets] do
    if pet[:name] == pet_name
      shop[:pets].delete(pet)
      end
  end
end

def add_pet_to_stock(shop, new_stock)
  shop[:pets].push(new_stock)
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet)
   if customer[:cash] >= pet[:price]
     return true
   end
   return false
end



def sell_pet_to_customer(shop, pet, customer)
  if pet == nil
    return "We don't have this pet in our shop"
  end
  sufficient_funds = customer_can_afford_pet(customer, pet)
  if sufficient_funds == false
    return "Sorry, your card has been declined"
  end
  add_pet_to_customer(customer, pet)
  add_or_remove_cash(shop, pet[:price])
  increase_pets_sold(shop, 1)
end
