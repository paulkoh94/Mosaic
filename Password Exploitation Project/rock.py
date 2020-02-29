import passlib
from passlib.hash import sha512_crypt
import time;

f = open("rockyou_top100.txt","r")
dictionary_word = []
dict_count = 0
for line in f:
    # discard newline
    if len(line) < 7:
        continue
    dictionary_word.append(line.rstrip())
    dict_count += 1
f.close()

print("finished loading txt")

f = open("common_hashes.txt","r")
hashes = []
hash_count = 0
for line in f:
    # discard newline
    hashes.append(line.rstrip())
    hash_count += 1
f.close()

print("finished loading hashes")

recovered = 0
trials = 0
start_time = time.time()

recovered = 0
trials = 0
start_time = time.time()

for i in range(dict_count):
    found_index = []
    found_count = 0
    for j in range(hash_count):
        myhash = sha512_crypt.using(rounds=5000, salt= hashes[j][3:11]).encrypt(dictionary_word[i])
        trials += 1
        if myhash == hashes[j]:
            localtime = time.asctime( time.localtime(time.time()) )
            recovered += 1
            print "  ",recovered,localtime,dictionary_word[i],myhash,j
            found_index.append(j)
            found_count += 1
            continue

    if found_count > 0:
        for i in range(found_count):
            del hashes[found_index[found_count-i-1]]
        hash_count -= found_count
end_time = time.time()
seconds = end_time - start_time

print trials,"trials in ",seconds,"seconds",trials/seconds,"trials/second rock.txt"
