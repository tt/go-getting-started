FROM golang:alpine as build
COPY . /go/src/github.com/heroku/go-getting-started
RUN cd /go/src/github.com/heroku/go-getting-started && go install .

FROM alpine
WORKDIR /app
COPY --from=build /go/bin/go-getting-started /app/
COPY --from=build /go/src/github.com/heroku/go-getting-started/static/* /app/static/
COPY --from=build /go/src/github.com/heroku/go-getting-started/templates/* /app/templates/
CMD /app/go-getting-started
