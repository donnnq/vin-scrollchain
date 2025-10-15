// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenderJusticeBroadcastRegistryDAO {
    address public admin;

    struct BroadcastEntry {
        string speaker;
        string justiceMessage;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _speaker, string memory _justiceMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        registry.push(BroadcastEntry(_speaker, _justiceMessage, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        registry[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return registry[index];
    }
}
