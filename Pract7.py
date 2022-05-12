import nltk
# nltk.download('stopwords')
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize, sent_tokenize
stop_words = set(stopwords.words('english'))

import sys

userInputText = "Harsh will eat an apple later"

engToHindiConverterDictionary = {
    "a": "एक",
    "an": "एक",
    "boy": "लड़का",
    "end": "है ",
    "ram":"ram",
    "apple" : "से ब",
    "eat" : "खाये गा",
    "later" : "बाद म"
}

proper_nouns = {
    "ram" : "राम",
    "harsh" : "हष",
    "chandni" : "चां दनी"
}

token_sent = sent_tokenize(userInputText)
print(token_sent)
for sentence in token_sent:
    wordsList = nltk.word_tokenize(sentence)
    print(wordsList)
    wordsList = [w for w in wordsList if not w in stop_words]
    tagged = nltk.pos_tag(wordsList)
    print(tagged)

ansList = []

for wordNTag in tagged:
    word = wordNTag[0].lower()
    wordTag = wordNTag[1].lower()
    if word in proper_nouns:
        ansList.append(proper_nouns[word])
    else:
        ansList.append(engToHindiConverterDictionary[word])

print(ansList)