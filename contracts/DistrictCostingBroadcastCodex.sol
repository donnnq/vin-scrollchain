// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DistrictCostingBroadcastCodex {
    address public admin;

    struct BroadcastClause {
        string districtLabel;
        string costingMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory districtLabel, string memory costingMessage, string memory emotionalTag) external onlyAdmin {
        clauses.push(BroadcastClause(districtLabel, costingMessage, emotionalTag, false));
    }

    function airClause(uint256 index) external onlyAdmin {
        clauses[index].aired = true;
    }

    function getClause(uint256 index) external view returns (BroadcastClause memory) {
        return clauses[index];
    }
}
