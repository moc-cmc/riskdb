
# Configurations 

The schemas for generalized configurations is based on the following tables

### `configs` and `config_props`

```sql
create table
    configs (
        config_id int identity,
        name varchar(100),
                /* Name of the config, which may be a duplicate or variation of 
                 * the config_types.name and/or the subject row's name. This 
                 * name does not need to be unique */
        config_type_id int,
        subject_row_id int NULL,
                /* Row ID of the config_types.subject_table_id if relevant. 
                 * This value should only be used for administrative and 
                 * documentation purposes and should generally not be used for 
                 * joins. The subject should have its own config_id column or 
                 * an optional to-one join table to specify its configuration 
                 * specifically */
        external_ref varchar(100) NULL,
                /* If the contents of this configuration should be taken from 
                 * an external source, instead of or in addition to the 
                 * config_props table, this field should be populated with a 
                 * reference to the external source. The reference may be one 
                 * of the following:
                 * - An `https` or `sftp` URL
                 * - A GitHub URL `git://host/org/repo/base.../path/to/file`
                 * - ...
                 */
        date_created datetime,
                /* Date the config was created */
        date_modified datetime NULL
                /* Date the config was last modified, if ever */
    )


create table
    config_props (
        config_prop_id int identity,
        config_id int,
        config_prop_type_id int,
        value varchar(100) NULL,
                /* Values are processed according to config_prop_types:
                 * - Parsed using the prop type's `datatype`
                 * - Validated using the prop type's `format`, if specified 
                 * - Mapped using the prop type's `input_enums` if specified
                 * - If the value is prefixed with `$ref:<reference>`, the 
                 *   value is looked up at runtime. Currently, the following
                 *   types of references are supported:
                 *   - `$ref:sm:<secret-id>` – The value is looked up in
                 *     AWS Secrets Manager using the secret id.
                 *   - `$ref:#<doc-path>` – Refers to another config with the 
                 *     given document path
                 * - Parsed literals: null, NULL
                 */
    )

```

### `config_types` and `config_prop_types`

```sql
create table
    config_types (
        config_type_id int identity,
        name varchar(100),            -- includes version
        impl_tag varchar(100),        -- Implementation tag, 
        parent_type_id int NULL,      -- parent version 
        subject_table_id int NULL,    -- 
    )

create table
    config_prop_types (
        config_prop_type_id int identity,
        config_type_id int,
        name varchar(100),
                /* Prop names should be lower snake case. */
        datatype varchar(50),
                /* One of: 
                 * - Base types: string, int, float, bool, date 
                 * - Optional types: e.g. `string?`, `int?`, etc
                 * - Literal types: e.g. `'ses'`, `1`, `true`, etc
                 * - Union types: e.g. `string|int`, `string|bool`, etc
                 * - Array types: e.g. `string[]`, `int[]`, etc
                 */
        format varchar(50) NULL,
                /* A validation format, one of:
                 * - Built-in formats: email, phone, url, ip, ipv4, ipv6, 
                 *   semver, date, datetime, time, timezone
                 * - Regular expression: e.g. "^\\d{3}-\\d{2}-\\d{4}$" */
        def_value varchar(100) NULL,
                /* Default value, if any. See config_props.value for more 
                 * details about values */
        title varchar(100) NULL,
                /* An alternate title or input placeholder for the prop. 
                 * E.g. for prop 'smtp_url', "URL for SMTP or Amazon SES" */
        note varchar(200) NULL,
                /* A note or subtitle for the prop. e.g., "URL should be one of 
                 * the following, 'smtp://user:pass@host:port/" or 
                 * 'ses://user@region/?smid=smSecretId'" */
        input_group varchar(50) NULL,  
                /* For grouping input fields on a form, or csv. e.g. address */
        input_enums varchar(200) NULL,
                /* If specified, should be one of the three forms:
                 * - A list of values separated by commas (e.g. "smtp, ses")
                 * - A list of value=title pairs (e.g. "smtp=SMTP, ses=AWS SES")
                 * - The string `sql:` followed by a proc name or SQL
                 *   (e.g. "sql:api_providers") */
    )

```




- [`configs`](../../procs/messaging/configs.sql)
- [`config_props`](../../procs/messaging/config_props.sql)
- [`config_types`](../../procs/messaging/config_types.sql)
- [`config_prop_types`](../../procs/messaging/config_prop_types.sql)

```mermaid
erDiagram
    configs {
      config_id int                 PK
      name varchar(100)
      config_type_id int            FK "Type of the config"
      activity_status_id int        FK "Wether"
      subject_row_id int            FK "Subject row id, e.g. external_account_id"
      date_created datetime
      date_modified datetime
    }
    config_props {
      config_prop_id int            PK
      config_id int                 FK "Owner config"
      config_prop_type_id int       FK "Property type"
      value varchar(100)            "Value of the property as string"
    }
    config_types {
      config_type_id int            PK
      name varchar(100)
      impl_tag varchar(100)         "Implementation name or URL"
      parent_type_id int            FK "Parent config type"
      subject_table_id int_null     FK "Base table, e.g. external_accounts"
    }
    config_prop_types {
      config_prop_type_id int       PK
      config_type_id int            FK "Owner config type"
      name varchar(100)
      datatype varchar(50)          "Datatype of the property, TBD"
      def_value varchar(100)_null   "Optional default value"
    }
    configs ||--|{ config_props : "props"
    config_types ||--|{ config_prop_types : "prop_types"
    configs }o--|| config_types : "type"
    config_props }o--|| config_prop_types : "type"
    config_types }o--|| config_types : "parent"

    examples {
      example_id int
      config_id int
    }
    examples }o--|| configs : "config"

```

The diagram above shows the relationships between configs, props and their types, an an example table which uses them. 

There are several design goals for this schema:

1. **Generalized** – Support generalized configuration
2. **Simple** – Prioritize flat configuration over nested configuration for simplicity
3. Support configuration referencing using `parent_type_id` for
   1. Versioning
   2. Tagging
4. Implementation tagging, for example, "@elysiumtg/rw-messagenotifier@0.3.0/messenger", to indicate that the a config type references a specific version required of a package.
5. **Composable**
6. **Ease of Use** – should be easy to use and enter, using flat forms, 



#### Simplicity

To keep configuration simple, direct and business-oriented as much as possible. Examples of configurations are:

- **Credentials** – such as third party API keys, tokens, which pass through the hands of expert users.
- **Connection Details** – such as external URLs, hosts, ports, etc.
- **Business Rules** – such as thresholds, limits, SLAs, etc.
- **Integration Parameters** – such as enabling/disabling features or customer-specific integration parameters.

More technical details such as timeouts, retry policies, etc. should be handled by other means, such as opsdb, configuration templates or if needed, should be parameterized using named config properties, for example, "aggressive", "conservative", mapped to specific values.

Configurations should be flat as much as possible. However, if absolutely required, property names may be use dot notation to indicate nesting. Instead, nested configurations should use multiple configs. For example, to configure individual subscribed pairs in a price feed, consider implementing a table like `provider_marketdata_subs` with its own `config_id`. 


#### Ease of Use

Configurations should be easy to:

- **Create** – A flat configuration schema should be easy and obvious to create, using a simple rich form, with useful inputs, validation, error checking and validation.
- **Copy** – MPT interface should support copying configurations from other existing configurations without having to re-enter the same values. 
- **Migrate** – When a new version of a configured connector is created, it should be easy to migrate existing configurations to the new version
- **Test** – Configurations should be easy to test, for example, by triggering a config check, which can flag whether a configuration is valid.
- **Monitor** – Configurations should self-document its last modify and use dates


#### Composability

One of the primary goals of this schema is to support composable configurations, to support as much 


#### Security

When specifying credentials or other secure data, the following should be considered:

- Config editors should support referencing/writing secrets from a secret manager, such as AWS Secrets Manager.
- Where not supported, Elysium's support team and tools, should be able to provide secret manager reference strings to enter into the config editor.



## Examples

#### Example: Slack Messenger

In this exmaple, we write a config for a Slack Messenger, which is a configuration type for the `messengers`, able to be consumed by the `@elysiumtg/rw-messagenotifier` package, version 0.3.0. The target configuration needed for this messenger is as follows:

The type definition as consumed by the `@elysiumtg/rw-messagenotifier` package is as follows:

```typescript
export type SlackMessengerConfig = {
  signing_secret: string;
  bot_token: string;
  app_token: string;
  port?: number;
  socket_mode?: boolean;
};
```

An example config definition could look like this:

```json
config = {
  "name": "Slack MPTracker",
  "type": "Slack Messenger",
  "props": {
    "signing_secret": "$ref:sm:{smSecretId}:signing_secret",
    "bot_token": "$ref:sm:{smSecretId}:bot_token",
    "app_token": "$ref:sm:{smSecretId}:app_token",
    "socket_mode": true,
  }
}
```

The following are the corresponding rows in the database:

##### `configs`

| config_id | name              | config_type_id | activity_status_id | subject_row_id |
| --------- | ----------------- | -------------- | ------------------ | -------------- |
| 1         | `Slack MPTracker` | 1              | 1                  | 1              |

##### `config_props`

| config_prop_id | config_id | config_prop_type_id | value                                 |
| -------------- | --------- | ------------------- | ------------------------------------- |
| 1              | 1         | 1                   | `$ref:sm:{smSecretId}:signing_secret` |
| 2              | 1         | 2                   | `$ref:sm:{smSecretId}:bot_token`      |
| 3              | 1         | 3                   | `$ref:sm:{smSecretId}:app_token`      |
| 4              | 1         | 5                   | `true`                                |

##### `config_types`

| config_type_id | name              | impl_tag                                    | parent_type_id | subject_table_id |
| -------------- | ----------------- | ------------------------------------------- | -------------- | ---------------- |
| 1              | `Slack Messenger` | `@elysiumtg/rw-messagenotifier@0.3.0/slack` | NULL           | 1234             |

##### `config_prop_types`

| config_prop_type_id | config_type_id | name             | datatype  | def_value |
| ------------------- | -------------- | ---------------- | --------- | --------- |
| 1                   | 1              | `signing_secret` | `string`  | NULL      |
| 2                   | 1              | `bot_token`      | `string`  | NULL      |
| 3                   | 1              | `app_token`      | `string`  | NULL      |
| 4                   | 1              | `port`           | `number?` | NULL      |
| 5                   | 1              | `socket_mode`    | `bool?`   | true      |

##### `tables`

| table_id | name          |
| -------- | ------------- |
| 1234     | `messengers`  |
