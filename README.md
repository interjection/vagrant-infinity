# vagrant-infinity

https://www.vagrantup.com/

```
vagrant up
```

After provisioning infinity will be available at http://127.0.0.1:8080 if there
is no port collision.

Various options, including which git repository to clone and which branch or
revision to checkout can be changed with a [pillar](salt/roots/pillar/infinity.sls)

Tested with only the virtualbox provider.

