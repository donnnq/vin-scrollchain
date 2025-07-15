// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollUpdateLog {
    struct UpdateEntry {
        string version;
        string summary;
        string impact;
        uint256 timestamp;
        address author;
    }

    UpdateEntry[] public updates;
    mapping(address => uint256[]) public authorToUpdates;

    event UpdatePosted(string version, string summary, address indexed author);

    function postUpdate(
        string calldata version,
        string calldata summary,
        string calldata impact
    ) external {
        updates.push(UpdateEntry(version, summary, impact, block.timestamp, msg.sender));
        authorToUpdates[msg.sender].push(updates.length - 1);
        emit UpdatePosted(version, summary, msg.sender);
    }

    function getUpdate(uint256 index) external view returns (string memory, string memory, string memory, uint256, address) {
        UpdateEntry memory u = updates[index];
        return (u.version, u.summary, u.impact, u.timestamp, u.author);
    }

    function totalUpdates() external view returns (uint256) {
        return updates.length;
    }
}
