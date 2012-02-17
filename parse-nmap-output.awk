function init() {
  ip = ""
  ports = ""
}


BEGIN {
  init()
}

# to json hash
function dump() {
  s = sprintf("{ip: \"%s\", ports: [ %s ]}", ip, ports)
  print s
}


/^Nmap scan report for / {
  if (ip != "") {
    dump()
    init()
  }
  ip = $5
}

/^[0-9]+\// {
  split($1, x, "/")
  if (ports != "")
    ports = ports ", "
  ports = ports x[1]
}

/^Nmap done:/ {
  if (ip != "")
    dump()
}

