@uses = Use.all
@tech_ids_to_uses = {}

@uses.each do |use|
  date_string = use.created_at.year.to_s + ", " +
                   use.created_at.month.to_s + ", " +
                   use.created_at.day.to_s
  if @tech_ids_to_uses[use.tech_id] == nil
    @tech_ids_to_uses[use.tech_id] = Set.new [date_string]
  else
    @tech_ids_to_uses[use.tech_id].add(date_string)
  end
end

@techs = Tech.all
@techs.each do |tech|
  #update tech.times_used based on number of associated uses
  if @tech_ids_to_uses[tech.id] != nil &&
        (tech.times_used == nil ||
        @tech_ids_to_uses[tech.id].size > tech.times_used)
    tech.times_used = @tech_ids_to_uses[tech.id].size
    tech.save
  end
end
