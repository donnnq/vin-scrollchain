contract vinTemporalRepeatOffender {
    struct Offense {
        address violator;
        uint256 strikeCount;
        uint256 lastTimestamp;
    }

    mapping(address => Offense) public records;
    event RepeatFlagged(address indexed violator, uint256 strikeCount, string action);

    function logStrike(address violator) public {
        Offense storage o = records[violator];
        o.strikeCount += 1;
        o.lastTimestamp = block.timestamp;
        string memory action = escalate(o.strikeCount);
        emit RepeatFlagged(violator, o.strikeCount, action);
    }

    function escalate(uint256 count) internal pure returns (string memory) {
        if (count >= 5) return "Automatic indictment trigger";
        if (count >= 3) return "Audit lockdown and fine";
        return "Civic warning";
    }
}
