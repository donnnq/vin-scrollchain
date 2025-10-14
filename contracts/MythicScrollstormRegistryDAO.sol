// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MythicScrollstormRegistryDAO {
    address public admin;

    struct Scrollstorm {
        string title;
        string corridor;
        string emotionalTag;
        bool archived;
    }

    Scrollstorm[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerScrollstorm(string memory _title, string memory _corridor, string memory _emotionalTag) external onlyAdmin {
        registry.push(Scrollstorm(_title, _corridor, _emotionalTag, false));
    }

    function archiveScrollstorm(uint256 index) external onlyAdmin {
        registry[index].archived = true;
    }

    function getScrollstorm(uint256 index) external view returns (Scrollstorm memory) {
        return registry[index];
    }
}
