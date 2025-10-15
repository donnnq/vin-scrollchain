// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFloodResponseDAO {
    address public admin;

    struct ResponseEntry {
        string barangayLabel;
        string responseClause;
        string emotionalTag;
        bool activated;
    }

    ResponseEntry[] public responses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _barangayLabel, string memory _responseClause, string memory _emotionalTag) external onlyAdmin {
        responses.push(ResponseEntry(_barangayLabel, _responseClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        responses[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ResponseEntry memory) {
        return responses[index];
    }
}
