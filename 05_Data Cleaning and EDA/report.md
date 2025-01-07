# Quality Control Data Analysis - Bioinformatics

## Project Overview
This project involves analyzing bioinformatics quality control (QC) data from various experiments. The goal is to clean the dataset, perform exploratory data analysis (EDA), and identify outliers to improve the quality of the data used in downstream analyses.

The data originates from QC assays performed on different experiments, with key metrics like total reads, duplicate rates, and mapping percentages being analyzed.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Dataset Description](#dataset-description)
- [Code Explanation](#code-explanation)
- [Generated Results](#generated-results)
- [How to Run the Code](#how-to-run-the-code)
- [Dependencies](#dependencies)
- [License](#license)

---

## Dataset Description
The dataset is a CSV file (`Souren_test_data.csv`) containing QC data with columns such as:
- **Date** – Experiment date.
- **Experiment** – Trial or experiment name.
- **Assay** – Type of assay conducted (e.g., CNR, BulkATAC, HiC).
- **TotalReads** – Total number of reads from sequencing.
- **PercMappedReads** – Percentage of mapped reads.
- **PercDuplicates** – Percentage of duplicate reads.
- **Results** – Pass/Fail results for each experiment.

### Sample Data (Before Cleaning):
| Date       | Experiment | Assay  | TotalReads | PercMappedReads | PercDuplicates |
|------------|------------|--------|------------|-----------------|----------------|
| 3/2/2022   | Trial_01   | CNR    | NaN        | NaN             | NaN            |
| 4/28/2022  | Trial_05   | BulkATAC | 223,615,776 | 99.4           | 23.93          |
| 5/17/2022  | Trial_07   | BulkATAC | 129,367,622 | 99.3           | 21.24          |

---

## Code Explanation

### 1. **Loading Data**
The `load_data` function reads the CSV file into a pandas DataFrame.
```python
file_path = r"C:\Users\Souren\Desktop\VS CODE\Python\Souren_test_data.csv"
df = pd.read_csv(file_path)
```

### 2. **Data Cleaning**
The `clean_data` function standardizes the dataset by:
- **Parsing Dates:** Converts date strings to datetime objects.
- **Handling Missing Values:**
  - `TotalReads` and `PercDuplicates` are cleaned by removing commas and percent signs.
  - Non-numeric values are coerced to `NaN` and filled with the median.
- **Removing Rows with Missing Assays:** Rows missing the `Assay` value are dropped.

```python
if 'TotalReads' in df.columns:
    df['TotalReads'] = df['TotalReads'].replace(',', '', regex=True)
    df['TotalReads'] = pd.to_numeric(df['TotalReads'], errors='coerce').fillna(df['TotalReads'].median())
```

### 3. **Exploratory Data Analysis (EDA)**
- **Descriptive Statistics:** Summary of key metrics.
- **Visualizations:**
  - **Boxplot** for `TotalReads` by assay type.
  - **Time-series plot** showing trends over time.
  - **Bar chart** for pass/fail rates by assay type.

```python
sns.boxplot(data=df, x='Assay', y='TotalReads')
sns.lineplot(data=df, x='Date', y='TotalReads', hue='Assay')
sns.countplot(data=df, x='Assay', hue='Results')
```

### 4. **Outlier Detection**
The `detect_outliers` function uses the IQR (Interquartile Range) method to detect and list outliers.
```python
outliers = df[(df[column] < lower_bound) | (df[column] > upper_bound)]
```

---

## Generated Results
- **Cleaned CSV File:** The cleaned dataset is saved as `cleaned_qc_data.csv`.
- **Visualizations:**
  - Distribution of total reads across assays.
  - Time trends in sequencing data.
  - Pass/fail rates across experiments.
- **Outlier Report:** List of outliers detected in `TotalReads` and `PercDuplicates`.

---

## How to Run the Code
1. Clone the repository.
2. Ensure the dataset (`Souren_test_data.csv`) is placed in the appropriate directory.
3. Run the script:
```bash
python Learning.py
```
4. Review the generated `cleaned_qc_data.csv` and visualizations.

---

## Dependencies
Ensure the following Python packages are installed:
```bash
pip install pandas matplotlib seaborn numpy
```

---

## License
This project is licensed under the MIT License.

