FROM ollama/ollama:latest

# Set environment variables for Render
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS="*"

# Use Ollama's built-in serve command directly
CMD ["ollama", "serve"]