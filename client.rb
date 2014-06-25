#!/usr/bin/env ruby
#
#

require 'socket'

magic_string = "\x00"

sock = TCPSocket.open('localhost', 6969)
counter = 0

while counter <= 1000000 do
  sock.write(magic_string)
  magic_string.next!
  counter += 1
end
