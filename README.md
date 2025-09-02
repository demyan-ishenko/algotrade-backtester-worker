Memcached count keys
```bash -c 'exec 3<>/dev/tcp/127.0.0.1/11211; printf "stats\r\nquit\r\n" >&3; cat <&3 | awk "/^STAT curr_items/ {print \$3}"'```

Memcached percent usage
bash -c 'exec 3<>/dev/tcp/127.0.0.1/11211
printf "stats\r\nquit\r\n" >&3
cat <&3 | awk "
/^STAT bytes/ {b=\$3}
/^STAT limit_maxbytes/ {m=\$3}
END {if(m) printf \"%.2f%%\\n\", (b/m)*100 }"'