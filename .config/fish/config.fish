alias whoises 'ssh root@linux2100.neodigit.com '\''php /usr/custombin/dominios.es.stats/whois-toplus.php '\'' $1'

if [ -x /usr/local/bin/keychain ]
    keychain --nogui
    . $HOME/.keychain/$HOSTNAME-fish
end

if boot2docker status | grep running > /dev/null
  set shinit (boot2docker shellinit)
  for i in (seq (count $shinit))
    eval $shinit[$i]
  end
end

set PATH $HOME/bin $PATH
set PATH /usr/local/sbin $PATH

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
