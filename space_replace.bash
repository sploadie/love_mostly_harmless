# Copy paste into shell
for f in *\ *; do mv "$f" "${f// /_}"; done
for f in */*\ *; do mv "$f" "${f// /_}"; done
for f in */*/*\ *; do mv "$f" "${f// /_}"; done
for f in *é*; do mv "$f" "${f//é/e}"; done
for f in */*é*; do mv "$f" "${f//é/e}"; done
for f in */*/*é*; do mv "$f" "${f//é/e}"; done