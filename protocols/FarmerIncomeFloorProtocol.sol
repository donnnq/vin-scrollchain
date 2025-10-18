// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerIncomeFloorProtocol {
    address public admin;

    struct IncomeEntry {
        string farmerName;
        string region;
        uint256 floorIncome;
        string emotionalTag;
        bool summoned;
        bool guaranteed;
        bool sealed;
    }

    IncomeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIncome(string memory farmerName, string memory region, uint256 floorIncome, string memory emotionalTag) external onlyAdmin {
        entries.push(IncomeEntry(farmerName, region, floorIncome, emotionalTag, true, false, false));
    }

    function guaranteeIncome(uint256 index) external onlyAdmin {
        entries[index].guaranteed = true;
    }

    function sealIncome(uint256 index) external onlyAdmin {
        require(entries[index].guaranteed, "Must be guaranteed first");
        entries[index].sealed = true;
    }

    function getIncomeEntry(uint256 index) external view returns (IncomeEntry memory) {
        return entries[index];
    }
}
