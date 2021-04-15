FROM alpine as v1
  RUN echo "v1" > /v
  ENTRYPOINT ["cat", "/v"]

FROM alpine AS v2
  RUN echo "v2" > /v
  ENTRYPOINT ["cat", "/v"]
