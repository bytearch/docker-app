FROM alpine:3.15

LABEL maintainer="bytearch@126.com"

RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories && \
    echo  "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories
RUN apk --update add curl bash tzdata && \ 
    rm -rf /var/cache/apk/*

ENV TZ Asia/Shanghai

COPY ./prometheus-2.29.2/prometheus  /bin/prometheus
COPY ./prometheus-2.29.2/promtool    /bin/promtool
COPY ./prometheus-2.29.2/prometheus.yml /etc/prometheus/prometheus.yml
COPY ./prometheus-2.29.2/console_libraries/ /usr/share/prometheus/consule_libraries;
COPY ./prometheus-2.29.2/consoles/        /usr/share/prometheus/consoles/

WORKDIR /prometheus

EXPOSE 9090

ENTRYPOINT ["/bin/prometheus"]

CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.enable-lifecycle",\
             "--web.console.templates=/usr/share/prometheus/consoles" ]