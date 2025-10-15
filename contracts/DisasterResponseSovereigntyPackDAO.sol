// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterResponseSovereigntyPackDAO {
    address public admin;

    struct ResponseEntry {
        string disasterType;
        string sovereigntyClause;
        string emotionalTag;
        bool deployed;
    }

    ResponseEntry[] public responses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitResponse(string memory _disasterType, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        responses.push(ResponseEntry(_disasterType, _sovereigntyClause, _emotionalTag, false));
    }

    function deployResponse(uint256 index) external onlyAdmin {
        responses[index].deployed = true;
    }

    function getResponse(uint256 index) external view returns (ResponseEntry memory) {
        return responses[index];
    }
}
