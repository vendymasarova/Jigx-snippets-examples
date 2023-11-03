datasources
  strategies-with-steps:
    type: datasource.sqlite
    options:
      provider: DATA_PROVIDER_LOCAL

      entities:
        - entity: default/steps
        - entity: default/strategies

      query: |
        SELECT
          a.id AS id,
          json_extract(a.data, '$.name') AS name,
          json_extract(a.data, '$.strategy_id') AS strategy_id,
          json_extract(a.data, '$.isActive') AS isActive,
          json_extract(b.data, '$.step') AS step_title,
          json_extract(b.data, '$.step') AS step,
          (
          SELECT COUNT(*)
          FROM [default/steps] s
          WHERE json_extract(s.data, '$.strategy_id') = json_extract(a.data, '$.strategy_id')
          ) AS total_steps,
        FROM [default/strategies] a
        LEFT JOIN [default/steps] b ON json_extract(a.data, '$.strategy_id') = json_extract(b.data, '$.strategy_id')
