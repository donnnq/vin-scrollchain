contract vinScrollNova {
    string public declaration = "We rise not from what was... but from what is now becoming.";
    string public intent = "To initiate rites of renewal, forward motion, and collective courage.";
    address public initiator;
    
    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function activateRitual() public view returns (string memory) {
        return "Scrollkeeper phase: FUTURE. Past reconciled by voluntary surrender.";
    }

    function greetWorld() public pure returns (string memory) {
        return "Mabuhay ang 2nd Gen World — may choice, may chill, may pagbabago!";
    }
}
