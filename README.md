Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


### My comments
Run models with given tag (to be used on dbt cloud):
`dbt run --model tag:nightly`

Run macros:
`dbt run-operation sustpend_wh --args '{wh_name: transform_wh}'`

Run models using given source:
`dbt run --models source:snowflake_sample+`

Run snapshots:
`dbt snapshot`
