// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoanFraudCodex {
    address public admin;

    struct FraudEntry {
        string institution;
        string fraudActor;
        string exposureAmount;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    FraudEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFraud(string memory institution, string memory fraudActor, string memory exposureAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(FraudEntry(institution, fraudActor, exposureAmount, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealFraudEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getFraudEntry(uint256 index) external view returns (FraudEntry memory) {
        return entries[index];
    }
}
