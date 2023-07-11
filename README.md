# Inet.ex

`Inet.ex` was created in Elixir to simplify the invocation of address and DNS queries using `:inet`.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `inet_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:inet_ex, "~> 0.1.0"}
  ]
end
```

## Usage

### Get ip address list by host name

```elixir
iex> {:ok, ip_address_list} = Inet.get_ip_address_list("www.google.com")
{:ok, ["142.251.220.68"]}

# This is direct calling :inet.gethostbyname()
iex> Inet.get_host_by_name("www.google.com")
{:ok, {:hostent, 'www.google.com', [], :inet, 4, [{142, 250, 66, 132}]}}
```

### Get dns list by ip address

```elixir
iex>  {:ok, dns_list} = Inet.get_dns_list("8.8.8.8")
{:ok, ['one.one.one.one']}

# This is direct calling :inet.gethotbyaddr()
iex> Inet.get_host_by_addr("8.8.8.8")
{:ok,
 {:hostent, 'dns.google', ['8.8.8.8.in-addr.arpa'], :inet, 4, [{8, 8, 8, 8}]}}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/inet_ex>.

