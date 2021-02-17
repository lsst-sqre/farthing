FROM alpine:latest AS base-image
RUN apk add nasm
COPY minimal.asm .
RUN nasm -f bin -o a minimal.asm && chmod +x a
FROM scratch
COPY --from=base-image /a /a
USER 1000
ENTRYPOINT [ "/a" ]
