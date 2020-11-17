FROM fluent/fluentd:v1.11-1


USER root

# https://docs.fluentd.org/output/elasticsearch
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document"]

# copy configuration
COPY --chown=fluent:fluent ["fluent.conf", "/fluentd/etc/"]

USER fluent

ENTRYPOINT ["fluentd", "-c", "/fluentd/etc/fluent.conf"]
