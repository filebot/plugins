build:
	docker build --rm -t filebot -f Dockerfile .
	docker run -it -v ${PWD}:/volume1 -v data:/data filebot -script fn:sysinfo


clean:
	-rm -rvf input output
	-docker kill `docker ps -q`
	-docker rm `docker ps -a -q`
	-docker rmi -f `docker images -q`

deploy:
	curl -H "Content-Type: application/json" --data '{"docker_tag": "latest"}' -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
	sleep 300
	curl -H "Content-Type: application/json" --data '{"docker_tag": "node"}' -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
	sleep 300
	curl -H "Content-Type: application/json" --data '{"docker_tag": "watcher"}' -X POST https://registry.hub.docker.com/u/rednoah/filebot/trigger/06323d5b-28a2-4332-8f84-66587f27dea9/
