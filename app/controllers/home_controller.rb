class HomeController < ApplicationController

  def get_first_day_of_each_week_for_a_year
    this_day = Date.today
    calendar_days = 365
    start_day = this_day - calendar_days
    end_day = this_day
    while start_day.sunday? == false
      start_day -= 1
      calendar_days += 1
    end
    while end_day.saturday? == false
      end_day += 1
      calendar_days += 1
    end
    @weeks = []
    index_day = start_day
    while index_day <= end_day
       @weeks.push(index_day)
       index_day += 7
    end
    return @weeks
  end

  def get_tech_ids_to_uses
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
    return @tech_ids_to_uses
  end

  def hello
    puts "Hello, World!"
  end
  
  def index
  end

end
