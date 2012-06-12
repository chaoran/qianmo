module ProfilesHelper
  def to_sex(is_male)
    if is_male.nil?
      ""
    elsif is_male
      t :male
    else
      t :female
    end
  end
end
