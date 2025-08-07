contract vinWorkerLegacySigilRenderer {
    struct Worker {
        address wallet;
        string name;
        uint256 performanceScore;
        string legacyMessage;
        string sigilHash;
    }

    mapping(address => Worker) public workers;

    event SigilRendered(address indexed worker, string sigilHash);
    event LegacyUpdated(address indexed worker, string message);

    function registerWorker(address _wallet, string memory _name) public {
        workers[_wallet] = Worker(_wallet, _name, 0, "", "");
    }

    function updatePerformance(address _wallet, uint256 _score) public {
        require(_score <= 100, "Score must be between 0 and 100");
        workers[_wallet].performanceScore = _score;
    }

    function setLegacyMessage(address _wallet, string memory _message) public {
        workers[_wallet].legacyMessage = _message;
        emit LegacyUpdated(_wallet, _message);
    }

    function renderSigil(address _wallet) public {
        Worker storage w = workers[_wallet];
        w.sigilHash = generateSigil(w.name, w.performanceScore, w.legacyMessage);
        emit SigilRendered(_wallet, w.sigilHash);
    }

    function generateSigil(string memory name, uint256 score, string memory message) internal pure returns (string memory) {
        return string(abi.encodePacked("SIGIL-", name, "-", uint2str(score), "-", message));
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        return string(bstr);
    }
}
