FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS="*"

RUN echo '#!/bin/bash\n\
echo "🚀 Starting Ollama service..."\n\
export OLLAMA_HOST=0.0.0.0\n\
export OLLAMA_ORIGINS="*"\n\
ollama serve &\n\
echo "⏳ Waiting for Ollama to start..."\n\
sleep 15\n\
echo "📥 Downloading llama2:7b model..."\n\
ollama pull llama2:7b\n\
echo "✅ Ollama is ready!"\n\
wait' > /start.sh && chmod +x /start.sh

EXPOSE $PORT
CMD ["/start.sh"]