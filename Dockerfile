# Farthing: minimal do-nothing container image
FROM alpine:latest AS base-image
RUN apk add nasm
COPY farthing.asm .
RUN nasm -f bin -o a farthing.asm && chmod +x a
FROM scratch
COPY --from=base-image /a /a
USER 1000
ENTRYPOINT [ "/a" ]
