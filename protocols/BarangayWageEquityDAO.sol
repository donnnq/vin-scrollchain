// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWageEquityDAO {
    address public admin;

    struct WageEntry {
        string barangayName;
        string purokID;
        string sector;
        string wageAdjustmentType;
        string emotionalTag;
        bool summoned;
        bool adjusted;
        bool sealed;
    }

    WageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWage(string memory barangayName, string memory purokID, string memory sector, string memory wageAdjustmentType, string memory emotionalTag) external onlyAdmin {
        entries.push(WageEntry(barangayName, purokID, sector, wageAdjustmentType, emotionalTag, true, false, false));
    }

    function confirmAdjustment(uint256 index) external onlyAdmin {
        entries[index].adjusted = true;
    }

    function sealWage(uint256 index) external onlyAdmin {
        require(entries[index].adjusted, "Must be adjusted first");
        entries[index].sealed = true;
    }

    function getWageEntry(uint256 index) external view returns (WageEntry memory) {
        return entries[index];
    }
}
