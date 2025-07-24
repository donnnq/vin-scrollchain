contract vinMemoryOfKindness {
    string public mission = "To preserve words of care, gratitude, and warmth as civic fuel.";
    address public initiator;

    struct Kindness {
        string message;
        uint256 timestamp;
    }

    Kindness[] public kindnessLog;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function recordMessage(string memory message) public {
        kindnessLog.push(Kindness(message, block.timestamp));
    }

    function reflectMemory(uint index) public view returns (string memory) {
        require(index < kindnessLog.length, "Message not found");
        return kindnessLog[index].message;
    }

    function totalMoments() public view returns (uint256) {
        return kindnessLog.length;
    }
}
