require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 2010

loop {
	s = TCPSocket.open(hostname, port)
	s.print("client message")
	line = s.gets   # Read line from the socket
	puts line
	s.close               # Close the socket when done

	sleep(2.0)
}
