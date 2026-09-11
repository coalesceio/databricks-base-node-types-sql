@id("d3b68d21-f501-41ad-88bf-e48a7060ca07")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey` @inHash("GH_KEY", "1"),
     `n_regionkey` AS `n_regionkey` @inHash("GH_KEY", "2"),
     `n_comment` AS `n_comment` @inHash("GH_NAME", "1"),
     `n_name` AS `n_name` @inHash("GH_NAME", "2"),
     CAST({{ get_hash('GH_KEY') }} AS STRING) AS `hash_key_sha1_default`,
     CAST({{ get_hash('GH_KEY', 'sha1') }} AS STRING) AS `hash_key_sha1_lowercase`,
     CAST({{ get_hash('GH_KEY', 'SHA224') }} AS STRING) AS `hash_key_sha224`,
     CAST({{ get_hash('GH_KEY', 'SHA-256') }} AS STRING) AS `hash_key_sha256_dashed`,
     CAST({{ get_hash('GH_KEY', 'SHA384') }} AS STRING) AS `hash_key_sha384`,
     CAST({{ get_hash('GH_KEY', 'SHA512') }} AS STRING) AS `hash_key_sha512`,
     CAST({{ get_hash('GH_KEY', 'MD5') }} AS STRING) AS `hash_key_md5`,
     CAST({{ get_hash('GH_KEY', 'SHA1', '-') }} AS STRING) AS `hash_key_custom_delimiter`,
     CAST({{ get_hash('GH_KEY', 'SHA1', '') }} AS STRING) AS `hash_key_no_delimiter`,
     CAST({{ get_hash('GH_KEY', 'UNSUPPORTED_ALGO') }} AS STRING) AS `hash_key_unknown_algo_fallback`,
     CAST({{ get_hash('GH_NAME') }} AS STRING) AS `hash_name_group_ordered`,
     CAST({{ get_hash('NOT_A_HASH_GROUP') }} AS STRING) AS `hash_missing_group_null`
FROM {{ ref('SRC', 'nation') }} `nation`
