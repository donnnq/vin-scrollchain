// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AllClassMealInclusionProtocolDAO {
    address public admin;

    struct InclusionEntry {
        string workerClass;
        string mealClause;
        string emotionalTag;
        bool deployed;
    }

    InclusionEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerClass, string memory _mealClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(InclusionEntry(_workerClass, _mealClause, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        protocols[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (InclusionEntry memory) {
        return protocols[index];
    }
}
