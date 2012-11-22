#encoding: utf-8

['Минская Область', 'Гродненская Область'].each do |t|
  Region.create!(:title => t) unless Region.where(:title => t).any?
end

minsk_reg = Region.where(:title => 'Минская Область').first
grodno_reg = Region.where(:title => 'Гродненская Область').first

[['Свирь', 54.84821, 26.40015], ['Несвиж', 53.21735, 26.67815], ['Будслав', 54.785786, 27.45632],
 ['Лебедево', 54.31263, 26.71068], ['Замостье', 53.20808, 27.59319]].each do |t_coordinate|
  if WindGenerator.where(:title => t_coordinate[0]).empty?
    p "creating #{t_coordinate[0]} in #{minsk_reg.title}"
    WindGenerator.create!(:title => t_coordinate[0],
                          :min_rated_power => 1 + rand(5),
                          :max_rated_power => 10 + rand(5),
                          :min_rated_wind_speed => 2 + rand(3),
                          :max_wind_speed => 7 + rand(3),
                          :latitude   => t_coordinate[1],
                          :longitude => t_coordinate[2],
                          :gmaps => true,
                          :region => minsk_reg)
  end
end

[['Любча', 53.75275, 26.05502], ['Жировичи', 53.01307, 25.34486], ['Мир', 53.452, 26.46984]].each do |t_coordinate|
  if WindGenerator.where(:title => t_coordinate[0]).empty?
    p "creating #{t_coordinate[0]} in #{grodno_reg.title}"
    WindGenerator.create!(:title => t_coordinate[0],
                          :min_rated_power => 1 + rand(5),
                          :max_rated_power => 10 + rand(5),
                          :min_rated_wind_speed => 2 + rand(3),
                          :max_wind_speed => 7 + rand(3),
                          :latitude  => t_coordinate[1],
                          :longitude  => t_coordinate[2],
                          :gmaps => true,
                          :region => grodno_reg)
  end
end