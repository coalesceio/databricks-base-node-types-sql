@id("0ddb8137-9d16-4591-b7f5-d0fb20d2ec2f")
@nodeType("SQLWork")
@description("Work table - tags and primaryKey: node-level tags on the table, column-level tags on email and region, informational PRIMARY KEY on client_id")
@writeMode("truncateInsert")
@tag("cost_center", "finance")
@tag("env", "dev")
SELECT
    `client_id`   AS `client_id`   @id("6f52d6") @primaryKey(1) @not_null @uniqueness,
    `client_name` AS `client_name` @id("459b6c"),
    `email`       AS `email`       @id("d6ec0b") @tag("pii", "email"),
    `region`      AS `region`      @id("28a1f9") @tag("domain", "geo"),
    `update_time` AS `update_time` @id("6037e7")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
