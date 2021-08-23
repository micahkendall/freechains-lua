-- example generating keys with code "mellon" without storing the fc template as a variable
fc = require"freechains" -- base freechains api
-- there is a quirk you have to deal with when using the daemon manually as
-- for some reason the java implementation (seperate to this project) requires a newline.
print(fc.new{ip="127.0.0.1", port="8330"}:call{"crypto pubpvt\n mellon"})