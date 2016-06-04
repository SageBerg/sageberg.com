# To use this script:
#   $ rails runner add_uses.rb <days_back> <list of techs as arguments>
#   example:
#   $ rails runner add_uses.rb 0 Linux "Ruby on Rails" Git
#
#     This will add entries to the database for Linux, Ruby on Rails, and Git
#     and each will have their created_at attribute set to today, since the
#     days_back argument is 0.

def add_uses days_back
  use_hash = Hash.new
  @techs = Tech.all
  @techs.each do |tech|
    use_hash[tech.name] = tech.id
  end
  for arg in ARGV.slice(1..-1)
    if use_hash[arg] != nil
      Use.create(:created_at => Date.today - days_back.to_i,
                 :tech_id => use_hash[arg])
    else
      puts arg + " not found in database!"
    end
  end
end

add_uses ARGV[0]
