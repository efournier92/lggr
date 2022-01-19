class Week

  attr_reader   :year, :month, :days
  attr_accessor :index, :days_this_week

  def initialize(index, days_this_week, year, month)
    @index = index
    @month = month
    @year = year
    @days_this_week = days_this_week
    @days = []

    last_day = 0
    Week.days.each_with_index do | (day_name, day_tasks), index |
      month_day = days_this_week[index]
      # increment month if it's a new month
      month += 1 if month_day < last_day
      # reset to January after December
      month = 1 if month == 13
      # adjust year on January 1st
      year += 1 if month == 1 && month_day == 1 && ( @index > 5 || index != 0 )
      day = Day.new(day_name, day_tasks, year, month, month_day)
      @days.push(day)
      last_day = month_day 
    end
  end
  
  def self.pch_spectrum
    "Pch(\n  Spectrum(),\n)"
  end



  def self.days
    task = Task.new
    { 
      "Monday"    => [task.amazon_fresh_recieve, task.pch_spectrum, task.vitamins_take, task.apartment_kitchen_all_clean, task.aquarium_jar_water_change, task.git, task.music, task.nobo],
      "Tuesday"   => [task.apartment_trash_out, task.pch_spectrum, task.vitamins_take, task.aquarium_jar_water_change, task.git, task.music],
      "Wednesday" => [task.pch_spectrum, task.vitamins_take, task.aquarium_jar_and_tank_water_change, task.car_camry_run, task.takeout, task.git, task.music, task.nobo],
      "Thursday"  => [task.pch_spectrum, task.vitamins_take, task.aquarium_jar_water_change, task.git, task.music],
      "Friday"    => [task.pch_spectrum_v1_hours, task.vitamins_take, task.aquarium_jar_and_tank_water_change, task.bank_all, task.lg_audio, task.git, task.music],
      "Saturday"  => [task.amazon_buy, task.amazon_fresh_buy, task.git, task.music, task.laptop_folders_clean, task.jeopardy_backup, task.backup_weekly, task.media_consume],
      "Sunday"    => [task.git, task.call_mom_and_dad, task.aquarium_jar_and_tank_water_change, task.juice_make, task.apartment_all, task.docs_scan, task.screens_clean, task.groom_all, task.apartment_trash_out, task.car_camry_run, task.takeout, task.lg_all, task.music, task.media_consume]
    }
  end

  def self.days_this_week(day, month, days_in_months)
    day_array = []
    days_in_month = days_in_months[month - 1]
    7.times do
      if day > days_in_month
        day = 1
      end
      day_array.push(day)
      day += 1
    end
    day_array
  end

  def self.add_first_week(do_year)
    do_year.
      last_monday_of_previous_year = 31 - ( 7 - first_day )
    days_this_week = Week.days_this_week(last_monday_of_previous_year, 
                                         1, @days_in_months)
    year = @year - 1
    first_week = Week.new(0, days_this_week, year, 12)
    @weeks.push(first_week)
  end

  def self.add_final_week
    last_day_of_previous_year = @weeks.last.days.last
    last_monday_of_previous_year = last_day_of_previous_year.month_day
    if last_day_of_previous_year.month != 1
      days_this_week = Week.days_this_week(last_monday_of_previous_year, 
                                           12, @days_in_months)
      final_week = Week.new(53, days_this_week, last_day_of_previous_year.year, 12)
      @weeks.push(final_week)
    end
  end

end

