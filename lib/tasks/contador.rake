task :contador  => :environment do
  desc "///"

  @user = User.all
  @registrocounter = []
  @user.each do |u|
    @registrocounter.push("#{u.name}: #{u.registros.count}")
    puts @registrocounter
  end

  # persona = User.all
  # counter = []
  # persona.each do |u| counter.push("#{u.name}: #{u.registros.count}, #{u.registros.count.created_at}")
  # end

  # persona = User.all
  # counter = []
  # persona.each do |u|counter.push("#{u.name}:#{u.registros.count}")
  # end

  # persona.each do |u| counter.push("#{u.name}:#{u.registros.count}, #{u.registros.count.created_at}")
  # end

end

