from sqlalchemy import create_engine
import pandas as pd
from env_variables import *

def extract_table_names(schema, src_dict):
    try:
        connection_url = f"mysql+pymysql://{src_dict['uid']}:{src_dict['pwd']}@{src_dict['host']}:{src_dict['port']}/{src_dict['database']}"
        engine = create_engine(connection_url)
        src_conn = engine.connect()
        print('Connection Established')
        try:
            df_r = pd.read_sql_query(f"SELECT TABLE_NAME AS table_name FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '{schema}';", src_conn)
            print('Data Extracted')
            return list(df_r['table_name'])
        except Exception as e:
            raise Exception(f"Table Names Extraction Error: {str(e)}")
    except Exception as e:
        print(f"Connection Failed: {str(e)}")

def extract(tbl, src_dict):
    try:
        connection_url = f"mysql+pymysql://{src_dict['uid']}:{src_dict['pwd']}@{src_dict['host']}:{src_dict['port']}/{src_dict['database']}"
        engine = create_engine(connection_url)
        try:
            src_conn = engine.connect()
            # print('Connection Established')
            df_r = pd.read_sql_query(f"SELECT * FROM {tbl}", src_conn)
            # print('Data Extracted')
            return df_r

        except Exception as e:
            raise Exception(f"Data Extraction Error: {str(e)}")

    except Exception as e:
        print(f"Connection Failed: {str(e)}")

def load(df, tbl, trgt_dict):
    try:
        connection_url = f'postgresql://{trgt_dict["uid2"]}:{trgt_dict["pwd2"]}@{trgt_dict["host2"]}:{trgt_dict["port2"]}/{trgt_dict["database2"]}'
        engine = create_engine(connection_url)
        try:
            src_conn = engine.connect()
            print("Connection Established")
            df.to_sql(name=tbl, con=src_conn, if_exists="append", index=False)
            print('Data Loaded')

        except Exception as e:
            raise Exception(f"Data Load Error: {str(e)}")

    except Exception as e:
        print(f"Connection Failed: {str(e)}")


df_dict={}

df_id = pd.read_csv('./log/id.csv')




