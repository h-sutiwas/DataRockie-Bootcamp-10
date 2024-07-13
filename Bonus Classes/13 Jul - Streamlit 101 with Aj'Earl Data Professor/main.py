import streamlit as st

st.title('My First Streamlit App')

placeholder = st.empty()
status = 1

if status == 1:
    placeholder.success("Success")
else:
    placeholder.error("Error")