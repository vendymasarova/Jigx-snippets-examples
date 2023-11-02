datasources:  
  mood-stats:
    type: datasource.sqlite
    options:
      provider: DATA_PROVIDER_LOCAL

      entities:
        - entity: default/mood-notes
        - entity: default/dates

      query: |
        SELECT
          a.id AS id,
            STRFTIME('%d.%m', json_extract(a.data, '$.date')) AS date,
            json_extract(a.data, '$.day') AS numberOfDay,
            STRFTIME('%d', json_extract(a.data, '$.date')) AS day,
            json_extract(b.data, '$.mood') AS mood,
            json_extract(a.data, '$.date') AS dayDate
        FROM [default/dates] a
        LEFT JOIN [default/mood-notes] b ON STRFTIME('%d.%m', json_extract(a.data, '$.date')) = STRFTIME('%d.%m', json_extract(b.data, '$.date'))
        ORDER BY numberOfDay