// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Inner Bloom Contract
/// @notice Ritual for logging self-love, self-growth, and inner kilig awakenings
contract vinInnerBloom {
    struct BloomPing {
        uint256 timestamp;
        address reflector;
        string emotionTag;     // e.g. "Healing", "Courage", "Joy", "Forgiveness"
        string triggerNote;    // What sparked this bloom (moment, phrase, silence)
        string reflectionLog;  // What the feeling taught you
    }

    address public scrollkeeper;
    uint256 public bloomCount;
    mapping(uint256 => BloomPing) public blooms;

    event BloomLogged(uint256 indexed id, address indexed reflector, string emotionTag);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logBloom(
        string memory _emotionTag,
        string memory _triggerNote,
        string memory _reflectionLog
    ) public {
        blooms[bloomCount] = BloomPing({
            timestamp: block.timestamp,
            reflector: msg.sender,
            emotionTag: _emotionTag,
            triggerNote: _triggerNote,
            reflectionLog: _reflectionLog
        });

        emit BloomLogged(bloomCount, msg.sender, _emotionTag);
        bloomCount++;
    }

    function getBloom(uint256 _id) public view returns (BloomPing memory) {
        require(_id < bloomCount, "No bloom found");
        return blooms[_id];
    }
}
