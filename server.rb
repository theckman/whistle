#!/usr/bin/env ruby
#
#

require 'socket'

server = TCPServer.open(6969)


loop {
  conn = server.accept
  counter = 0
  magic_string = "\x00"

  while msg = conn.read(magic_string.length) do
    unless msg == magic_string
      puts "Corruption detected on transmission number #{counter}"
      puts "Expected:"
      puts magic_string.each_byte.map { |b| b.to_s(16) }.join
      puts "Received:"
      puts msg.each_byte.map { |b| b.to_s(16) }.join
    end
    magic_string.next!
    counter += 1
  end
}
