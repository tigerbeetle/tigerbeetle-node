docker run -v $(pwd):/wrk -w /wrk --entrypoint bash node -c "npm install && npm pack"
