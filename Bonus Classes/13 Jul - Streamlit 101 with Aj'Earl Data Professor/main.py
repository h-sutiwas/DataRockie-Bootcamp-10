import streamlit as st
import pandas as pd
import numpy as np
import altair as alt
from vega_datasets import data

source = data.cars()

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

c = alt.Chart(source).mark_circle(size=60).encode(
    x='Horsepower',
    y='Miles_per_Gallon',
    color='Origin',
    tooltip=['Name', 'Origin', 'Horsepower', 'Miles_per_Gallon']
).interactive()
