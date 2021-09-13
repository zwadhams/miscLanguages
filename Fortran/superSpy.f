        PROGRAM superSpy
                IMPLICIT none
                integer :: number, first, second, concat
                character(len=99)::char_1, char_2, char_c

                write (*,*) 'Hat size?'
                read*, number

                !gets the third digit
                second = number/ 10 ** 2 - 10 * (number / 10 ** (2 + 1))
                !gets the second digit
                first = number / 10 ** 1 - 10 * (number / 10 ** (1 + 1))
                
                write(unit=char_1, fmt=*)first
                write(unit=char_2, fmt=*)second

                char_c = trim(adjustl(char_1))//trim(adjustl(char_2))

                read(unit=char_c,fmt=*)concat

                if (number > 100) then
                       write(*,*) 'Use ', char_c
                else
                       write(*,*) 'Size must be larger'
                end if

        END PROGRAM superSpy
             
