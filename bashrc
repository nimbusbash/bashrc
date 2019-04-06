#########################################
#              ENVIRONMENT              #
#########################################
#PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH
PATH_ORIGIN="${PATH}"
if [ -e "${HOME}/bin" ] ; then
    PATH_ORIGIN="${PATH_ORIGIN}:${HOME}/bin"
fi

########
OS=$(uname -s)
ARCH=$(uname -m)
case "$OS" in
Linux*)
    JAVA_HOME="/usr/lib/jvm/java-8-oracle"
    ANDROID_SDK_HOME="${HOME}/android/sdk"
    ANDROID_NDK_HOME="${ANDROID_SDK_HOME}/ndk-bundle"
    ;;
Darwin*)
    JAVA_HOME=$(/usr/libexec/java_home)
    ANDROID_SDK_HOME="${HOME}/Library/Android/sdk"
    ANDROID_NDK_HOME="${ANDROID_SDK_HOME}/ndk-bundle"
    ;;
esac
export JAVA_HOME=${JAVA_HOME}
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=${JAVA_HOME}/lib:${JRE_HOME}/lib:${CLASSPATH}
export PATH_EXTRA=${JAVA_HOME}/bin:${JRE_HOME}/bin

########
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

########
export ANDROID_HOME=${ANDROID_SDK_HOME}
export ANDROID_SDK=${ANDROID_SDK_HOME}
export ANDROID_NDK=${ANDROID_NDK_HOME}
export ANDROID_SDK_ROOT=${ANDROID_SDK_HOME}
export ANDROID_NDK_ROOT=${ANDROID_NDK_HOME}
export PATH_EXTRA="${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:${PATH_EXTRA}"
export PATH_EXTRA="${ANDROID_NDK_HOME}:${PATH_EXTRA}"

########
TOOLS_HOME="${HOME}/dev"
if [ -e "${TOOLS_HOME}/ant" ] ; then
    export ANT_HOME="${TOOLS_HOME}/ant"
    export PATH_EXTRA="${ANT_HOME}/bin:${PATH_EXTRA}"
fi
if [ -e "${TOOLS_HOME}/maven" ] ; then
    export MAVEN_HOME="${TOOLS_HOME}/maven"
    export PATH_EXTRA="${MAVEN_HOME}/bin:${PATH_EXTRA}"
fi
if [ -e "${TOOLS_HOME}/gradle" ] ; then
    export GRADLE_HOME="${TOOLS_HOME}/gradle"
    export PATH_EXTRA="${GRADLE_HOME}/bin:${PATH_EXTRA}"
fi

########
export PATH="${PATH_ORIGIN}:${PATH_EXTRA}:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
unset PATH_EXTRA

#########################################
