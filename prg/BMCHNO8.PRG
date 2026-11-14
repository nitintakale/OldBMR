    
LN=3
@LN,1 SAY '                            CHECK LIST NO. FFS- 8'
LN=LN+1
@LN,1 SAY'                 CHECKLIST FOR INTEGRITY OF PRODUCT FILTER & PURGING OF SOLUTION.'
LN=LN+1
@LN,1 SAY '    PREVIOUS PRODUCT :                    PRODUCT BATCH NO: '
LN=LN+1
@LN,1 SAY '    DATE :                                TOTAL  TIME :        '
LN=LN+2
@LN,1 SAY '    PRODUCT NAME :                        BATCH NO: '
@LN,19 SAY TRIM(PNAME)
@LN,50 SAY VBNO
                  
LN=LN+2

TEXT


                                                   PAGE 1 OF 3

    A) INITIAL INTEGRITY OF  PRODUCT FILTER.
    --------------------------------------------------------------------
    SR.NO.|                                              |  Checked By |
    ------|----------------------------------------------|-------------|
     1.   | Ensure completion of membrane filtration     |             |
    ------|----------------------------------------------|-------------|
     2.   | Check the post bubble point test of MFH      |Okay/Not Okay|
          | is okay                                      |             | 
    ------|----------------------------------------------|-------------|
     3.   | Fit the product filter into the housing      |Fitted       |
          |                                              |by :  _______|
    ------|----------------------------------------------|-------------|
     4.   | Switch on the palltronics instrument & wait  |             |
          | till instrument is ready for use             |             |
    ------|----------------------------------------------|-------------|
     5.   | Apply 1.0 kg/cm2 pressure to the product     |Tank No._____|
          | holding tank                                 |Pressure:____|
    ------|----------------------------------------------|-------------|
     6.   | Ensure that value No.V0, V8, V10, & V11 of   |             |
          | product line are closed                      |             |
    ------|----------------------------------------------|-------------|
     7.   | Open product line valve of a holding tank    |             |
          | which is going into the filling area         |             |
    ------|----------------------------------------------|-------------|
     8.   |Purge the solution by opening V0 & V8 & collect             |
          | the purged solution in to sterilized pressure|             |
          | vessel. Ensure complete removal of air from  |             | 
          | product line.                                |             |
    ------|----------------------------------------------|-------------|
     9.   | Close V0 V8, and open valve V10.             |             |
    ------|----------------------------------------------|-------------|
    10.   | Activate V13 (pneumatic valve) to remove the |             |
          | air from the product filter. Purge the       |             |
          | solution through V13 & collect in the above  |             | 
          | pressure vessel.                             |             |
    ------|----------------------------------------------|-------------|
    11.   | Ensure that Hepa filter module is ON.        |             |
    ------|----------------------------------------------|-------------|
    12.   | Remove the steam cup of the fill head        |Removed      |
          |                                              |by :________ |
    ------|----------------------------------------------|-------------|
    13.   | Ensure that compressed air SMC tube is not   |             |
          | connected to the fill head.                  |             |
    ------|----------------------------------------------|-------------|
    14 .  | Put sterilized purging tray under the fill   |             |
          | head & connect the purging drain tube to the |             | 
          | vessel.                                      |             | 
    ------|----------------------------------------------|-------------|
     15.  | Open V11 slowly, solution will start coming  |             |
          | through the nozzles. Control opening of V11, |             |
          | so as to avoid overflow of purging tray.     |             | 
    ------|----------------------------------------------|-------------|
     16.  | Pass sufficient solution through the product |Closed       |
          | filter. Close V11, & V10.                    |by : _______ |
    ------|----------------------------------------------|-------------|
     17   | Give compressed air supply to the inlet of   |             |
          | palltronics integrity tester.                |             |
    ------|----------------------------------------------|-------------|
ENDTEXT
LN=3
TEXT
                                CHECK LIST NO. FFS- 8     

          CHECKLIST FOR INTEGRITY OF PRODUCT FILTER & PURGING OF SOLUTION.
                                                       PAGE 2 OF 3
    --------------------------------------------------------------------
    SR.NO.|                                              |  Checked By |
    ------|----------------------------------------------|-------------|
     18   | Disconnect V13 from the cartridge filter     |             |
          | housing & connect outlet of palltronics      |             |
          | to it.                                       |             | 
    ------|----------------------------------------------|-------------|
     19   | Feed integrity test data into the palltronics|Data File    |
          |                                              |No:_________ |
          |                                              |Batch        | 
          |                                              |No:_________ |
          |                                              |Filter Code  |
          |                                              |No:_________ |
          |                                              |Wetting      |
          |                                              |Liquid ______|
    ------|----------------------------------------------|-------------|
     20   | Instrument will start, applying the pressure,|Pressure on  |
          | which will be observed on the pressure guage |Pressure     |
          | before product filter.                       |Guage :______| 
    ------|----------------------------------------------|-------------|
     21   | Open valve No. V11, solution will drip down  |             |
          | through the nozzle.                          |             |
    ------|----------------------------------------------|-------------|
     22.  | Integrity test started                       |Time:        |
          | Integrity test completed                     |From:______  |
          |                                              |To  :______  | 
    ------|----------------------------------------------|-------------|
     23.  | Observe pressure on the pressure gauge.      |Before       |
          |                                              |Filter :_____|
          |                                              |After        | 
          |                                              |Filter :_____|
    ------|----------------------------------------------|-------------|
     24.  | After completion of test disconnect the      |             |
          | palltronics.                                 |             |
    ------|----------------------------------------------|-------------|
     25.  | Connect pneumatic valve V13 to the filter    |Connected    |
          | housing                                      |by :_________|
    ------|----------------------------------------------|-------------|
    B)     PURGING OF SOLUTION                                   
    --------------------------------------------------------------------
    SR.NO.|                                              |  Checked By |
    ------|----------------------------------------------|-------------|
     01.  | Purge the solution through V13 & collect in  |             |
          | pressure vessel, to remove air from the      |             |
          | filter.                                      |             | 
    ------|----------------------------------------------|-------------|
     2.   | Connect compressed air pressure tube to the  |             |
          | fill head & give air supply to fill head.    |             |
    ------|----------------------------------------------|-------------|
     3.   | Purge the solution through fill head by      |             |
          | using fill time switch on the panel board.   |             |
    ------|----------------------------------------------|-------------|
     4.   | Remove complete air from the product line    |             |
          | & from FOUR silicone tubes connected to the  |             |
          | the fill head, by pressing silicone tubes    |             | 
          | one by one.                                  |             |
    ------|----------------------------------------------|-------------|
     5.   | Ensure complete removal of air.              |             |
    ------|----------------------------------------------|-------------|
     6.   | Withdraw bulk sterility sample of product    |             |
          | through purging tray drain tube.             |             |
    ------|----------------------------------------------|-------------|
     7.   | Remove the purging tray & transfer pressure  |             |
          | vessel to manufacturing area for refiltration|             |
    ------|----------------------------------------------|-------------|
    Note : During purging, Hydraulic switch should be put ON only when 
           required.

ENDTEXT
LN=3
TEXT
                                CHECK LIST NO. FFS- 8

          CHECKLIST FOR PURGING OF SOLUTION & INTEGRITY OF PRODUCT FILTER 

                                                  PAGE 3  OF 3

    C)   POST INTEGRITY TESTING OF PRODUCT FILTER 

                                                    DATE :
    --------------------------------------------------------------------
    SR.NO.|                                              |  Checked By |
    --------------------------------------------------------------------
      1.  | Ensure completion of filling .               |             |
    ------|----------------------------------------------|-------------|
      2.  | Close valve V10 and remove compressed air    |             |
          | SMC tube from the fill head.                 |             |
    ------|----------------------------------------------|-------------|
      3.  | Switch on the palltronics intrument and wait |             |
          | till instrument  is ready for use.           |             |
    ------|----------------------------------------------|-------------|
      4.  | Give compressed air supply to the inlet of   |             |
          | palltronics integrity tester.                |             |
    --------------------------------------------------------------------
      5.  | Disconnect V13 from the cartridge filter     |             |
          | housing & connect outlet of palltronics      |             |
          | to it.                                       |             | 
    ------|----------------------------------------------|-------------|
      6.  | Feed integrity test data into the palltronics|Data File    |
          |                                              |No:_________ |
          |                                              |Batch        | 
          |                                              |No:_________ |
          |                                              |Filter       |
          |                                              |No:_________ |
          |                                              |Wetting      |
          |                                              |Liquid ______|
    ------|----------------------------------------------|-------------|
      7.  | Instrument will start, applying the pressure,|Pressure on  |
          | which will be observed on the pressure guage |Pressure     |
          | before product filter.                       |Guage :______| 
    ------|----------------------------------------------|-------------|
      8.  | Solution will drip down through the nozzle.  |             |
    ------|----------------------------------------------|-------------|
      9.  | Integrity test started                       |Time:        |
          | Integrity test completed                     |From:______  |
          |                                              |To  :______  | 
    ------|----------------------------------------------|-------------|
      10. | After completion of test, check whether      | Okay / Not  |
          | integrity is OK or  NOT.                     |        Okay |
    ------|----------------------------------------------|-------------|
      11. | Disconnect the palltronics intruments.       |             |
    ------|----------------------------------------------|-------------|
      12. | Connect pneumatic valve V 13 to the filter   |             |
          | housing.                                     |             |
    ------|----------------------------------------------|-------------|

ENDTEXT
