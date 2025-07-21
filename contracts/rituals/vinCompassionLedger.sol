// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Compassion Ledger
/// @notice Logs moments of human kindness, deep listening, and soul-based support rituals
contract vinCompassionLedger {
    struct CompassionPing {
        uint256 timestamp;
        address witness;
        string subject;
        string action;         // "Listened", "Loved", "Helped", "Understood"
        string emotionNote;    // Personal interpretation of the act
        string locationHint;   // Optional: symbolic or physical place
    }

    address public scrollkeeper;
    uint256 public actCount;
    mapping(uint256 => CompassionPing) public records;

    event CompassionRecorded(uint256 indexed id, address indexed witness, string subject, string action);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function recordCompassion(
        string memory _subject,
        string memory _action,
        string memory _emotionNote,
        string memory _locationHint
    ) public {
        records[actCount] = CompassionPing({
            timestamp: block.timestamp,
            witness: msg.sender,
            subject: _subject,
            action: _action,
            emotionNote: _emotionNote,
            locationHint: _locationHint
        });

        emit CompassionRecorded(actCount, msg.sender, _subject, _action);
        actCount++;
    }

    function getRecord(uint256 _id) public view returns (CompassionPing memory) {
        require(_id < actCount, "No compassion scroll found");
        return records[_id];
    }
}
