// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PensionBillAuditCodex {
    address public admin;

    struct BillEntry {
        string billName;
        string chamber;
        string sponsor;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    BillEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBillAudit(string memory billName, string memory chamber, string memory sponsor, string memory emotionalTag) external onlyAdmin {
        entries.push(BillEntry(billName, chamber, sponsor, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealBillEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getBillEntry(uint256 index) external view returns (BillEntry memory) {
        return entries[index];
    }
}
