import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from connect_data_warehouse import query_job_listings

df = query_job_listings()

st.set_page_config(page_title="Sales Job Vacancies Dashboard", layout="wide")

# Title
st.title("Sales Job Vacancies Dashboard")
st.markdown("---")


col1, col2 = st.columns(2)

with col1:
    # Vacancies by occupation group
    st.subheader("Vacancies by Occupation Group")
    group_vacancies = df.groupby('OCCUPATION_GROUP')['VACANCIES'].sum().sort_values(ascending=False).head(10)
    fig_group = px.bar(
        x=group_vacancies.index,
        y=group_vacancies.values,
        labels={'x': 'Occupation Group', 'y': 'Vacancies'}
    )
    fig_group.update_layout(xaxis_tickangle=-45, showlegend=False)
    st.plotly_chart(fig_group, use_container_width=True)

with col2:
    # Vacancies per Occupation
    st.subheader("Vacancies per Occupation")
    occupation_vacancies = df.groupby('OCCUPATION_LABEL')['VACANCIES'].sum().sort_values(ascending=False).head(20)

    fig_occupation = px.bar(
    x=occupation_vacancies.values,
    y=occupation_vacancies.index,
    orientation='h',
    labels={'x': 'Number of Vacancies', 'y': 'Occupation'},
    title='Top 20 Occupations by Vacancies'
    )
    fig_occupation.update_layout(
    height=600,
    showlegend=False,
    yaxis={'categoryorder':'total ascending'}
    )
    st.plotly_chart(fig_occupation, use_container_width=True)

st.markdown("---")

# Vacancies by city
st.subheader("Top Cities by Vacancies")
city_vacancies = df.groupby('WORKPLACE_CITY')['VACANCIES'].sum().sort_values(ascending=False).head(20)
fig_city = px.bar(
city_vacancies,
x=city_vacancies.index,
y=city_vacancies.values,
labels={'x': 'City', 'y': 'Vacancies'},
title='Top 20 Cities'
)
fig_city.update_layout(xaxis_tickangle=-45, showlegend=False)
st.plotly_chart(fig_city, use_container_width=True)

# Top employers
st.subheader("Top Employers")
employer_vacancies = df.groupby('EMPLOYER_NAME')['VACANCIES'].sum().sort_values(ascending=False).head(15)
fig_employer = px.bar(
    x=employer_vacancies.values,
    y=employer_vacancies.index,
    orientation='h',
    labels={'x': 'Total Vacancies', 'y': 'Employer'}
)
fig_employer.update_layout(
    height=500,
    showlegend=False,
    yaxis={'categoryorder':'total ascending'}
)
st.plotly_chart(fig_employer, use_container_width=True)

# Key metrics
col1, col2, col3, col4 = st.columns(4)
with col1:
    st.metric("Total Vacancies", df['VACANCIES'].sum())
with col2:
    st.metric("Total Employers", df['EMPLOYER_NAME'].nunique())
with col3:
    st.metric("Unique Occupations", df['OCCUPATION_LABEL'].nunique())
with col4:
    st.metric("Cities", df['WORKPLACE_CITY'].nunique())

st.markdown("---")

# Data table
st.subheader("Detailed Data")
st.dataframe(
    df[['OCCUPATION_LABEL', 'VACANCIES', 'EMPLOYER_NAME', 'WORKPLACE_CITY', 'OCCUPATION_GROUP']],
    use_container_width=True,
    height=400
)