import pandas as pd
df = pd.read_parquet('./data/country.parquet')
df.CountryID.isnull().sum()
df.dtypes
df.to_csv('./data/country.csv', index=False)



df = pd.read_parquet('./data/price.parquet')
df.dtypes
df.to_csv('./data/price.csv', index=False)


df = pd.read_parquet('./data/purchased_games.parquet')
df.dtypes
df.shape
df.PlayerID.isnull().sum()
df.dropna(subset=['PlayerID'], inplace=True)
df['PlayerID'] = df['PlayerID'].astype(int)
df.GameID.isnull().sum()
df_exc = df[df['GameID']==' ']
df = df[~df.index.isin(df_exc.index)]
df.shape
df['GameID'] = df['GameID'].astype(int)
df_exc1 = df[df['GameID']=='']
df = df[~df.index.isin(df_exc1.index)]
df.shape
df['GameID'] = df['GameID'].astype(int)
df.dtypes
df.to_csv('./data/purchased_games.csv', index=False)



df = pd.read_parquet('./data/players.parquet')
df.dtypes
df.shape
df.PlayerID.isnull().sum()

df.to_csv('./data/players.csv', index=False)



import pandas as pd
df = pd.read_parquet('./data/games.parquet')

.dtypes
df.shape
df.GameID.isnull().sum()
df['Release_Date'].value_counts()
df['Release_Date'] =pd.to_datetime(df['Release_Date'], errors='coerce')
df = df.dropna(subset=['Release_Date'])
df = df.reset_index(drop=True)
df.to_csv('./data/games.csv', index=False)
df.head(40)