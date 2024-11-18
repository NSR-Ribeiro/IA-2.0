import streamlit as st
import requests 
import pandas as pd
import json


st.title("DASHBORD DE VENDAS:shopping_trolley:")
url = "https://labdados.com/produtos"
response = requests.get(url)
# json
# dicionário
# DataFrame

df = pd.DataFrame.from_dict(response.json())
if st.button("todos"):
     st.balloons()
     st.dataframe(df)

     

     
          #st.metric('Receita', df['Preço'].sum())
          st.metric('Receita', f"R$ {df['Preço'].sum():,.2f}")
          #st.metric('Receita', f"R$ {df['Preço'].replace('.')}")
          #valor_em_euro_texto = str(preco).replace(‘.’, ‘,’)
          #print(preco)
          #st.metric('Receita', round('preco', 2))
          #valor_arredondado = round('preco', 2)
          #print(valor_arredondado)
     
          #st.metric('Quantidade de vendas (linha)', df.shape[0])
          st.metric('Quantidade de vendas', df.shape[0])
     w
          #st.metric('Quantidade de variáveis (colunas)', df.shape[1])
          st.metric('Quantidade de variáveis', df.shape[1])
    
     st.snow()

else:
     st.write("Clique no botão todos")
