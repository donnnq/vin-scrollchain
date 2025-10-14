// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FederalStateCrisisBroadcastRegistryDAO {
    address public admin;

    struct BroadcastEntry {
        string speaker;
        string crisisMessage;
        string platform;
        string emotionalTag;
        bool archived;
    }

    BroadcastEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _speaker, string memory _crisisMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        registry.push(BroadcastEntry(_speaker, _crisisMessage, _platform, _emotionalTag, false));
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        registry[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return registry[index];
    }
}
