import re

def weird_merge(l1,l2):
    lf = []
    tam1 = len(l1)
    tam2 = len(l2)
    i = 1
    while(i<tam1):
        print(tam1,i,l1[i])
        lf.append(l1[i])
        i += 2
    i = 0
    while(i<tam2):
        print(tam2,i)
        lf.append(l2[i])
        i += 2
    return lf

l1 = ['banana','morango','kiwi','ananas','laranja']
l2 = ['benfica','porto','sporting','braga']
#l1 = ['banana']
#l2 = ['benfica']
#print(weird_merge(l1,l2))

def chaves_espacos(d):
    d_new = {}
    for i in d:
        match = re.sub(r' ',r'_',i)
        d_new[match] = d[i]
    return d_new

d = {'chave um': 'valor um', 'chave dois': 'valor dois'}
#print(chaves_espacos(d))

from time import strptime

def date_to_tuple(string):
    match = re.findall(r'(\d{2})-(\w{3})-(\d{4})',string)
    dia = int(match[0][0])
    ano = int(match[0][2])
    mes = strptime(match[0][1],'%b').tm_mon
    tpl = (dia, mes, ano)
    print(tpl)

#date_to_tuple("05-SEP-1978")

N = 3
freqs = {}

#COMO FAÇO PARA NGRAMS DE PALAVRAS
def calc_bigrams(texto):
    print(re.findall(f"(\w+ )(?=(\w+))",texto))
    for seq1,seq2 in re.findall(f"(\w+ )(?=(\w+ ))",texto): 
        print(seq1,seq2)
        freqs[seq1+seq2] = freqs.get(seq1+seq2,0) +1
    return freqs

#print(calc_bigrams("word1 word2 word3 word4 word5"))

ent = "PM = [A-Z]\w* \n DE = (de|do|da|dos|das) \n NP = PM( DE PM| PM)* \n \n"
data = "DATA = \d{1,2} de MES( de ANO)? \n DATA = MES de ANO \n DATA = ESTACAO( de ANO)?"
mes = "MES = (?i:janeiro|fevereiro|março|abril|maio|junho|julho|dezembro)"
ano = "ANO = [12]\d{3}"
estacao = "ESTACAO = (?i:primavera|verão|outono|inverno)"

d1 = {
    'PM': '[A-Z]\w*',
    'DE': 'DE = (de|do|da|dos|das)'
    'NP': 'NP = PM( DE PM| PM)*'
    'DATA': 'DATA = \d{1,2} de MES( de ANO)?|MES de ANO|ESTACAO( de ANO)?'
    'MES': '(?i:janeiro|fevereiro|março|abril|maio|junho|julho|dezembro)'
    'ANO': '[12]\d{3}'
    'ESTACAO': '(?i:primavera|verão|outono|inverno)'
}