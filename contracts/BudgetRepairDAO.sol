// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetRepairDAO {
    address public admin;

    struct RepairEntry {
        string fundLabel;
        string repairClause;
        string emotionalTag;
        bool patched;
    }

    RepairEntry[] public repairs;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRepair(string memory _fundLabel, string memory _repairClause, string memory _emotionalTag) external onlyAdmin {
        repairs.push(RepairEntry(_fundLabel, _repairClause, _emotionalTag, false));
    }

    function markPatched(uint256 index) external onlyAdmin {
        repairs[index].patched = true;
    }

    function getRepair(uint256 index) external view returns (RepairEntry memory) {
        return repairs[index];
    }
}
