# lsstsqre/farthing

This is a minimal Docker container.  It does nothing, and exits with a
zero return code.

## Motivation

I needed a do-nothing container for Moneypenny.

### Why not just use "library/alpine:latest" ?

Have you seen that thing?  "Only 5 MB in size!"  What a pig!

### So, um...?

Based on the
magisterial
[ A Whirlwind Tutorial on Creating Really Teensy ELF Executables for Linux](https://www.muppetlabs.com/~breadbox/software/tiny/teensy.html) I
went looking for
the [x86_64 analog](https://stackoverflow.com/questions/53382589) and
modified it so that it exited with a return code of zero.

### Build process

Start with the hideously bloated alpine:latest.  Add the nasm apk
(another 8 megabytes!).

Assemble the [source](./farthing.asm), which yields a much-more-svelte
112 bytes.

Chmod that so it's executable.

Then copy that into a scratch container.  Make it run as a non-root
user, obviously, and add an entrypoint.

### Farthing

It's a quarter of a penny.  It's the smallest denomination of
(pre-decimalisation) UK currency.

Also, "farthing."  Heh, heh.

## Conclusion

`lsstsqre/farthing                                                              1.0.1                            4f8f0be82779   3 hours ago     112B`
