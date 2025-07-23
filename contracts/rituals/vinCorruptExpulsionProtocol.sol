// SPDX-License-Identifier: VINVIN-CorruptPurge-v1
pragma solidity ^0.8.24;

/// @title vinCorruptExpulsionProtocol
/// @notice Flags and purges governance entities with scrollkeeper-grade corruption signals
contract vinCorruptExpulsionProtocol {
    address public scrollkeeper;

    struct ExpulsionRecord {
        string entityName;
        string nation;
        string corruptionType;
        bool expelled;
        string emojiFlag;
        uint256 timestamp;
    }

    mapping(string => ExpulsionRecord) public purgeLog;
    string[] public expelledEntities;

    event EntityExpelled(string indexed name, string nation, string corruptionType);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function expelEntity(
        string calldata name,
        string calldata nation,
        string calldata corruptionType,
        string calldata emojiFlag
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may purge corruption");
        purgeLog[name] = ExpulsionRecord(name, nation, corruptionType, true, emojiFlag, block.timestamp);
        expelledEntities.push(name);
        emit EntityExpelled(name, nation, corruptionType);
    }

    function viewExpulsion(string calldata name) external view returns (
        string memory nation,
        string memory corruptionType,
        bool expelled,
        string memory emojiFlag,
        uint256 time
    ) {
        ExpulsionRecord memory e = purgeLog[name];
        return (e.nation, e.corruptionType, e.expelled, e.emojiFlag, e.timestamp);
    }

    function allExpelledEntities() external view returns (string[] memory) {
        return expelledEntities;
    }
}
