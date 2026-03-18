// UncertaintyLoggingSafeguards.sol
pragma solidity ^0.8.0;

contract UncertaintyLoggingSafeguards {
    struct Log {
        uint256 id;
        string context;     // e.g. "Data gap in analysis"
        string note;        // e.g. "Confidence low, flagged uncertainty"
        uint256 timestamp;
    }

    uint256 public logCount;
    mapping(uint256 => Log) public logs;

    event UncertaintyLogged(uint256 id, string context, string note);

    function logUncertainty(string memory context, string memory note) public {
        logCount++;
        logs[logCount] = Log(logCount, context, note, block.timestamp);
        emit UncertaintyLogged(logCount, context, note);
    }
}
