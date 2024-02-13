ARG GOPRIVATE=$GOPRIVATE

FROM golang:1.21 AS base
RUN apt-get update && apt-get install -y ca-certificates git-core ssh
ADD ./id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tIdentityFile /root/.ssh/id_rsa\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN git config --global url.git@github.com:.insteadOf https://github.com/
RUN export "GOPRIVATE=${GOPRIVATE}"
WORKDIR /app

COPY . .
RUN go mod download
RUN CGO_ENABLED=0 go build -o main cmd/api/main.go

FROM scratch
COPY --from=base /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=base /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=base /etc/passwd /etc/passwd
COPY --from=base /etc/group /etc/group
WORKDIR /app
COPY --from=base /app /app
ENTRYPOINT ["/app/main"]