#Uma função Python que, dada uma lista de números inteiros, retorna a soma do número de
#dígitos desses números:
#count_digits([1, 5, 14, 28, 1000]) = 10
import re
from unidecode import unidecode

def count_digits(digs):
    c = 0
    for i in digs:
        while(i>0):
            i = i // 10
            c += 1
    print(c)

#count_digits([1, 5, 14, 28, 1000])

#is_palindrome("Olé! Maracujá, caju, caramelo.") # True
#is_palindrome("Scripting em PLN") # False

def is_palindrome(str):
    r = re.sub(r'\W', r'',unidecode(str)).lower()
    m = len(r) // 2
    for i in range(0,m):
        if (not r[i] is r[len(r)-i-1]):
            return False
    return True    

#print(is_palindrome("Olé! Maracujá, caju, caramelo."))

def words_tag(file):
    f = open(file, "r")
    str = f.read()
    l = re.findall(r'([\w.]+)\/([\w.+]+)', str)
    dic = {}
    for i in l:
        #spl = i.split('/')
        #word = spl[0]
        #tag = spl[1]
        word = i[0]
        tag = i[1]
        if (word in dic):
            dic[word][0] += 1
            tags_word = dic[word][1]
            if(tag in tags_word):
                dic[word][1][tag] += 1
            else:
                tags = dic[word][1]
                tags[tag] = 1 
                dic[word][1] = tags 
        else:
            tags = {}
            tags[tag] = 1
            dic[word] = [1,tags]
    print(dic)

#words_tag("text.txt")

import re
import subprocess
import sys
from getopt import getopt
import fileinput
from collections import Counter

N = 3
freqs = {}

def calc_ngrams(texto):
    
    for seq1,seq2 in re.findall(f"(.)(?=(.{{{N-1}}}))",texto): 
        #print(seq1,seq2)
        freqs[seq1+seq2] = freqs.get(seq1+seq2,0) +1

    return freqs

def fix_word(word):
    lt = []
    for i in range(1,N+1):
        for fst, snd in re.findall(f"(.{{{N-i}}})%(.{{{i-1}}})",word):
            lt.append(fst+'(.)'+snd)

    count = {}
    for i in lt:
        for j in freqs:
            match = re.findall(i,j)
            if match != []:
                count[match[0]] = count.get(match[0],0) + 1
                
    sort = sorted(count.items(),key=lambda p:p[1],reverse=True)
    print(re.sub(r"%", sort[0][0], word))

def print_sorted(freqs):
    for p in sorted(freqs.items(),key=lambda p:p[1],reverse=True):
        print(f"{p[0]}\t{p[1]}")



def main():
    opts, resto = getopt(sys.argv[1:], "albdc")
    dop = dict(opts)
    
    texto = ""

    # Reads file
    for line in fileinput.input(resto):
        texto += line

    calc_ngrams(texto)
    fix_word("univer%idade")


#main()

#bagunion( {a:3,c:3,e:6},{ a:2,c:8,d:9}) = {a:5,c:11,e:6,d:9}
def bagunion(dic1,dic2):
    for i in dic2:
        dic1[i] = dic2.get(i,0) + dic1.get(i,0)
    return dic1
    
dic1 = {"a": 3,"c": 3,"e": 6}
dic2 = {"a": 2,"c": 8,"d": 9}
#print(bagunion(dic1,dic2))

def bagintersection(dic1,dic2):
    inter = {}
    for i in dic1:
        res = dic2.get(i,None)
        if (res is not None):
            if (dic1[i] >= res):
                inter[i] = res
            else:
                inter[i] = dic1[i]
    return inter

#print(bagintersection(dic1,dic2))

def titles_doc():
    titles = {}
    with open('titles.txt', 'r') as f:
        for line in f:
            line = line.strip()
            if (len(line) <= 5):
                print (line)
            else:
                l = titles.get(line,None)
                if (l is None):
                    print(line)
                else: 
                    titles[line] = titles.get(line,0) + 1
                    print(f"=={titles[line]}=={line}")
                titles[line] = titles.get(line,0) + 1

#titles_doc()

def splitPar(string, protected):
    regex = r'(?<!('+'|'.join(protected)+'))\.(?=[A-Z ])'
    return re.sub(regex, '.\n', string)

#print(splitPar("Para as tu a sr. doutora asdas.asdas AAAdsa . Ad asas .A\
#asdasda dr. Antonia. A sad.", ["sr","dr"]))

from datetime import date

def conselhos_da_avo(weather):
    day = date.today().day
    for list_w in weather:
        if f"{day}" in list_w["date"]:
            if list_w["temp_min"] < 15:
                print("Leva um casaco!")
            if list_w["uv"] > 7:
                print("Sai do sol que faz mal!")

weather = [{
    "date": "16 Dom",
    "prev_txt": "Céu nublado por nuvens altas",
    "temp_min": 13, 
    "temp_max": 28, 
    "uv": 8
    }, {
    "date": "3 Seg",
    "prev_txt": "Céu pouco nublado",
    "temp_min": 11, 
    "temp_max": 27, 
    "uv": 9,
    }, {
    "date": "4 Qua",
    "prev_txt": "Céu limpo",
    "temp_min": 9, 
    "temp_max": 31,
    }
]

#conselhos_da_avo(weather)

from bs4 import BeautifulSoup 
import requests
import re

def def_url(destrito, concelho):      
    url = 'https://www.imdb.com/chart/toptv/'
    content = requests.get(url).text

    top250Series = []

    soup = BeautifulSoup(content , 'lxml')

    seriesList = soup.select('.lister-list tr')
    print(seriesList)

    for series in seriesList:
        title = series.find('td', class_='titleColumn').find('a').get_text()
        year = series.find('td', class_='titleColumn').find('span').get_text()[1:5]
        rating = series.find('td', class_='imdbRating').find('strong').get_text()
        mainActors = series.find('td', class_='titleColumn').find('a')['title']
        obj = {
            'title': title,
            'year': year,
            'rating': rating,
            'mainActors': mainActors
        }
        top250Series.append(obj)

def_url("Braga","Barcelos")

