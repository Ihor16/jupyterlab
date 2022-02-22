# Taken from https://stackoverflow.com/a/51249778/18184038
# setting up the password
from IPython.lib import passwd
password = passwd("jlab")
c.ServerApp.password = password
