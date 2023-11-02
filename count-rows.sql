datasources:  
  row_count:
    type: datasource.sqlite
    options:
      provider: DATA_PROVIDER_DYNAMIC
  
      entities:
        - default/steps
  
      query: |
        SELECT COUNT(*) AS row_count
        FROM [default/steps] 