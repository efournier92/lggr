class Task

  def git
    "Git"
  end

  def music
    "Music()"
  end

  def career_daily
    "Career(\n  Dorsata(\n    SeeScrum,\n    WorkedUntil(),\n  ),\n)"
  end

  def teeth
    "Teeth(\n  Brush(Morning, Noon, Night,),\n  Floss(Morning, Noon, Night,),\n  Rinse(Morning, Noon, Night,),\n)"
  end

  def vitamins_take
    "Vitamins_Take(1ADay(x1Pill,), Omega3(x4000mg,), D3(x5000iu,),)"
  end

  def amazon_buy
    "Amazon_Buy()"
  end

  def amazon_fresh_buy
    "AmazonFresh_Buy(\n  Items(),\n  ForDelivery(Sunday(), @(1000-1200,),),\n  Price(),\n)"
  end

  def amazon_fresh_recieve
    "AmazonFresh_Recieve(@(1000-1200,),)"
  end

  def car_camry_gasup
    "Car_Camry_GasUp"
  end

  def car_camry_run
    "Car_Camry_Run(StartedFine, RanFor(~20Minutes,),)"
  end

  def juice_make
    "Juice_Make"
  end

  def apartment_kitchen_all_clean
    "Apartment(\n  Kitchen_Clean(Fridge, Juicer, Sink, Counter,),\n)"
  end

  def apartment_trash_out
    "Apartment(Trash_Out,)"
  end

  def apartment_all
    "Apartment(\n  Kitchen_Clean(Fridge, Juicer, Sink, Counter,),\n  Vacuum,\n  Dresser_Clean,\n  Dugout_Clean,\n  Bathroom_Clean(Toilet, Sink,),\n  Trash_Out,\n)"
  end

  def aquarium_jar_water_change
    "Aquarium(\n  2.5Gallon(\n    Water_Change(Replaced1Gallon,),\n  ),\n)"
  end

  def aquarium_jar_and_tank_water_change
    "Aquarium(\n  2.5Gallon(\n    Water_Change(Replaced1Gallon,),\n  ),\n  10Gallon(\n    Water_Change(Replaced2.5Gallons,),\n  ),\n)"
  end

  def aquarium_jar_and_tank_water_change_with_filter
    "Aquarium(\n  2.5Gallon(\n    Water_Change(Replaced1Gallon,),\n    Filter(Sponges_Squeeze,),\n  ),\n  10Gallon(\n    Water_Change(Replaced2.5Gallons,),\n    Filter(Sponges_Squeeze, Plastic_Clean,),\n  ),\n)"
  end

  def groom_all
    "Groom(\n  Shower,\n  Shave(),\n  Hair(\n    Wash,\n    Sideburns_Fix,\n  ),\n  Nails_Clip(Fingers, Cuticles, Toes,),\n)"
  end

  def groom_shave_all
    "Groom(\n  Shave(All,)\n)"
  end

  def bank_all
    "Bank(\n  Budget,\n  Bills_Pay(\n    CreditCard_Chase(Price($,),),\n  ),\n)"
  end

  def lg_all
    "Lg(\n  Dos_Fix,\n  LastWeek,\n  NextWeek,\n)"
  end

  def lg_audio
    "Lg(\n  Audio,\n)"
  end

  def lg_do_next_month
    "Lg(\n  Do_NextMonth,\n)"
  end

  def laptop_folders_clean
    "Laptop_Folders_Clean"
  end

  def docs_scan
    "Docs_Scan()"
  end

  def backup_weekly
    "Backup(\n  snc-sncA,\n  extA-extB,\n)"
  end

  def mom_and_dad_call
    "Mom+Dad_Call(@(1300,),)"
  end

  def screens_clean
    "Screens_Clean(Laptops(Primary, Work,), Phone, Scanner,)"
  end

  def music
    "Music()"
  end

  def bill_utilities_pay
    "Bills_Pay(\n  Electric(Price($,),),\n  Internet(Price($,),),\n  Insurance_Automotive(Price($155,),),\n)"
  end

  def bill_rent_pay
    "Bills_Pay(\n  Rent(Price($950,),),\n)"
  end

  def first_of_month
    "Contacts_New(Case, Lenses,),\nRazors_New,\nToothBrush_Head_New,\nBackup(\n  Phone,\n  Partition_General-bkA,\n  bkA-bkB,\n  bnk-bnkA,\n  extA-extB,\n),\nBatteryExtender_Charge"
  end

  def hair_cut
    "Hair_Cut()"
  end

  def laundry
    "Laundry(Laundromat, Fold,)"
  end

  def jeopardy_backup
    "Jeopardy_PastWeek(Download, Convert, Backup(To(ExtA),),)"
  end

  def takeout
    "Takeout(\n  From(\n    Name(),\n    Address(),\n  ),\n  Method(Pickup,),\n  Items(),\n  @(),\n  Price($,),\n)"
  end

  def lecoursville_media_add
    "LeCoursvilleCom_Media_Add(\n  Videos(),\n)"
  end

  def excercise
    "Excercise(\n  Types(),\n  Repetitions(),\n)"
  end

  def media_consume
    "Media_Consume()"
  end

  def nobo
    "[NoBo]"
  end

end

