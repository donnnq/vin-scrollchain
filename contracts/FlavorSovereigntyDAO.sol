// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorSovereigntyDAO {
    address public admin;

    struct FlavorEntry {
        string dishLabel;
        string sovereigntyClause;
        string emotionalTag;
        bool protected;
    }

    FlavorEntry[] public flavors;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _dishLabel, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        flavors.push(FlavorEntry(_dishLabel, _sovereigntyClause, _emotionalTag, false));
    }

    function markProtected(uint256 index) external onlyAdmin {
        flavors[index].protected = true;
    }

    function getEntry(uint256 index) external view returns (FlavorEntry memory) {
        return flavors[index];
    }
}
