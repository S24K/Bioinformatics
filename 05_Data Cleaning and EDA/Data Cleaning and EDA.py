import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime

# Load the dataset
def load_data(file_path):
    try:
        df = pd.read_csv(file_path)
        return df
    except Exception as e:
        print(f"Error loading data: {e}")
        return None

# Data cleaning
def clean_data(df):
    # Standardize date format
    def parse_date(date):
        try:
            return pd.to_datetime(date, errors='coerce', format='%m/%d/%Y')
        except:
            return pd.NaT

    df['Date'] = df['Date'].apply(parse_date)

    # Clean 'TotalReads' column
    if 'TotalReads' in df.columns:
        df['TotalReads'] = df['TotalReads'].replace(',', '', regex=True)  # Remove commas
        df['TotalReads'] = pd.to_numeric(df['TotalReads'], errors='coerce')  # Convert to numeric
        df['TotalReads'] = df['TotalReads'].fillna(df['TotalReads'].median())

    # Clean 'PercDuplicates' column
    if 'PercDuplicates' in df.columns:
        df['PercDuplicates'] = df['PercDuplicates'].astype(str).str.replace('%', '')  # Remove percent signs
        df['PercDuplicates'] = pd.to_numeric(df['PercDuplicates'], errors='coerce')  # Coerce invalid to NaN
        df['PercDuplicates'] = df['PercDuplicates'].fillna(df['PercDuplicates'].median())  # Fill NaN with median

    # Handle missing values in other columns
    if 'PercMappedReads' in df.columns:
        df['PercMappedReads'] = pd.to_numeric(df['PercMappedReads'], errors='coerce').fillna(df['PercMappedReads'].median())
    
    # Remove rows where critical columns are missing
    df = df.dropna(subset=['Assay'])  # Updated to match your column name

    # Flag missing dates
    df['MissingDate'] = df['Date'].isna()

    return df

# Exploratory Data Analysis (EDA)
def descriptive_stats(df):
    print("Descriptive Statistics:")
    print(df.describe())

def visualize_distributions(df):
    # Boxplot for TotalReads by Assay
    plt.figure(figsize=(10, 6))
    sns.boxplot(data=df, x='Assay', y='TotalReads')
    plt.title('Total Reads Distribution by Assay')
    plt.xticks(rotation=45)
    plt.show()

    # Time-series plot for TotalReads
    df_sorted = df.dropna(subset=['Date']).sort_values(by='Date')
    plt.figure(figsize=(10, 6))
    sns.lineplot(data=df_sorted, x='Date', y='TotalReads', hue='Assay')
    plt.title('Total Reads Over Time')
    plt.xticks(rotation=45)
    plt.show()

    # Bar chart for pass/fail rate by Assay
    plt.figure(figsize=(10, 6))
    sns.countplot(data=df, x='Assay', hue='Results')
    plt.title('Pass/Fail Rates by Assay')
    plt.xticks(rotation=45)
    plt.show()

# Identify Outliers
def detect_outliers(df, column):
    Q1 = df[column].quantile(0.25)
    Q3 = df[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR

    outliers = df[(df[column] < lower_bound) | (df[column] > upper_bound)]
    print(f"Outliers in {column}:")
    print(outliers)
    return outliers

# Main function
def main():
    file_path = r"C:\Users\Souren\Desktop\VS CODE\Python\Souren_test_data.csv"

    # Load data
    df = load_data(file_path)
    if df is None:
        return

    # Clean data
    print("Before cleaning:")
    print(df.head())

    df = clean_data(df)

    print("After cleaning:")
    print(df.head())

    # Save cleaned data
    df.to_csv('cleaned_qc_data.csv', index=False)
    print("Cleaned data saved to 'cleaned_qc_data.csv'.")

    # Perform EDA
    descriptive_stats(df)
    visualize_distributions(df)

    # Detect outliers
    detect_outliers(df, 'TotalReads')
    detect_outliers(df, 'PercDuplicates')

if __name__ == '__main__':
    main()
