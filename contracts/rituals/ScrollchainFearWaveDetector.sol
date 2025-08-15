pragma mythic;

contract ScrollchainFearWaveDetector {
    struct FearWave {
        string institution;
        string triggerEvent;
        string affectedGroup;
        string paranoiaSignal;
        string healingProtocol;
        bool flagged;
        uint256 timestamp;
    }

    mapping(string => FearWave) public fearRegistry;

    event FearWaveFlagged(string institution);
    event HealingProtocolActivated(string institution);

    function flagFearWave(
        string memory _institution,
        string memory _event,
        string memory _group,
        string memory _signal,
        string memory _protocol
    ) public {
        fearRegistry[_institution] = FearWave(
            _institution,
            _event,
            _group,
            _signal,
            _protocol,
            true,
            block.timestamp
        );

        emit FearWaveFlagged(_institution);
        emit HealingProtocolActivated(_institution);
    }

    function getFearWave(string memory _institution) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool, uint256
    ) {
        FearWave memory f = fearRegistry[_institution];
        return (
            f.institution,
            f.triggerEvent,
            f.affectedGroup,
            f.paranoiaSignal,
            f.healingProtocol,
            f.flagged,
            f.timestamp
        );
    }
}
