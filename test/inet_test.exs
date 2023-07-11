defmodule InetTest do
  use ExUnit.Case
  doctest Inet

  test "get ip address list" do
    {:ok, ip_address_list} = Inet.get_ip_address_list("www.google.com")
    assert is_list(ip_address_list)
  end

  test "get dns list" do
    {:ok, dns_list} = Inet.get_dns_list("1.1.1.1")
    assert is_list(dns_list)
  end

  test "get host by name" do
    {:ok, {:hostent, _, _, _, _, ip_address_list}} = Inet.get_host_by_name("www.google.com")
    #  {:hostent, 'www.google.com', [], :inet, 4, [{172, 217, 25, 4}]}
    assert is_list(ip_address_list)
  end

  test "get host by address" do
    {:ok, {:hostent, _, _, _, _, host_list}} = Inet.get_host_by_addr("8.8.8.8")
    #  {:hostent, 'dns.google', ['8.8.8.8.in-addr.arpa'], :inet, 4, [{8, 8, 8, 8}]}
    assert is_list(host_list)
  end
end
