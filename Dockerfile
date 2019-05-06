FROM vbfox/fable-build:stretch

RUN dotnet tool install fake-cli -g
RUN dotnet tool install paket -g
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN npm -g config set user root
RUN npm install -g azure-functions-core-tools
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
