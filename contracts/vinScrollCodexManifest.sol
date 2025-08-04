// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinScrollCodexManifest {
    address public codexCurator;

    struct ScrollEntry {
        string name;
        string purpose;
        address deployedAt;
        string ritualTag;
        uint256 timestamp;
    }

    ScrollEntry[] public scrolls;
    mapping(string => uint256) public nameToIndex;

    event ScrollRegistered(string name, address indexed deployedAt, string tag);
    event ScrollTagged(string name, string newTag);

    modifier onlyCurator() {
        require(msg.sender == codexCurator, "Not codex curator");
        _;
    }

    constructor() {
        codexCurator = msg.sender;
    }

    function registerScroll(
        string calldata name,
        string calldata purpose,
        address deployedAt,
        string calldata ritualTag
    ) external onlyCurator {
        require(nameToIndex[name] == 0, "Already registered");

        scrolls.push(ScrollEntry({
            name: name,
            purpose: purpose,
            deployedAt: deployedAt,
            ritualTag: ritualTag,
            timestamp: block.timestamp
        }));

        nameToIndex[name] = scrolls.length;
        emit ScrollRegistered(name, deployedAt, ritualTag);
    }

    function tagScroll(string calldata name, string calldata newTag) external onlyCurator {
        uint256 index = nameToIndex[name];
        require(index > 0, "Scroll not found");
        scrolls[index - 1].ritualTag = newTag;
        emit ScrollTagged(name, newTag);
    }

    function getScrollByName(string calldata name) external view returns (
        string memory, string memory, address, string memory, uint256
    ) {
        uint256 index = nameToIndex[name];
        require(index > 0, "Scroll not found");
        ScrollEntry memory entry = scrolls[index - 1];
        return (
            entry.name,
            entry.purpose,
            entry.deployedAt,
            entry.ritualTag,
            entry.timestamp
        );
    }

    function totalScrolls() external view returns (uint256) {
        return scrolls.length;
    }
}
