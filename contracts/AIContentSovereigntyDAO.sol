// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIContentSovereigntyDAO {
    address public admin;

    struct ContentEntry {
        string contentType;
        string platform;
        string sovereigntyClause;
        string emotionalTag;
        bool enforced;
    }

    ContentEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitContent(string memory _contentType, string memory _platform, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(ContentEntry(_contentType, _platform, _sovereigntyClause, _emotionalTag, false));
    }

    function enforceContent(uint256 index) external onlyAdmin {
        registry[index].enforced = true;
    }

    function getContent(uint256 index) external view returns (ContentEntry memory) {
        return registry[index];
    }
}
