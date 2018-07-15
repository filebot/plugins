docker:
	docker build --rm -t filebot -f Dockerfile .
	docker run -it -v ${PWD}:/volume1 -v data:/data filebot -script fn:sysinfo

docker-node:
	docker build --rm -t filebot-node -f Dockerfile.node .
	docker run -it -v ${PWD}:/volume1 -v data:/data -p 5452:5452 filebot-node

docker-watcher:
	docker build --rm -t filebot-watcher -f Dockerfile.watcher .
	mkdir -p input output
	docker run -it -v ${PWD}:/volume1 -v data:/data filebot-watcher /volume1/input --output /volume1/output

clean:
	-rm -rvf input output
	-docker kill `docker ps -q`
	-docker rm `docker ps -a -q`
	-docker rmi -f `docker images -q`

deploy:
	curl -H "Content-Type: application/json" --data '{"docker_tag": "latest"}'  -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
	sleep 300
	curl -H "Content-Type: application/json" --data '{"docker_tag": "node"}'    -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
	sleep 300
	curl -H "Content-Type: application/json" --data '{"docker_tag": "watcher"}' -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
	sleep 300
	open https://hub.docker.com/r/rednoah/filebot/builds/
