import streamlit as st
import random

# crie um algoritimo que descubra um número secreto!

# criar o número secreto
numero_secreto = random.randint(1,5)

# Título na aplicação
st.title("Adivinhe o número secreto")

# dar uma mensagem de boas vindas
st.write("Bem-vindo ao jodo Número secreto! Tente adivinhar o número entre 1 - 100.")

# receber o chute do usuário 
chute = st.number_input("Digite o número do chute: ", min_value=1, max_value=10, step=1)

# verificar o chute com o número secreto
if st.button("Verificar"):
    if chute < numero_secreto:
        st.write("Muito baixo! Tente Novamente")
    elif chute > numero_secreto:
        st.write("Muito alta: Tente Novamente.")
    else:
        st.write("Parabéns! você acertou o número")
        # Reiniciar o jogo (opcional)
        #numero_secreto = random.randint(1, 5)  # Cria um novo número secreto
        #st.experimental_rerun()  # Reinicia a aplicação


# Mostrar uma mensagem personalizada