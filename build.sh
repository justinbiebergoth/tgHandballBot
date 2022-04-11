docker buildx build --platform linux/amd64,linux/arm64  -t tghandballbot:"$1" . \
&& docker tag tghandballbot:"$1" justinbiebergoth/tghandballbot:"$1" \
&& docker push justinbiebergoth/tghandballbot:"$1"


