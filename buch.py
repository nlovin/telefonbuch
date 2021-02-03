from gtts import gTTS
import os

fh = open("telefonbuch.txt", "r")
buch = fh.read().replace("\n", " ")

language = 'en'

output = gTTS(text=buch, lang=language, slow=True)

output.save("telefonbuchleser.mp3")
fh.close()
os.system("start telefonbuchleser.mp3")