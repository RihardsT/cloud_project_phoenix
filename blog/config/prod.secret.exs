use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :blog, BlogWeb.Endpoint,
  secret_key_base: {:system, "SECRET_KEY_BASE"}
  # secret_key_base: DockerEnv.get_secret_key_base()
# Configure your database
config :blog, Blog.Repo,
  username: {:system, "DB_USERNAME"},
  password: {:system, "DB_PASSWORD"},
  database: {:system, "DB_NAME"},
  hostname: {:system, "DB_HOSTNAME"},
  # username: DockerEnv.get_username(),
  # password: DockerEnv.get_password(),
  # database: DockerEnv.get_database(),
  # hostname: DockerEnv.get_hostname(),
  pool_size: 15
