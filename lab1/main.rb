ROYALTY_PER_PAGE = 24
TYPESETTING_PER_PAGE = 1.2
COST_OF_PAPER_PER_PAGE = 0.16
COST_FOR_COVER = 3
COST_OF_INK_PER_PAGE = 0.04
AMORTIZATION_PER_PAGE = 0.08
PROFIT = 0.23
TAX = 0.30

def calculate_editorial_expenses(pages)
  royalty = ROYALTY_PER_PAGE * pages
  design = royalty * 0.3
  typesetting = TYPESETTING_PER_PAGE * pages
  royalty + design + typesetting
end

def calculate_editorial_expenses_per_book(pages, edition)
  calculate_editorial_expenses(pages) / edition
end

def calculate_printing_costs(pages)
  (COST_OF_PAPER_PER_PAGE + COST_OF_INK_PER_PAGE + AMORTIZATION_PER_PAGE) * pages + COST_FOR_COVER
end

def calculate_cost_price_per_book(pages, edition)
  editorial_per_book = calculate_editorial_expenses_per_book(pages, edition)
  printing = calculate_printing_costs(pages)
  editorial_per_book + printing
end

def calculate_profit_per_book(pages, edition)
  calculate_cost_price_per_book(pages, edition) * PROFIT
end

def calculate_tax_per_book(pages, edition)
  (calculate_cost_price_per_book(pages, edition) + calculate_profit_per_book(pages, edition)) * TAX
end

def info(pages, edition)
  editorial = calculate_editorial_expenses(pages)
  cost_price_per_book = calculate_cost_price_per_book(pages, edition)
  profit_total = calculate_profit_per_book(pages, edition) * edition
  tax_per_book = calculate_tax_per_book(pages, edition)
  total = cost_price_per_book + calculate_profit_per_book(pages, edition) + tax_per_book

  puts "Авторський гонорар: #{editorial} грн"
  puts "Собівартість книги: #{cost_price_per_book.round(2)} грн"
  puts "Прибуток видавництва від всього тиражу: #{profit_total.round(2)} грн"
  puts "Податок на один екземпляр: #{tax_per_book.round(2)} грн"
  puts "Загальна вартість одного екземпляру: #{total.round(2)} грн"
end

puts "Введіть кількість сторінок"
pages = gets.to_r
puts "Введіть кількість копій"
copies = gets.to_f

info(pages, copies)
