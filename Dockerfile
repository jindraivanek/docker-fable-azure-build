FROM vbfox/fable-build:stretch

RUN dotnet tool install fake-cli -g
RUN dotnet tool install paket -g
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN npm -g config set user root
RUN npm install -g azure-functions-core-tools
RUN apt-get update && apt-get install -y curl apt-transport-https lsb-release gnupg
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN AZ_REPO=$(lsb_release -cs) && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update && apt-get install -y azure-cli