/^#/ {
  next
}

{ 
  print "Scanning range " $1
  print "==================="
  system(sprintf("sudo nmap -sS %s", $2))
  print "==================="
}

