
****
      ***main_code
             CLOSE DATABASES
             SELE A 
             use MAINCODE
             go top
             clea
             PCODE=SPACE(7)
             @14,10 say 'Mainparty code:'
             activate window temp
             define popup s_list from 15,10 to 22,75 prompt fields mainNAME+'     '+LTRIM(name)   footer "Press ENTER key to Select"   && in window temp 
             @0,0 get pcode  popup s_list
             read valid lastkey() = 13 
             deactivate window temp
             pcode=a.mainNAME
             sele a
             use