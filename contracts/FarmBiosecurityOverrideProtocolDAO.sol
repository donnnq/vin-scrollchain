// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmBiosecurityOverrideProtocolDAO {
    address public admin;

    struct ProtocolEntry {
        string farmName;
        string overrideClause;
        string emotionalTag;
        bool activated;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _farmName, string memory _overrideClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_farmName, _overrideClause, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
