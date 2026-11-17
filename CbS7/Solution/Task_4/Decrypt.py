key = 'qwertyuioplkjhgfdsazlfmhkb'
enc = '"4Rj\x12(\\_^(,{\x00c\r,OS]e$j\x18,Dl'

flag = ""

for i in range(len(enc)):
    letter = ord(enc[i])
    for j in range(i + 1):
        letter = letter ^ ord(key[j])

    flag = flag + chr(letter)  

print(flag)
