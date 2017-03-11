# mysql56-docker-testnode
A docker based MySQL 5.6 instance for testing purpose

# how to use?
`make build` - builds the mysql node and creates a `foo` user with password `password` with port 3306 mapped to 13306 to your local machine.
`make destroy` - destroies the container
