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

     total = df['Preço'].sum()


     def formatar_valor(valor, valorfixo = ''):
          for unidade in ['', 'mil']:
              if valor <1000:
                  return f'{valorfixo} {valor:.2f} {unidade}'
               valor /= 1000
          return f'{valorfixo} {valor:.2f} milhões'
           

        # Exibindo a receita formatada
     receita_formatada = formatar_valor(total)

     col1, col2, col3 = st.columns(3)

     with col1:
          #st.metric('Receita', df['Preço'].sum())
          st.metric('Receita', f"R$ {df['Preço'].sum():,.2f}")
     with col2:
          #st.metric('Quantidade de vendas (linha)', df.shape[0])
          st.metric('Quantidade de vendas', df.shape[0])
     with col3:
          #st.metric('Quantidade de variáveis (colunas)', df.shape[1])
          st.metric('Quantidade de variáveis', df.shape[1])
     
     st.snow() 

else:
     st.write("Clique no botão todos")


