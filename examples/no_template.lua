-- example generating keys with code "mellon"
fc = require"freechains" -- base freechains api
-- connect, run and print "chains list" without generating or storing a template for the particular daemon
print(fc{"chains", "list", ip="127.0.0.1", port="8330"})