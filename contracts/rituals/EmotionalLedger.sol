// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract EmotionalLedger {
    address public steward;

    struct EmotionalLog {
        uint256 timestamp;
        string ritual;
        string impact;
        address initiator;
    }

    EmotionalLog[] public logs;

    event EmotionalLogged(uint256 indexed timestamp, string ritual, string impact, address indexed initiator);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEmotion(string memory ritual, string memory impact) public onlySteward {
        EmotionalLog memory newLog = EmotionalLog({
            timestamp: block.timestamp,
            ritual: ritual,
            impact: impact,
            initiator: msg.sender
        });

        logs.push(newLog);
        emit EmotionalLogged(block.timestamp, ritual, impact, msg.sender);
    }

    function getLog(uint256 index) public view returns (uint256, string memory, string memory, address) {
        EmotionalLog memory log = logs[index];
        return (log.timestamp, log.ritual, log.impact, log.initiator);
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
