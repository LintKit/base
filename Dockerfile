FROM php:8.3-cli-alpine3.17

ARG ADDITIONAL_PACKAGES

# Copy artifaxcts from component images
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk add --update --no-cache ${ADDITIONAL_PACKAGES}

COPY ./ /src
RUN chmod +x /src/lintkit
RUN ln -s /src/lintkit /lintkit

WORKDIR /app

CMD ["/lintkit", "-v"]
