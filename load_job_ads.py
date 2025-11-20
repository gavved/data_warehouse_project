import dlt
import requests
import json

url = 'https://jobsearch.api.jobtechdev.se/search'

def get_ads(url, params):
    headers = {'accept': 'application/json'}
    response = requests.get(url, headers=headers, params=params)
    response.raise_for_status() # check for http errors
    return json.loads(response.content.decode('utf8'))

@dlt.resource(write_disposition="replace")
def jobads_resource(params):
    url = 'https://jobsearch.api.jobtechdev.se/search'

    for ad in get_ads(url, params).get('hits'):
        yield ad


def run_pipeline(query, table_name):
    pipeline = dlt.pipeline(pipeline_name='jobsearch', destination='snowflake', dataset_name='staging')

    params = {"q": query, "limit": 100}

    load_info = pipeline.run(jobads_resource(params=params), table_name=table_name)
    print(load_info)


if __name__ == "__main__":

    query = "Försäljning, inköp, marknadsföring"
    table_name = "sales_field_job_ads"

    run_pipeline(query, table_name)
