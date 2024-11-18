import streamlit as st
import requests
import pandas as pd
import plotly.express as px

def muda_valor(valor)
    if valor >= 1000000:
        return f" {valor/1000000:.2f} milhões"
    elif valor >= 1000:
        return f" {valor/1000:.2f} mil"
    else:
        return f" {valor:.2f}"


def formata_numero(valor)
    if valor >= 1000000:
        return f" {valor/1000000:.2f} milhões"

    elif valor >= 1000:

        return f" {valor/1000:.2f} mil"
    else:
        return f" {valor:.2f}"




st.title("Dashboard de vendas:shopping_trolley:")
url = "https://labdados.com/produtos"
response = requests.get(url)

# joson > convertido para dicionário > Convertido para databframe

df= pd.DataFrame.from_dict(response.json())
if st.button("todos"):
    st.balloons()
    # Valor total
    st.metric('Receita',df['Preço'].sum())
    # a qunatidade de vendas
    st.metric('Qtde Vendas',df.shape[0])
    # a quantidade de variáveis
    st.metric('Qtde de variáveis',df.shape[1])
st.dataframe(df)
st.snow()

