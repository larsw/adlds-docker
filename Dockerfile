FROM microsoft/windowsservercore
LABEL maintainer "lars@sral.org"
EXPOSE 389
RUN NET USER ADLDSSvc 4DLD$$vc2017! /ADD
# /Y because the password is longer than 14 characters, which will cause a warning prompt.
RUN NET USER ADLDSAdmin 4DLD$4dmin2017! /ADD /Y
RUN NET LOCALGROUP "AD LDS Admins" /ADD
RUN NET LOCALGROUP "AD LDS Admins" Administrator /ADD
RUN NET LOCALGROUP "AD LDS Admins" ADLDSAdmin /ADD

SHELL ["powershell"]
RUN Install-WindowsFeature ADLDS
RUN mkdir c:\\adlds -Force
ADD . c:\\adlds\\install
RUN mkdir c:\\adlds\\data -Force
RUN mkdir c:\\adlds\\logs -Force
WORKDIR "c:\\windows\\ADAM"
RUN & .\\adaminstall.exe /answer:"c:\\adlds\\install\\answer.txt"
