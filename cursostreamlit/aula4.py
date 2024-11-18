import streamlit as st

col1, col2, col3 = st.columns(3)

with col1:
    st.header("Gato")
    st.image("https://static.streamlit.io/examples/cat.jpg")

with col2:
    st.header("Cachorro")
    st.image("https://static.streamlit.io/examples/cachorro.jpg")

with col1:
    st.header("Coruja")
    st.image("https://static.streamlit.io/examples/coruja.jpg")