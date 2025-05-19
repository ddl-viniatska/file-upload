from domino.data_sources import DataSourceClient

# instantiate a client and fetch the datasource instance
ds = DataSourceClient().get_datasource("Anna")

# res is a simple wrapper of the query result
res = ds.query("select * from DIABETES")

# to_pandas() loads the result into a pandas dataframe
df = res.to_pandas()
