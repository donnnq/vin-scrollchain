// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CybersecurityChoreographyProtocol {
    address public admin;

    struct ProtocolEntry {
        string systemLabel;
        string threatVector;
        string emotionalTag;
        bool deployed;
        bool neutralized;
    }

    ProtocolEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory systemLabel, string memory threatVector, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtocolEntry(systemLabel, threatVector, emotionalTag, false, false));
    }

    function deployProtocol(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function neutralizeThreat(uint256 index) external onlyAdmin {
        entries[index].neutralized = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return entries[index];
    }
}
