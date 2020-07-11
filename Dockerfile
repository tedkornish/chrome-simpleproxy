FROM siomiz/chrome:latest

RUN apt-get update && \
    apt-get install -y simpleproxy

RUN echo '\
\
[program:simpleproxy] \n\
command=/usr/bin/simpleproxy -L 0.0.0.0:9223 -R 0.0.0.0:9222 \n\
user=chrome \n\
autorestart=true \n\
priority=400 \n\
' >> /etc/supervisor/conf.d/supervisord.conf

EXPOSE 9223
