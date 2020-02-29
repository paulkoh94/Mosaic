import passlib
from passlib.hash import sha512_crypt

stroke = raw_input('Enter a keyboard stroke: ')


hash1 = sha512_crypt.using(rounds=5000, salt= 'SrZNVwbd').encrypt(stroke)
hash2 = sha512_crypt.using(rounds=5000, salt= '8t2SRHOv').encrypt(stroke)

if hash1 == '$6$SrZNVwbd$nSEY7lYtRTqm7FZ58pV2AwWrxFPDJNJV13RqTs4J3KgiOwgW/KhztEX/W3QZJFVpPPFhYZqi2AEBqJNRuxSBH1':
    print 'FOUND: ' , stroke, 'hash: ', '$6$SrZNVwbd$nSEY7lYtRTqm7FZ58pV2AwWrxFPDJNJV13RqTs4J3KgiOwgW/KhztEX/W3QZJFVpPPFhYZqi2AEBqJNRuxSBH1'
elif hash1 == '$6$8t2SRHOv$ACSiNW9I5FpjNJgMOKX31IKoAqzIMkLl0fVowQQFaACbwuBYCpZNLRPyiS32RhYmlmzJNhV.zpIEcteDRj1uH.':
    print 'FOUND: ' , stroke, 'hash: ', '$6$8t2SRHOv$ACSiNW9I5FpjNJgMOKX31IKoAqzIMkLl0fVowQQFaACbwuBYCpZNLRPyiS32RhYmlmzJNhV.zpIEcteDRj1uH.'
else:
    print('Found nothing')
