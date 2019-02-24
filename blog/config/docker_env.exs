defmodule DockerEnv do
  def get_secret_key_base, do: System.get_env("SECRET_KEY_BASE")
  def get_username, do: System.get_env("DB_USERNAME")
  def get_password, do: System.get_env("DB_PASSWORD")
  def get_database, do: System.get_env("DB_NAME")
  def get_hostname, do: System.get_env("DB_HOSTNAME")
end
