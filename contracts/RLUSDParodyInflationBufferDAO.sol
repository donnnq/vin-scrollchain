// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RLUSDParodyInflationBufferDAO {
    address public steward;

    struct BufferEvent {
        string parodyTitle;
        string inflationTrigger; // "Vault Surge", "Stablecoin Mint", "Yield Spike"
        string bufferAction; // "Mock CPI Chart", "Satirical PSA", "Animated Thread"
        string bufferStatus; // "Deployed", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    BufferEvent[] public events;

    event BufferLogged(
        string parodyTitle,
        string inflationTrigger,
        string bufferAction,
        string bufferStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log RLUSD parody inflation buffers");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBuffer(
        string memory parodyTitle,
        string memory inflationTrigger,
        string memory bufferAction,
        string memory bufferStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BufferEvent({
            parodyTitle: parodyTitle,
            inflationTrigger: inflationTrigger,
            bufferAction: bufferAction,
            bufferStatus: bufferStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BufferLogged(parodyTitle, inflationTrigger, bufferAction, bufferStatus, emotionalTag, block.timestamp);
    }

    function getBufferByIndex(uint256 index) external view returns (
        string memory parodyTitle,
        string memory inflationTrigger,
        string memory bufferAction,
        string memory bufferStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BufferEvent memory b = events[index];
        return (
            b.parodyTitle,
            b.inflationTrigger,
            b.bufferAction,
            b.bufferStatus,
            b.emotionalTag,
            b.timestamp
        );
    }
}
