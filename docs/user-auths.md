
# User Auths

> **Updated** Apr 11, 2024 – Lo Shih – initial doc


## Creating User Auths for API Access 

> **See** [elysium/riskapi](/elysium/riskapi)

Implementation notes:

### Using HMAC-SHA256/512 API Keys

#### Generating API Keys

1.  **Generate API Key**
    - Generate properties:
      - `api_key: string` – the API key (usually a UUIDv4)
      - `secret: bytes` – the secret data, language-specific libraries for generating a keys. 
2.  **Record generated key secret in AWS Secrets Manager**
    1. Determine the SecretId for the key
        - Properties:
          - `env` – either `dev` or `prod`
          - `tenant` – should be the deployment tenant name, [*slugified*](#slugify)
          - `service` – the logical service processing API requests
          - `api_key` – the API key (usually a UUIDv4)
        - Examples:
          - `prod/laser/riskapi/12345678-1234-1234-1234-1234567890ab`
    2. Determine the properties for the secret:
        - Properties:
          - `api_key` – the API key
          - `source` – the source/legal entity providing the data
          - `legal_entity: string` (optional) – the legal entity name
          - `user: string` (optional) – login of the user
          - `status: string` – the database activity_status of the API key
          - `keys: list[KeyData]` – a list of keys, each with the following properties:
        - `KeyData` – a key data object
          - `key_type: string` – the type of key, `"oct"` for HMAC keys
            - Defaults to `"oct"`
            - Corresponds to JWKs `kty` property
          - `algo: string` – Algorithm used to generate the key
            - One of: `"HS256"`, `"HS384"`, `"HS512"`
            - Corresponds to JWKs `alg` property
          - `key: string` – key secret
            - Key data encoded according to `key_digest`
            - Corresponds to JWKs `k` property, digested as `"base64"`
          - `key_digest: string` – digest used to encode the `key`
            - One of `"base64"`, `"hex"`
            - No corresponding JWK property, base64 is assumed
          - `not_before: string` – the type of key, `"oct"` for HMAC keys
            - An ISO 8601 date string for the key's activation date
            - Corresponds to JWKs `nbf` property
          - `expire: string` or `"kty"` for JWTs – the type of key, `"oct"` for HMAC keys
            - An ISO 8601 date string for the key's expiration date
            - Corresponds with the **user_auths**.expire_date field
            - Corresponds to JWKs `exp` property

        For example:

        ```jsonc
          // SecretId: prod/{tenant}/riskapi/{api_key}
          {
            "api_key": "...",           // opaque (jwt.sub, jwk.kid)
            "source": "...",            // sources.name
            "legal_entity": "...",    // legal_accounts.name
            "user": "...",            // tico_accounts.login
            "keys": [
              {
                "key_type": "oct",                        // jwk.kty
                "algo": "HS256"                           // jwk.alg = HS256, HS512
                "key": "<base64>",                        // jwk.k (base64)
                "key_digest": "base64",                   // "hex"|"base64"
                "not_before": "2024-01-01T00:00:00.000Z", // jwk.nbf (epochms)
                "expire": "2025-01-01T00:00:00.000Z",     // jwk.exp (epochms)
              },
            ],
          }
          ```

          > **Note:** the purpose of having multiple keys is for key rotation. During the key exchange window, more than one key must be available at any given time to provide continuity.

    3. Record the secret in the AWS Secrets Manager

        ```sh
        aws secretsmanager put-secret-value --secret-id prod/laser/riskapi/12345678-1234-1234-1234-1234567890ab -- < keydata.json        
        ```
    4. Record the key in RiskDB:

        ```sql
        exec ur_createuserauth
            @login="{systemuser}",
            @group=NULL, // or "{legal_entity}",
            @user="{permissioned_user}",
            @auth_type="api-key-hmac-sha",
            @auth_pubkey="{api_key}",
            @auth_secret="sm:prod/{tenant}/riskapi/{api_key}",
            @auth_title=NULL, -- or "{user_provided_label}",
            @auth_expire_date="{expire_date}",
            @auth_status="{activity_status}",
            @error=@error out,
            @user_auth_id=@user_auth_id out        
        ```

#### Verifying API Keys

1. **Verifying Identity**
    1. Determine the SecretId for the key
        - Properties:
          - `env` – either `dev` or `prod` (static config)
          - `tenant` – should be the deployment tenant name (static config)
          - `service` – the logical service processing API requests (static config)
          - `api_key` – the API key (from request)
        - Examples:
          - `prod/laser/riskapi/{api_key}`
    2. Retrieve the secret from the AWS Secrets Manager
       1. If the key doesn't exist, return a general 401
    3. Parse the secret data
       1. Attempt to find the key in the list of keys which matches
          - See the signature algorithm based on the api service docs
       2. If the key is not found
          - Return a 401
       3. If the status is not "Active", return one of:
          - "Pending" &rarr; "API key is pending activation"
          - "Inactive" &rarr; "API key is no longer active"
       4. If the key is not yet active
          - Return a 401 with a message: "API key has not yet been activated"
       5. If the key has expired,
          - Return a 401 with a message: "API key has expired"
    4. Key is valid, continue with processing
2. **Validating the Request**
    1. Check rate limits
    3. Check client IP whitelist, see **user_auth_iplists** for more info
3. **Performing Actions**$$
    1. When calling procs, use the `api_key` as input, and for the ones that require a password or secret, use the formatted secret as `"sm:{SecretId}"`
    2. Procs should lookup the `api_key` in **user_auths**.pubkey to:
       1. Determine the `user_id` for the key
       2. Lookup **legal_entities** and **external_accounts**




## User Auths Schema

For the table [`user_auths`](../tree/master/tables/user_auths.sql).

```sql
create table
    user_auths (
        user_auth_id int identity,
        user_id int,
        user_auth_type_id int,
        pubkey varchar(150) null,
            /* For asymmetric keys, this is the public key, possibly prefixed 
             * by by "^\w:", which indicates that the public key needs to be 
             * resolved at the app-level */
        secret varchar(150),
            /* If prefixed "^\w:", this is a app-layer lookup and cannot be 
             * resolved by the database. For example, "sm:1234567890abcdef", 
             * could indicate that the secret is to be resolved using AWS 
             * Secrets Manager. */
        title varchar(50) null,
            /* Settable by the user */
        user_device_id int null,
            /* For auth types that require to be linked to a specific-device, 
             * such as a browser cookie, this should be pointed to the user's 
             * device. */
        expire_date datetime null,
            /* If the expire_date is non-NULL and has elapsed, the 
             * activity_status_id 'Active' should be considered 'Disabled'. */
        activity_status_id int
            /* 'Disabled' means it may be presented to the user or 
             * administrator for reactivation, i.e. 'Active', 'Inactive' should 
             * mean that the auth can no longer be used and shoudl be hidden. 
             * We try not to delete these for a period of Jan-1 of the previous 
             * year, so that user_session_auth_attempts may still refer to this 
             * auth */
    )
with
    identity_gap = 5
```

And for the table [`user_auth_types`](../tree/master/tables/user_auth_types.sql).

```sql
create table
    user_auth_types (
        user_auth_type_id int,
        name varchar(50),
        code varchar(50),
        gen_secret_template varchar(100) NULL,
        gen_secret_charset varchar(65) NULL,
        hash_algo varchar(10) NULL,
        single_use char(1) default 'N', -- 'Y' to disable on first use
        otp char(1) default 'N' -- 'Y' or 'N' whether this auth type is capable of OTP
    )

1> select * from user_auth_types;
 user_auth_type_id name                   code             gen_secret_template      gen_secret_charset hash_algo single_use otp
 ----------------- ---------------------- ---------------- ------------------------ ------------------ --------- ---------- ---
                 1 Password Insecure      password-clear   NULL                     NULL               NULL      N          N
                 2 Password Hash          password-hash    NULL                     NULL               db-sha1   N          N
                 3 Master Password        password-master  NULL                     NULL               db-sha1   N          N
                 4 One Time Recovery Code recovery-code    ????-????                numeric            db-sha1   Y          Y
                 5 JWT Token              jwt-token        NULL                     NULL               NULL      N          N
                 6 TOTP                   totp             NULL                     NULL               NULL      N          Y
                 7 WebAuthn Security Key  u2f              NULL                     NULL               NULL      N          Y
                 8 Invite Code            invite-code      ?????-????               uppernumeric       db-sha1   Y          Y
                 9 API Key                api-key          ????????-????????        numericalpha       NULL      N          N
                10 API Key Hash           api-key-hash     ????????-????????        numericalpha       db-sha1   N          N
                11 API Secret Key         api-secret-key   ???????????????????????? numericalpha       db-sha1   N          N
                12 API Key HMAC-SHA       api-key-hmac-sha NULL                     NULL               NULL      N          N
```

### Implementation Notes

- *tbd*



### `slugify`

- a title string converted into kebab case
- dashes are converted to double dash

```python
def slugify(name: str)
    return name.lower().replace('-', '[~]').replace(' ', '-').replace('[~]', '--')
```
