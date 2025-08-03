# 📊 Startup Market Explorer
A data-driven tool to compare countries by their startup attractiveness indicators

## 🌍 Project Overview
Startup Market Explorer is a data analysis project that combines key economic and innovation indicators to help compare the attractiveness of different countries for startups.

Using World Bank data and PostgreSQL, we:
  - Extract 📥 raw CSV datasets from World Bank
  - Transform 🔄 them into clean, analysis-ready tables
  - Load 💾 them into a PostgreSQL database
  - Combine them into a single unified dataset for insights
  - Analyze and visualize trends to support decision-making

This project is an excellent base for market research, startup ecosystem analysis, and data-driven decision-making.

## 📂 Project Structure
```
startup-market-explorer/
│
├── data/
│   ├── raw/           # Original CSVs from World Bank
│   ├── clean/         # Cleaned datasets (long format)
│
├── notebooks/
│   ├── 01_exploration.ipynb      # Initial exploration (single dataset)
│   ├── 02_pipeline_run.ipynb     # Automated ETL pipeline run
│
├── src/
│   ├── db_connect.py             # Database connection setup
│   ├── data_processing.py        # Data cleaning & transformation functions
│
├── README.md                     # Project documentation
└── requirements.txt              # Python dependencies
```

## 📊 Data Sources
The project uses World Bank Open Data:
   - 💰 GDP (Gross Capital Formation) – % of GDP
   - 📈 Inflation – Consumer prices (annual %)
   - 🏢 New Business Density – Number of newly registered companies per 1,000 people
   - 🔬 Research & Development (R&D) – % of GDP

## 🛠️ Tech Stack
  - Python 3 (pandas, matplotlib, sqlalchemy)
  - PostgreSQL (data storage & SQL views)
  - Jupyter Notebooks (exploration & pipeline)
  - pgAdmin (DB management)

## 🚀 How to Run
1. Clone the repository:
   git clone https://github.com/your-username/startup-market-explorer.git
   cd startup-market-explorer

2. Create a virtual environment
   python -m venv .venv
   source .venv/bin/activate     # On Linux/Mac
   .venv\Scripts\activate        # On Windows

4. Install dependencies
   pip install -r requirements.txt
   
6. Setup PostgreSQL
   - Install PostgreSQL & pgAdmin
   - Create a database (e.g., startup_db)
   - Configure connection in src/db_connect.py

8. Load and transform data
   Run the pipeline notebook:
   jupyter notebook notebooks/02_pipeline_run.ipynb
   This will:
    - Load raw CSVs from data/raw/
    - Clean and reshape them into long format
    - Save processed files to data/clean/
    - Push them into PostgreSQL

10. Explore the unified view
    SELECT * FROM startup_metrics_complete;
    
## 📈 Features
  - ETL Pipeline: Automated extract → transform → load process
  - SQL Views: Merged datasets in one place (startup_metrics_complete)
  - Python Analysis: Pandas for ranking countries, trends, and more
  - Visualizations: Line charts for global trends, bar charts for top countries

## 📊 Example Visualizations
Global Trends (2006–2022)
Average GDP, Inflation, R&D, and New Business Density


Top 10 Countries by GDP
Average Gross Capital Formation (% of GDP)







