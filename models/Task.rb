class Task

  def git
    "Git"
  end

  def music
    "Music()"
  end

  def pch_spectrum
    "Pch(\n  Spectrum(),\n)"
  end

  def pch_spectrum_v1_hours
    "Pch(\n  Spectrum(\n    V1_Hours_Burn,\n  ),\n)"
  end

  def amazon_buy
    "Amazon_Buy()"
  end

  def amazon_fresh_buy
    "AmazonFresh_Buy()"
  end

  def amazon_fresh_recieve
    "AmazonFresh_Recieve(<0700,)"
  end

  def car_camry_gasup
    "Car_Camry_GasUp"
  end

  def apartment_kitchen_clean
    "Apt(\n  Kitchen_Clean(Fridge, Sink, Counter,),\n)"
  end

  def apartment_trash_out
    "Apt(Trash_Out,)"
  end

  def apartment_all
    "Apt(\n  Kitchen_Clean(Sink,),\n  Vacuum,\n  Dresser_Clean,\n  Bathroom_Clean(Sink, Toilet),\n)"
  end

  def groom_all
    "Groom(\n  Shave(),\n  Pluck,\n  Nails_Clip(Fingers, Toes,),\n)"
  end

  def groom_shave_all
    "Groom(\n  Shave(All,)\n,)"
  end

  def groom_hair_wash
    "Groom(\n  Hair_Wash,\n)"
  end

  def bank_all
    "Bank(\n  Budget,\n  Bills_Pay(\n    CreditCard_Chase,\n  ),\n)"
  end

  def lg_all
    "Lg(\n  NextWeek,\n  aLog,\n  Entries_Fin,\n  LastWeek,\n  Missed_Fix,\n)"
  end

  def laptop_folders_clean
    "Laptop_Folders_Clean"
  end

  def backup_weekly
    "Backup(\n  bnk-bnkA,\n  extA-extB,\n)"
  end

  def call_mom_and_dad
    "Mom+Dad_Call(1300,)"
  end

  def screens_clean
    "Screens_Clean(Pch_Laptop, Laptop, Phone,)"
  end

  def groom_hair_sideburns_fix
    "Groom(Hair_Sideburns_Fix,)"
  end

  def music
    "Music()"
  end

  def bills_pay_electric_internet
    "Bills_Pay(\n  Electric,\n  Internet,\n)"
  end

  def bill_rent_pay
    "Bill_Rent_Pay,\nLog_Do_NextMonth"
  end

  def first_of_month
    "Contacts_New(Case, Lenses,),\nRazors_New,\nToothBrush_Head_New,\nBk(\n  Phone,\n  sda3-bkA,\n  bkA-bkB,\n  bnk-bnkA,\n  extA-extB,\n),\nBatteryExtender_Charge"
  end

  def hair_cut
    "Hair_Cut()"
  end

  def laundry
    "Laundry(Laundromat, Fold,)"
  end

  def rx
    "Rx(Order, Rcv, Pills_Cut,)"
  end

  def nobo
    "[NoBo]"
  end

end

