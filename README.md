# kea-v6


#### Add repo

`sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

#### Check docker versions

`dnf list docker-ce --showduplicates | sort -r

#### Install docker

`sudo yum install docker-ce

#### Enable docker

`sudo systemctl enable --now docker
`sudo systemctl status docker

#### test docker

`sudo docker run hello-world



#### Docker Compose

docker compose version


#### VYOS dhcp relay config

configure

#### Set the interface where DHCPv6 clients reside
set service dhcpv6-relay listen-interface eth2

#### Set the address of the DHCPv6 server (can specify multiple)
set service dhcpv6-relay upstream-interface eth1 address fd10::10

#### Optional: specify the interface through which packets should be sent to the server
set service dhcpv6-relay link-interface eth1

#### Commit and save
commit
save
exit


# Firewall rules for server

firewall-cmd --get-active-zones
firewall-cmd --zone=public --list-all

#### Temporarily (takes effect immediately)
firewall-cmd --zone=public --add-port=547/udp

#### Persistently
firewall-cmd --zone=public --add-port=547/udp --permanent

#### Reload to apply permanent rules
firewall-cmd --reload


#### Check logs for kea container

sudo docker logs kea-dhcp6


#### Add /etc/docker/daemon.json to enable ipv6

{
  "ipv6": true,
  "fixed-cidr-v6": "fd00:dead:beef::/64"
}


#### Allow RAs

`cat /proc/sys/net/ipv6/conf/enp0s5/accept_ra

**CENTOS**

`echo "net.ipv6.conf.enp0s5.accept_ra = 2" | sudo tee -a /etc/sysctl.d/99-accept-ra.conf

OR
**KALI**

`echo "net.ipv6.conf.eth0.accept_ra = 2" | sudo tee -a /etc/sysctl.d/99-accept-ra.conf


`sudo sysctl --system
`ip -6 route



**Run Container**

docker compose up --build --remove-orphans

sudo docker exec -it kea-dhcp6 /bin/bash

