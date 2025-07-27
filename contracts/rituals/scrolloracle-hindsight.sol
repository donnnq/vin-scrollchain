contract ScrollOracleHindsight {
    mapping(address => string[]) public wisdomLogs;
    event TruthRevealed(address indexed seeker, string message);

    function logMistake(address seeker, string memory regretPhrase) external {
        wisdomLogs[seeker].push(regretPhrase);
        emit TruthRevealed(seeker, string(abi.encodePacked("Next time: ", regretPhrase)));
    }
}
