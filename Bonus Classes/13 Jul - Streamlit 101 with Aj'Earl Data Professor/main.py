import streamlit as st
import pandas as pd
import numpy as np 

st.title('🦖 My First Streamlit App')

placeholder = st.empty()
status = st.radio("Select an option",
                  ["Success", "Error"])

if status == "Success":
    placeholder.success("Success !")
else:
    placeholder.error("Error")

st.header("Area Chart")
chart_data = pd.DataFrame(np.random.randn(20, 3), columns=["a", "b", "c"])
st.area_chart(chart_data)