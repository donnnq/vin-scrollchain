// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CrashTriggeredWageBufferDAO {
    address public steward;

    struct BufferEvent {
        string companyName;
        string sector; // "Tech", "BPO", "Retail"
        string crashTrigger; // "Market Slump", "Liquidity Freeze", "Investor Panic"
        string bufferAction; // "Emergency Wage", "Deferred Pay", "Compensation Ritual"
        string emotionalTag;
        uint256 timestamp;
    }

    BufferEvent[] public events;

    event BufferLogged(
        string companyName,
        string sector,
        string crashTrigger,
        string bufferAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log crash-triggered wage buffer rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBuffer(
        string memory companyName,
        string memory sector,
        string memory crashTrigger,
        string memory bufferAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BufferEvent({
            companyName: companyName,
            sector: sector,
            crashTrigger: crashTrigger,
            bufferAction: bufferAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BufferLogged(companyName, sector, crashTrigger, bufferAction, emotionalTag, block.timestamp);
    }

    function getBufferByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory sector,
        string memory crashTrigger,
        string memory bufferAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BufferEvent memory b = events[index];
        return (
            b.companyName,
            b.sector,
            b.crashTrigger,
            b.bufferAction,
            b.emotionalTag,
            b.timestamp
        );
    }
}
