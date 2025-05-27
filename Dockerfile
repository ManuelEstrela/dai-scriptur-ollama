FROM ollama/ollama:latest

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS="*"

# Create the startup script properly
RUN echo '#!/bin/bash' > /start.sh && \
    echo 'echo "🚀 Starting Ollama service..."' >> /start.sh && \
    echo 'export OLLAMA_HOST=0.0.0.0' >> /start.sh && \
    echo 'export OLLAMA_ORIGINS="*"' >> /start.sh && \
    echo 'ollama serve &' >> /start.sh && \
    echo 'echo "⏳ Waiting for Ollama to start..."' >> /start.sh && \
    echo 'sleep 15' >> /start.sh && \
    echo 'echo "📥 Downloading llama2:7b model..."' >> /start.sh && \
    echo 'ollama pull llama2:7b' >> /start.sh && \
    echo 'echo "✅ Ollama is ready!"' >> /start.sh && \
    echo 'wait' >> /start.sh && \
    chmod +x /start.sh

# Expose port (Render will set the PORT environment variable)
EXPOSE $PORT

# Run the startup script
CMD ["/start.sh"]