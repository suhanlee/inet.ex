defmodule Inet do
  @moduledoc """
  Documentation for `Inet`.
  """

  @doc """
  A function that takes a hostname and returns a list of IP addresses.
  The IP address in the result may vary as it depends on the network and DNS resolution.

  ## Examples

      iex> Inet.get_ip_address_list("google.com")

  """
  def get_ip_address_list(hostname) do
    case get_host_by_name(hostname) do
      {:ok, {_, _, [], _, _, ip_address_tuple_list}} ->
        ip_address_list = _get_ip_address_list(ip_address_tuple_list)
        {:ok, ip_address_list}

      {:ok, {_, _, [_], _, _, ip_address_tuple_list}} ->
        ip_address_list = _get_ip_address_list(ip_address_tuple_list)
        {:ok, ip_address_list}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  A function that takes a ip address and returns a list of dns.

  ## Examples

      iex> Inet.get_dns_list("172.217.27.46")

  """
  def get_dns_list(ip_address) do
    case get_host_by_addr(ip_address) do
      {:ok, {_, host, host_list, _, _, []}} ->
        only_host_list = _only_dns_address_list(host_list)
        {:ok, [host] ++ only_host_list}

      {:ok, {_, host, host_list, _, _, [_]}} ->
        only_host_list = _only_dns_address_list(host_list)
        {:ok, [host] ++ only_host_list}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  A convenience function that calls `:inet.gethostbyname`.

  ## Examples

      iex> Inet.get_host_by_name("google.com")

  """
  def get_host_by_name(hostname) do
    Kernel.to_charlist(hostname)
    |> :inet.gethostbyname()
  end

  @doc """
  A convenience function that calls `:inet.gethostbyaddr`.

  ## Examples

      iex> Inet.get_host_by_addr("172.217.27.46")

  """
  def get_host_by_addr(ip_address) do
    Kernel.to_charlist(ip_address)
    |> :inet.gethostbyaddr()
  end

  defp _get_ip_address_list(ip_address_tuple_list) do
    ip_address_tuple_list
    |> Enum.map(fn tuple -> Tuple.to_list(tuple) end)
    |> Enum.map(fn address -> Enum.join(address, ".") end)
  end

  defp _only_dns_address_list(host_list) do
    host_list
    |> Enum.reject(fn addr -> String.contains?(to_string(addr), "in-addr.arpa") end)
  end
end
