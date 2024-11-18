# importe o streamlit 
import streamlit as st

# entre com um número
numero = st.number_input("Digite um número", min_value=-10, max_value=10, step=1)
# verifique se o número é positivo, negativo ou nulo

if numero > 0:
    st.write("Número é Positivo")
elif numero < 0:
    st.write("Número é Negativo")
else:
    st.write("Número é nulo")

# Verifique se o número é par ou ímpar
if numero % 2 == 0:
    st.write("Número é Par")
else:
    st.write("Número é Ímpar")