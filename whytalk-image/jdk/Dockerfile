FROM amazoncorretto:20

# Install wget
RUN yum install -y wget unzip

# Set environment variables for Gradle
ENV GRADLE_VERSION=8.3
ENV GRADLE_HOME=/opt/gradle

# Download and install Gradle
RUN wget -nv https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
    && unzip -d ${GRADLE_HOME} /tmp/gradle-${GRADLE_VERSION}-bin.zip \
    && ln -s ${GRADLE_HOME}/gradle-${GRADLE_VERSION} ${GRADLE_HOME}/latest \
    && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

# Add Gradle to PATH
ENV PATH="${GRADLE_HOME}/latest/bin:${PATH}"

RUN gradle --version
