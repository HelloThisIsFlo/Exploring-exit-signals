echo "Starting puzzle"
docker run -d --name=puzzle --rm puzzle $1

echo "Sleeping for 8 seconds"
sleep 8

echo "Stopping puzzle"
docker stop puzzle
