// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinDeepfakeSentinel {
    address public sentinelGuardian;

    struct Signal {
        uint256 timestamp;
        string source;
        string mediaType;
        string threatLevel;
        string description;
    }

    mapping(bytes32 => Signal) public flaggedSignals;
    mapping(address => bool) public flaggedSubmitters;

    event DeepfakeFlagged(bytes32 indexed contentHash, string threatLevel, string source);
    event SubmitterBlacklisted(address indexed submitter);

    modifier onlyGuardian() {
        require(msg.sender == sentinelGuardian, "Unauthorized sentinel access");
        _;
    }

    constructor() {
        sentinelGuardian = msg.sender;
    }

    function flagDeepfake(
        bytes32 contentHash,
        string memory source,
        string memory mediaType,
        string memory threatLevel,
        string memory description
    ) external onlyGuardian {
        flaggedSignals[contentHash] = Signal({
            timestamp: block.timestamp,
            source: source,
            mediaType: mediaType,
            threatLevel: threatLevel,
            description: description
        });

        emit DeepfakeFlagged(contentHash, threatLevel, source);
    }

    function blacklistSubmitter(address submitter) external onlyGuardian {
        flaggedSubmitters[submitter] = true;
        emit SubmitterBlacklisted(submitter);
    }

    function isContentFlagged(bytes32 contentHash) external view returns (bool) {
        return flaggedSignals[contentHash].timestamp != 0;
    }

    function isBlacklisted(address submitter) external view returns (bool) {
        return flaggedSubmitters[submitter];
    }
}
