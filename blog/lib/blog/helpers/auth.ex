defmodule Blog.Helpers.Auth do
  def authorized?(conn) do
    token = List.last(Plug.Conn.get_req_header(conn, "authorization"))
    username = Application.get_env(:blog, :basic_auth_config)[:username]
    password = Application.get_env(:blog, :basic_auth_config)[:password]
    gen_token = "Basic " <> Base.encode64("#{username}:#{password}")
    # IO.puts "Logged in? #{token == gen_token}, #{token}, #{gen_token}"
    token == gen_token
  end
end
