

echoExec() {
    echo "$@";
    eval "$@";
}


checkDir() {
    DIR_PATH="$1"
    if [ "$#" -gt 1 ]; then
        mkdir -p $DIR_PATH
    fi

    if [ ! -w "$DIR_PATH" ]; then # Source path is not writable 
        echo >&2 "Error: Either directory $DIR_PATH does not exists or does not have write permissions."
        exit 1
    fi
}

messageHighlited() {
    echo ============================================================
    echo "$@"
    echo ------------------------------------------------------------
}

getSrc() {
    source config.sh
    case $DOWNLOAD_METHOD in
    git)
        ;;
    wget)
        #echoExec wget -P $SRC_PATH ${DOWNLOAD_LOCATION}$DOWNLOAD_NAME
        echoExec wget -O $SRC_PATH/$DOWNLOAD_NAME ${DOWNLOAD_LOCATION}$DOWNLOAD_NAME
        ;;
    esac
}

extractSrc() {
    source config.sh
    if [ "$DOWNLOAD_METHOD" == "git" ]; then # No extraction needed
        return
    fi

    case $DOWNLOAD_TYPE in
    .tar.bz2 | .tbz2)
        echoExec tar xjf $SRC_PATH/$DOWNLOAD_NAME -C $SRC_PATH/
        ;;
    .tar.gz | .tgz)
        echoExec tar xzf $SRC_PATH/$DOWNLOAD_NAME -C $SRC_PATH/
        ;;
    .tar)
        echoExec tar xf $SRC_PATH/$DOWNLOAD_NAME -C $SRC_PATH/
        ;;
    esac

    if [ "$SRC_DIR_NAME" != "$SRC_NAME" ]; then
        \rm -rf $SRC_PATH/$SRC_DIR_NAME
        mv $SRC_PATH/$SRC_NAME $SRC_PATH/$SRC_DIR_NAME
    fi
}

