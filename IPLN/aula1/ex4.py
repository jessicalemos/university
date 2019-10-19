#!/usr/bin/env python3

import re

def limpa(text):
    text = text.lower()
    text = re.sub(r"[áâãà]", "a", text)
    text = re.sub(r"([a-z])([,?])", r"\1 \2 ", text)
    text = re.sub(r"  +", r" ", text)
    return text

text = "Olá, tudo bem?"
print(limpa(text))

Funcao que recebe o nome do ficheiro e imprimir as 10 palavras mais frequentes e o numero de occorencias
