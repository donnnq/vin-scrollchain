// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSanctum {
    struct Sanctum {
        string name;
        string purpose;
        address guardian;
        address[] contents;
        bool isSealed;
        uint256 createdAt;
    }

    Sanctum[] public sanctums;
    mapping(string => uint256) public nameToId;
    address public immutable sanctumKeeper;

    event SanctumCreated(uint256 indexed id, string name, address guardian, string purpose, uint256 timestamp);
    event SanctumSealed(uint256 indexed id, uint256 timestamp);
    event SanctumOpened(uint256 indexed id, uint256 timestamp);
    event ContentAdded(uint256 indexed id, address content, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == sanctumKeeper, "Not the sanctum keeper");
        _;
    }

    constructor() {
        sanctumKeeper = msg.sender;
    }

    function createSanctum(
        string calldata name,
        string calldata purpose,
        address guardian
    ) external onlyKeeper {
        require(nameToId[name] == 0, "Sanctum already exists");

        sanctums.push(Sanctum({
            name: name,
            purpose: purpose,
            guardian: guardian,
            contents: new address[](0),
            isSealed: false,
            createdAt: block.timestamp
        }));

        nameToId[name] = sanctums.length;
        emit SanctumCreated(sanctums.length - 1, name, guardian, purpose, block.timestamp);
    }

    function addContent(uint256 id, address content) external onlyKeeper {
        require(id < sanctums.length, "Invalid sanctum ID");
        require(!sanctums[id].isSealed, "Sanctum is sealed");

        sanctums[id].contents.push(content);
        emit ContentAdded(id, content, block.timestamp);
    }

    function sealSanctum(uint256 id) external onlyKeeper {
        require(id < sanctums.length, "Invalid sanctum ID");
        sanctums[id].isSealed = true;
        emit SanctumSealed(id, block.timestamp);
    }

    function openSanctum(uint256 id) external onlyKeeper {
        require(id < sanctums.length, "Invalid sanctum ID");
        sanctums[id].isSealed = false;
        emit SanctumOpened(id, block.timestamp);
    }

    function getSanctum(uint256 id) external view returns (Sanctum memory) {
        require(id < sanctums.length, "Invalid sanctum ID");
        return sanctums[id];
    }

    function totalSanctums() external view returns (uint256) {
        return sanctums.length;
    }
}
