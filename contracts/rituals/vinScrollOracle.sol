// Combines system anomaly tracking with symbolic alerts and response thresholds
contract vinScrollOracle {
    struct Signal {
        string description;
        uint256 timestamp;
        address observer;
    }

    Signal[] public log;
    uint256 public threshold;
    mapping(address => uint256) public alertScore;

    event SignalLogged(string description, uint256 indexed timestamp, address indexed observer);
    event DignityThresholdCrossed(address indexed observer, uint256 score);

    constructor(uint256 _threshold) {
        threshold = _threshold;
    }

    function recordSignal(string memory _description) public {
        log.push(Signal(_description, block.timestamp, msg.sender));
        alertScore[msg.sender]++;
        emit SignalLogged(_description, block.timestamp, msg.sender);

        if (alertScore[msg.sender] >= threshold) {
            emit DignityThresholdCrossed(msg.sender, alertScore[msg.sender]);
        }
    }

    function getSignalsBy(address _observer) public view returns (Signal[] memory) {
        uint256 count;
        for (uint i = 0; i < log.length; i++) {
            if (log[i].observer == _observer) count++;
        }

        Signal[] memory filtered = new Signal[](count);
        uint256 idx;
        for (uint i = 0; i < log.length; i++) {
            if (log[i].observer == _observer) {
                filtered[idx] = log[i];
                idx++;
            }
        }
        return filtered;
    }
}
