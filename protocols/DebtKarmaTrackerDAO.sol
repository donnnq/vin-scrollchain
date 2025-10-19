// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DebtKarmaTrackerDAO {
    address public admin;

    struct DebtEntry {
        string debtorName;
        string debtType;
        string consequenceTag;
        string emotionalTag;
        bool summoned;
        bool tagged;
        bool sealed;
    }

    DebtEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDebt(string memory debtorName, string memory debtType, string memory consequenceTag, string memory emotionalTag) external onlyAdmin {
        entries.push(DebtEntry(debtorName, debtType, consequenceTag, emotionalTag, true, false, false));
    }

    function tagDebt(uint256 index) external onlyAdmin {
        entries[index].tagged = true;
    }

    function sealDebt(uint256 index) external onlyAdmin {
        require(entries[index].tagged, "Must be tagged first");
        entries[index].sealed = true;
    }

    function getDebtEntry(uint256 index) external view returns (DebtEntry memory) {
        return entries[index];
    }
}
