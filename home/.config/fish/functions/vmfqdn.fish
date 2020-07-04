# Make this universal?
set TF_DIR ~/git/jeli-dev-workstation/terraform/users/rfrantz

# What's my DNS again?
function vmfqdn
  cd $TF_DIR
  set fqdn (terraform output public_dns)
  cd - > /dev/null
  echo $fqdn
end
