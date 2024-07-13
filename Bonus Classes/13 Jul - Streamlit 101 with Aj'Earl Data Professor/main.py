import streamlit as st
import pandas as pd
import numpy as np
import altair as alt

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

df = pd.read_csv("https://raw.githubusercontent.com/dataprofessor/data/master/penguins_cleaned.csv")
df

c = alt.Chart(df).mark_circle(size=60).encode(
    x='bill_length_mm',
    y='body_mass_g',
    color='species'
).interactive()

st.altair_chart(c, use_container_width=True)
