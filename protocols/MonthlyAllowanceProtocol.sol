// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MonthlyAllowanceProtocol {
    address public admin;

    struct AllowanceEntry {
        string youthID;
        string barangayName;
        uint256 amount;
        string emotionalTag;
        bool summoned;
        bool disbursed;
        bool sealed;
    }

    AllowanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAllowance(string memory youthID, string memory barangayName, uint256 amount, string memory emotionalTag) external onlyAdmin {
        entries.push(AllowanceEntry(youthID, barangayName, amount, emotionalTag, true, false, false));
    }

    function disburseAllowance(uint256 index) external onlyAdmin {
        entries[index].disbursed = true;
    }

    function sealAllowance(uint256 index) external onlyAdmin {
        require(entries[index].disbursed, "Must be disbursed first");
        entries[index].sealed = true;
    }

    function getAllowanceEntry(uint256 index) external view returns (AllowanceEntry memory) {
        return entries[index];
    }
}
