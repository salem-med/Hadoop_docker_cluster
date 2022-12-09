import os
import subprocess as sp


# Install kubectl

if os.name == 'nt':
    # install chocolatey then kubectl
    command = 'powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex" && choco install kubernetes-cli --force'

    result = sp.run(command, capture_output=True, shell=True)
else:
    command = 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"; sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl'
    result = sp.run(command, capture_output=True, shell=True)

if result.returncode != 0:
    print("An error occured: %s", result.stderr)
else:
    print(result.stdout.decode())
    print("Please check if kubectl was installed correctly by executing : kubectl version --client")

