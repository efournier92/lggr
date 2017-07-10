require './log-builder'

even_week = %{\
************************
#{ year }-#{ '%02d' % month }-#{ '%02d' % day }
************************
Mon - Gt, Ln, 
Tues - Gt, Ln, 
Wed - Gt, Ln, 
Thu - Gt, GS(), Ln, 
Fri - Gt, aLg, Lg, Bgt, PyCC, 
Sat - Gt, Lndr(Bed), 
Sun - Gt, Amz(), ClHm(), ClnKtch, ClnFrdg, Sv, Ns, AF(00), TM, FldLndr, Ln, Ap, 
}

odd_week = %{\
************************
#{ year }-#{ '%02d' % month }-#{ '%02d' % day }
************************
Mon - Gt, Ln, 
Tues - Gt, Ln, 
Wed - Gt, Ln, 
Thu - Gt, GS(), Ln, 
Fri - Gt, LgWks, aLg, Lg, Bgt, PyCC, 
Sat - Gt, 
Sun - Gt, Amz(), ClHm(), ClnKtch, ClnFrdg, Vac(), Sv, Ns, AF(00), TM, Ln, Ap, 
}

long_separator = "************************\n\n"


