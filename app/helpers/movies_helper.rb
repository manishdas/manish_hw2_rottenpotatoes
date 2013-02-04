module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def get_sort_bool(sort_val)
    sort_val == false ? true : false
  end
  
  def get_css_class(sort_val)
    sort_val == true ? "hilite" : ""
  end
  
  def check_the_box(checked_ratings, rating)
    checked_ratings.include?(rating) ? true : false
  end
  
end
