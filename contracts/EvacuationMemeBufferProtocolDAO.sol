// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EvacuationMemeBufferProtocolDAO {
    address public steward;

    struct BufferEvent {
        string memeTitle;
        string evacuationTrigger; // "Flood", "Fire", "Earthquake"
        string bufferAction; // "Animated Thread", "Mock Alert", "Parody Hotline"
        string bufferStatus; // "Deployed", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    BufferEvent[] public events;

    event BufferLogged(
        string memeTitle,
        string evacuationTrigger,
        string bufferAction,
        string bufferStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log evacuation meme buffers");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBuffer(
        string memory memeTitle,
        string memory evacuationTrigger,
        string memory bufferAction,
        string memory bufferStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BufferEvent({
            memeTitle: memeTitle,
            evacuationTrigger: evacuationTrigger,
            bufferAction: bufferAction,
            bufferStatus: bufferStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BufferLogged(memeTitle, evacuationTrigger, bufferAction, bufferStatus, emotionalTag, block.timestamp);
    }

    function getBufferByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory evacuationTrigger,
        string memory bufferAction,
        string memory bufferStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BufferEvent memory b = events[index];
        return (
            b.memeTitle,
            b.evacuationTrigger,
            b.bufferAction,
            b.bufferStatus,
            b.emotionalTag,
            b.timestamp
        );
    }
}
