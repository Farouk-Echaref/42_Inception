#!/bin/sh

echo maxmemory 256mb >> /etc/redis/redis.conf

echo maxmemory-policy allkeys-lfu >> /etc/redis/redis.conf