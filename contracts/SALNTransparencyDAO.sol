// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SALNTransparencyDAO {
    address public admin;

    struct SALNEntry {
        string officialName;
        string accessClause;
        string emotionalTag;
        bool published;
    }

    SALNEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSALN(string memory _officialName, string memory _accessClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(SALNEntry(_officialName, _accessClause, _emotionalTag, false));
    }

    function publishSALN(uint256 index) external onlyAdmin {
        registry[index].published = true;
    }

    function getSALN(uint256 index) external view returns (SALNEntry memory) {
        return registry[index];
    }
}
