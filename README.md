# Reverb.com Challenge

I've included a few different sets of data under examples/. Please use the -f flag to pick which set of data you'd like to read from. 
Additionally, you can see how I parse the data if you add the -v switch.


### Running Snipper
```
✗ ruby snipper.rb -f examples/mixed-test.txt
Last Name | First Name | Gender | Date of Birth | Favorite Color
--------------------------------------------------
Stevens | Sufjan | Male |  02-07-1944 | Orange
Dylan | Bob | Male |  10-10-1960 | Red
Parton | Dolly | Female | 04-07-1935 | Black
Posford | Simon | Male | 08-13-1966 | Orange
Gibb | Barry | Male | 03-23-1973 | Purple
Morissette | Alanis | Female |  10-07-1977 | Yellow
Cyrus | Miley | Female |  09-07-1992 | Red
Coltrane | John | Male |  12-07-1952 | Gray
Dion | Celine | Female |  09-15-1931 | White
Buffet | Jimmy | Male |  03-23-1947 | Blue
```

### Running Snipper verbosely
```
✗ ruby snipper.rb -f examples/mixed-test.txt -v
DEBUG: Matched on comma
DEBUG: Matched on pipe
DEBUG: Matched on space
DEBUG: Matched on space
DEBUG: Matched on space
DEBUG: Matched on comma
DEBUG: Matched on pipe
DEBUG: Matched on comma
DEBUG: Matched on pipe
DEBUG: Matched on comma
Last Name | First Name | Gender | Date of Birth | Favorite Color
--------------------------------------------------
Stevens | Sufjan | Male |  02-07-1944 | Orange
Dylan | Bob | Male |  10-10-1960 | Red
Parton | Dolly | Female | 04-07-1935 | Black
Posford | Simon | Male | 08-13-1966 | Orange
Gibb | Barry | Male | 03-23-1973 | Purple
Morissette | Alanis | Female |  10-07-1977 | Yellow
Cyrus | Miley | Female |  09-07-1992 | Red
Coltrane | John | Male |  12-07-1952 | Gray
Dion | Celine | Female |  09-15-1931 | White
Buffet | Jimmy | Male |  03-23-1947 | Blue
```
