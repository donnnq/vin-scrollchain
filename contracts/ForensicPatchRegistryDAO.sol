// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForensicPatchRegistryDAO {
    address public admin;

    struct PatchEntry {
        string vendorLabel;
        string forensicClause;
        string emotionalTag;
        bool verified;
    }

    PatchEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _vendorLabel, string memory _forensicClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(PatchEntry(_vendorLabel, _forensicClause, _emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        registry[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (PatchEntry memory) {
        return registry[index];
    }
}
