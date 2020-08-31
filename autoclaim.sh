LOGFILE="$HOME/claim_log.txt"

WALLET_PWD="PW5JJQWPyMN68y7ZdtGPww1EMuzHq5JY9Q63p39tXeASm7xSLimLD" #ubah dengan password wallet kamu
BROADCASTER_NODE="https://explorer.vexanium.com:6960"
BLOCKPRODUCER_NAME="bpkamu" #nama bp kamu

claim() {
    if [ ! -f "$LOGFILE" ]
    then
        touch $LOGFILE
    fi

    echo $'\r\n' >> $LOGFILE 2>&1
    date >> $LOGFILE 2>&1
    ./cleos wallet unlock -n bpkamu --password $WALLET_PWD >> $LOGFILE 2>&1
    ./cleos --url $BROADCASTER_NODE system claimrewards $BLOCKPRODUCER_NAME >> $LOGFILE 2>&1
    ./cleos wallet lock -n bpkamu >> $LOGFILE 2>&1
}