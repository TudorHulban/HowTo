# Install with Docker

```sh
sudo docker run -d --name=co-postgres -p 5432:5432 -v postgres-volume:/var/lib/postgresql/data -e POSTGRES_PASSWORD=thepassword postgres
```

## Locks

```html
https://www.netguru.com/blog/advisory-locks
```

### Resources

```html
https://dbaclass.com/article/monitor-sql-queries-in-postgres-using-pg_stat_statements/
https://linuxiac.com/postgresql-docker/
https://medium.com/avitotech/standby-in-production-scaling-application-in-second-largest-classified-site-in-the-world-97a79a1929de
https://dev.to/heroku/postgres-is-underrated-it-handles-more-than-you-think-4ff3
https://postgresqlco.nf/en/doc/param/
```
