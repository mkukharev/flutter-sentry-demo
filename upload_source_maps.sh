export SENTRY_API_KEY=
echo $SENTRY_API_KEY
sentry-cli releases files receptioner_monitoring@2.0.0 upload-sourcemaps ./build/web/ --rewrite --org=receptioner --project=monitoring --auth-token=$SENTRY_API_KEY --dist=rprod
