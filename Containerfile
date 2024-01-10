FROM docker.io/nginx
WORKDIR /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY *.* .

RUN chmod +x ./container_run.sh
RUN chmod 777 ./
RUN chown -R 1001:0 /var/cache/nginx && chmod -R ug+rwx /var/cache/nginx && chown -R 1001:0 /var/run
RUN chown -R 1001:0 /run

USER 1001

EXPOSE 8080

CMD ./container_run.sh
