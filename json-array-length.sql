--  array length if there is an array in the coloumn

datasources:
  battle-dynamic: 
    type: datasource.sqlite
    options:
      provider: DATA_PROVIDER_DYNAMIC
  
      entities:
        - default/battles
  
      query: |
        SELECT 
          id, 
          '$.name',
          '$.result_km',
          json_array_length(json_extract(data, '$.friends')) AS num_friends 
        FROM [default/battles] 