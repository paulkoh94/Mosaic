import passlib
from passlib.hash import sha512_crypt
import time;

f = open("common_hashes.txt","r")
hashes = []
hash_count = 0
for line in f:
    # discard newline
    hashes.append(line.rstrip())
    hash_count += 1
f.close()

start_time = time.time()
trials = 0

months = ['jan', 'feb', 'mar', 'apr', 'may','jun',\
            'jul', 'aug', 'sep', 'oct', 'nov', 'dec']

#Loop through year outside
for i in range(1830,1880):
    #Then loop through months 1-12
    for j in months:
        #then loop through days 1-31
        for k in range(1,32):
            #Loop through hash array and check here after formatting to mmddyyyy
            fullString = str(k) + '-' + j + '-' + str(i)

            for o in range(hash_count):
                trials += 1
                myhash = sha512_crypt.using(rounds=5000, salt= hashes[o][3:11]).encrypt(fullString)
                if myhash == hashes[o]:
                    print('Found it! the date is: ', fullString,' and the hash is : ', myhash, \
                            'hash # is :', o)


end_time = time.time()
seconds = start_time - end_time
print trials,"trials in ",seconds,"seconds",trials/seconds,"trials/second for months"
