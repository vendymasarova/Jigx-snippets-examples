datasources:  
  actualDay:
    type: datasource.sqlite
    options:
      provider: DATA_PROVIDER_DYNAMIC
  
      entities:
        - default/dates
  
      query: 
        SELECT 
        id, 
        STRFTIME('%d', json_extract(data, '$.date')) AS date,
        STRFTIME('%d.%m', json_extract(data, '$.finished_date')) AS finished_date,
        FROM [default/dates]
