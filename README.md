# manoj-nginx

This corresponds to https://hub.docker.com/r/knowledgeira/manoj-nginx/tags  nginx images. Port 80 and 443 is exposed and we can check POD's ip from container.

Image can be used to run docker or kubernetes POD.
 example of container giving pod's IP.

root@nginx:/# curl -s -k https://localhost | grep -o -P '(?<=>).*?(?=<)'
Welcome to Knowledgeira
Welcome
This is a simple HTML page created and maintained by Manoj Jagdale (knowledgeira).
Your Private IP Address: 10.244.2.23
root@nginx:/# curl -s http://localhost | grep -o -P '(?<=>).*?(?=<)'
Welcome to Knowledgeira
Welcome
This is a simple HTML page created and maintained by Manoj Jagdale (knowledgeira).
Your Private IP Address: 10.244.2.23
