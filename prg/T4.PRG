CLOSE DATABASES
CLEAR
CREATE CURSOR memotest (text C(3), memo M)
INSERT INTO memotest (text, memo) VALUES ('Fox', 'Fox')
INSERT INTO memotest (text, memo) VALUES ('Cat', 'Cat')
INSERT INTO memotest (text, memo) VALUES ('DOG', 'DOG')

LIST FIELDS memo, text FOR 'FOX' != UPPER(memo)
USE