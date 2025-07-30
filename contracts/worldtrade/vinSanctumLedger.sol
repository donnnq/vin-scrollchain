contract vinSanctumLedger {
    string[] public tradeEchoes;

    event EchoPublished(string entry);

    function publishEcho(string memory entry) public {
        tradeEchoes.push(entry);
        emit EchoPublished(entry);
    }
}
