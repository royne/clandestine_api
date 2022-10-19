module EscortsHelper
  include AplicationHelper

  def options_for_select
    activities = Activity.all
    locations = Location.all
    categories = Category.all
    options = {activities: [], locations: [], categories: []}
    activities.map { |x| options[:activities].push({label: x.name, value: x.id})}
    locations.map { |x| options[:locations].push({label: x.name, value: x.id})}
    categories.map { |x| options[:categories].push({label: x.name, value: x.id})}
    options
  end

  def escorts_randon escorts
    arr = []
    escorts.each do |escort| 
      escort.photos.each { |x| arr.push({id: escort.id, username: escort.username, photo: transform_image(x, 600), avatar: transform_image(escort.avatar, 60), visit_counter: escort.visit_counter })}
    end
    arr.shuffle.shuffle
  end

  def current_escort escort
    {
      escort: escort,
      categories: !escort.categories.blank? ? escort.categories.map { |x| {value: x.id, label: x.name} }  : [] ,
      activities: !escort.activities.blank? ? escort.activities.map { |x| {value: x.id, label: x.name} } : [],
      locations: !escort.locations.blank? ? escort.locations.map { |x| {value: x.id, label: x.name} } : [],
      photos: escort.photos.attached? ? escort.photos.map { |x|  {id:x.id, url: transform_image(x, 300)} } : [],
      avatar: escort.avatar.attached? ? transform_image(escort.avatar, 100) : "",
      role: "escort"
    }
  end
end