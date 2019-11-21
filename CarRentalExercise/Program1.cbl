       program-id. Program1 as "CarRentalExercise.Program1".

       data division.
       working-storage section.
       01 customer.
           05  last-name       picture x(20).
           05  first-initial   picture x.
           05  type-of-car     picture 9.
               88  toyota value 1.
               88  chevroles value 2.
               88  cadilac value 3.
           05  miles-driven    picture 9(5).
           05  days-rented     picture 999.

       01  amount-owed     picture $$$$$$$9.99.
       01  total-price-miles   picture 99999999V99.
       01  total-price-days    picture 9(8).
       01  type-of-car-name    picture x(9).
       01  are-there-more-records  picture x value "Y".

       screen section.
       01  screen-1.
           05  blank screen
               foreground-color 1
               background-color 7
               highlight.
           05  line 1 column 1 value "Last name: ".
           05  column 17 picture x(20) to last-name.
           05  line 2 column 1 value "First initial: ".
           05  column 17 picture x to first-initial.
           05  line 3 column 1 value "Type of car: ".
           05  column 17 picture x to type-of-car.
           05  line 4 column 1 value "Miles driven: ".
           05  column 17 picture ZZZZ9 to miles-driven.
           05  line 5 column 1 value "Days rented: ".
           05  column 17 picture ZZ9 to days-rented.

       01  screen-2.
           05  blank screen
               foreground-color 2
               background-color 7
               highlight.
    
                
       procedure division.
           
       100-main-module.

           perform until are-there-more-records = "N"
               display screen-1
               accept screen-1
               perform 200-calculation-routine
               perform 300-display-output
           end-perform

           stop run.
       200-calculation-routine.

           if type-of-car is equal to 1
               if miles-driven <= 100 
                   move 0 to total-price-miles
               else
                   subtract 100 from miles-driven
                   multiply miles-driven by 0.18 giving total-price-miles
               end-if
               multiply days-rented by 26 giving total-price-days
               move "Toyota" to type-of-car-name
               add total-price-days total-price-miles giving amount-owed
           else if type-of-car is equal to 2
               if miles-driven <= 100 
                   move 0 to total-price-miles
               else    
                   subtract 100 from miles-driven
                   multiply miles-driven by 0.22 giving total-price-miles
               end-if
               multiply days-rented by 32 giving total-price-days
               move "Chevroles" to type-of-car-name
               add total-price-days total-price-miles giving amount-owed
           else if type-of-car is equal to 3
               if miles-driven <= 100 
                   move 0 to total-price-miles
               else    
                   subtract 100 from miles-driven
                   multiply miles-driven by 0.28 giving total-price-miles
               end-if
               multiply days-rented by 43 giving total-price-days
               move "Cadillac" to type-of-car-name
               add total-price-days total-price-miles giving amount-owed
           end-if.

           

       300-display-output.
           add 100 to miles-driven
           display screen-2
           display "Last name: ", last-name,
           display "First Initial: ", first-initial
           display "Type of Car: ", type-of-car-name
           display "Miles Driven: ", miles-driven
           display "Days Rented: ", days-rented
           display "-----------------------"
           display "Total Owed: ", amount-owed
           display "-----------------------"
           display "Continue? Y/N"
           accept are-there-more-records.
           

       end program Program1.
